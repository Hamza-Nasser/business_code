import 'dart:io';

import 'package:business_code/features/card_management/presentation/screens/scan_new_card/components/scan_overlay.dart';
import 'package:business_code/shared/ui/widgets/circular_loading.dart';
import 'package:business_code/shared/ui/widgets/overlays/overlays.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPreviewBody extends StatefulWidget {
  const CameraPreviewBody({super.key, this.onImageCaptured});
  final void Function(File image)? onImageCaptured;

  @override
  State<CameraPreviewBody> createState() => _CameraPreviewBodyState();
}

class _CameraPreviewBodyState extends State<CameraPreviewBody> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  bool _isTakingPicture = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final backCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.back,
    );

    _controller = CameraController(
      backCamera,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    _initializeControllerFuture = _controller!.initialize();
    if (mounted) setState(() {});
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    setState(() => _isTakingPicture = true);

    try {
      final picture = await _controller!.takePicture();
      final file = File(picture.path);

      widget.onImageCaptured?.call(file);

      if (mounted) {
        showSuccessTopOverlay(context, message: "Image captured successfully!");
      }
    } catch (e) {
      debugPrint("Error taking picture: $e");
      if (mounted) {
        showErrorTopOverlay(context, message: "Error taking picture!");
      }
    } finally {
      if (mounted) setState(() => _isTakingPicture = false);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || _initializeControllerFuture == null) {
      return const Center(child: CircularLoading());
    }

    return SafeArea(
      child: FutureBuilder(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Positioned.fill(child: CameraPreview(_controller!)),
                Positioned.fill(child: ScanOverlay()),
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: GestureDetector(
                      onTap: _isTakingPicture ? null : _takePicture,
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          color: _isTakingPicture
                              ? Colors.grey
                              : Colors.white.withAlpha(100),
                        ),
                        child: _isTakingPicture
                            ? const Padding(
                                padding: EdgeInsets.all(16),
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            : const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 32,
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularLoading());
          }
        },
      ),
    );
  }
}
