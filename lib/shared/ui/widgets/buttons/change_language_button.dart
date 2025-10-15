import 'package:business_code/configurations/ui/theme/theme_data.dart';
import 'package:business_code/shared/ui/blocs/localization_bloc/localization_bloc.dart';
import 'package:business_code/shared/ui/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeLanguageButton extends StatelessWidget {
  const ChangeLanguageButton({super.key});

  void _changeLanguage(BuildContext context) {
    final currentLocale = context.read<LocalizationBloc>().state.currentLocale;
    if (currentLocale == Locale("en")) {
      context.read<LocalizationBloc>().add(ChangeLocal(locale: Locale("ar")));
      return;
    }
    context.read<LocalizationBloc>().add(ChangeLocal(locale: Locale("en")));
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    final currentLocale = context.select(
      (LocalizationBloc bloc) => bloc.state.currentLocale,
    );
    return InkWell(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4.0,
        children: [
          ShaderMask(
            key: ValueKey("language-icon"),
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [palette.primary, palette.secondary],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcIn,
            child: Icon(Icons.translate, color: Colors.white),
          ),
          UiText.baseBold(
            currentLocale.languageCode.toUpperCase(),
            color: palette.secondary,
          ),
        ],
      ),
      onTap: () => _changeLanguage(context),
    );
  }
}
