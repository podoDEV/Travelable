import '../domain/usecases/login_usecase.dart';
import 'member_module_factory.dart';

class MemberUseCaseFactory {
  static LoginUseCase loginUseCase
    = LoginUseCase(MemberModuleFactory.userRepository);
}

