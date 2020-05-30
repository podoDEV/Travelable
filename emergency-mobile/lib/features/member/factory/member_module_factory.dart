import '../../../core/networking/api_provider.dart';
import '../data/repositories/user_repository_impl.dart';
import '../domain/repositories/user_repository.dart';

class MemberModuleFactory {
  static UserRepository userRepository
    = UserRepositoryImpl(EGApiProvider());
}
