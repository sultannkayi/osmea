// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:admin_dashboard/views/view_onboarding/models/onboarding_view_model.dart'
    as _i117;
import 'package:admin_dashboard/views/view_splash/models/splash_view_model.dart'
    as _i183;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i183.SplashViewModel>(() => _i183.SplashViewModel());
    gh.factory<_i117.OnboardingViewModel>(() => _i117.OnboardingViewModel());
    return this;
  }
}
