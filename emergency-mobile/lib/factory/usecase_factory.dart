import 'package:emergency/data/repositories/country_repository.dart';
import 'package:emergency/data/repositories/local/country_local_repository.dart';
import 'package:emergency/data/repositories/remote/country_remote_repository.dart';
import 'package:emergency/data/repositories/remote/networking/api_provider.dart';
import 'package:emergency/data/repositories/remote/networking/auth_plugin.dart';
import 'package:emergency/data/repositories/user_repository.dart';
import 'package:emergency/domain/country_service.dart';
import 'package:emergency/domain/usecases/country_usecase.dart';
import 'package:emergency/domain/usecases/user_usecase.dart';
import 'package:emergency/domain/user_service.dart';

class UseCaseFactory {
  static UserUseCase userUseCase
    = UserService(
        UserRepository(
          EGApiProvider()
        )
    );

  static CountryUseCase countryUseCase
    = CountryService(
        CountryRepository(
          CountryLocalRepository(),
          CountryRemoteRepository(
            EGApiProvider(
              [AuthPlugin(userUseCase)]
            )
          )
        )
    );
}
