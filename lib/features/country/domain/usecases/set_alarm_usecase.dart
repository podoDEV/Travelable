import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/country_repository.dart';

class SetAlarmUseCase implements UseCase<void, SetAlarmParams> {
  final CountryRepository repository;

  SetAlarmUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(SetAlarmParams params) async {
    return await repository.setAlarm(id: params.id, enabled: params.enabled);
  }
}

class SetAlarmParams {
  final int id;
  final bool enabled;

  SetAlarmParams(this.id, this.enabled);
}
