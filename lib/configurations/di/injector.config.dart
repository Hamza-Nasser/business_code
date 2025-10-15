// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:business_code/configurations/di/modules/navigator_module.dart'
    as _i543;
import 'package:business_code/configurations/di/modules/network_info_module.dart'
    as _i571;
import 'package:business_code/configurations/navigation/app_navigator.dart'
    as _i568;
import 'package:business_code/core/db/user_database.dart' as _i918;
import 'package:business_code/core/memory_cache/memory_cache.dart' as _i597;
import 'package:business_code/core/network/client/dio_restful_client.dart'
    as _i975;
import 'package:business_code/core/network/client/restful_client.dart' as _i895;
import 'package:business_code/core/network/connection/network_info.dart'
    as _i14;
import 'package:business_code/features/auth/data/mappers/user_dto_mapper.dart'
    as _i424;
import 'package:business_code/features/auth/data/repositories/auth_repo_impl.dart'
    as _i140;
import 'package:business_code/features/auth/domain/repositories/auth_repo.dart'
    as _i635;
import 'package:business_code/features/card_management/data/datasources/local/cards_local_ds.dart'
    as _i551;
import 'package:business_code/features/card_management/data/datasources/local/impl/cards_local_ds_impl.dart'
    as _i495;
import 'package:business_code/features/card_management/data/mappers/card_details_dto_mapper.dart'
    as _i259;
import 'package:business_code/features/card_management/data/repositories/cards_repo_impl.dart'
    as _i533;
import 'package:business_code/features/card_management/domain/repositories/cards_repository.dart'
    as _i72;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final navigatorModule = _$NavigatorModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i597.MemoryCache>(() => _i597.MemoryCache());
    gh.factory<_i424.UserDtoMapper>(() => const _i424.UserDtoMapper());
    gh.factory<_i259.CardDetailsDtoMapper>(() => _i259.CardDetailsDtoMapper());
    gh.singleton<_i568.AppNavigator>(() => navigatorModule.appNavigator);
    gh.singleton<_i918.UserDatabase>(() => _i918.UserDatabase());
    gh.lazySingleton<_i161.InternetConnection>(
      () => networkModule.connectionChecker,
    );
    gh.lazySingleton<_i551.CardsLocalDataSource>(
      () => _i495.CardsLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i895.RestfulClient>(() => _i975.DioRestfulClient());
    gh.singleton<_i14.NetworkInfo>(
      () => _i14.NetworkInfoImpl(gh<_i161.InternetConnection>()),
    );
    gh.singleton<_i635.AuthRepo>(
      () =>
          _i140.AuthRepoImpl(gh<_i14.NetworkInfo>(), gh<_i918.UserDatabase>()),
    );
    gh.lazySingleton<_i72.CardsRepository>(
      () => _i533.CardsRepoImpl(
        gh<_i551.CardsLocalDataSource>(),
        gh<_i597.MemoryCache>(),
        gh<_i259.CardDetailsDtoMapper>(),
      ),
    );
    return this;
  }
}

class _$NavigatorModule extends _i543.NavigatorModule {}

class _$NetworkModule extends _i571.NetworkModule {}
