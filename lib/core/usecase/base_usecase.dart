import 'package:dartz/dartz.dart';

import '../exceptions/error.dart';

abstract class BaseUseCase<Type, Map> {
  Future<Either<NoteError, Type>> call({Map params});
}
