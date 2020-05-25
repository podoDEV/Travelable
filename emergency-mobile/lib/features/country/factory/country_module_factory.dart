import 'package:data_connection_checker/data_connection_checker.dart';

import '../../../core/networking/api_provider.dart';
import '../../../core/networking/auth_plugin.dart';
import '../../../core/networking/network_info.dart';
import '../../member/factory/member_module_factory.dart';
import '../data/repositories/country_repository_impl.dart';
import '../data/repositories/local/country_local_repository.dart';
import '../data/repositories/remote/country_remote_repository.dart';
import '../domain/repositories/country_repository.dart';

class CountryModuleFactory {
  static CountryRepository countryRepository 
    = CountryRepositoryImpl(
        localDataSource: CountryLocalRepository(),
        remoteDataSource: CountryRemoteRepository(
          EGApiProvider(
            [AuthPlugin(MemberModuleFactory.userRepository)]
          )
        ),
        networkInfo: NetworkInfoImpl(
          DataConnectionChecker()
        )
      );
}