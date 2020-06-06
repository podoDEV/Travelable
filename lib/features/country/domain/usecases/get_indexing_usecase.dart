import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/helpers/indexing.dart';
import '../../../../core/usecases/usecase.dart';

class GetIndexingUseCase implements UseCase<List<String>, NoParams> {
  GetIndexingUseCase();

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) async {
    return Right(Indexing.onset2);
  }
}
