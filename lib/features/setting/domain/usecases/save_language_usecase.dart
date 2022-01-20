import 'package:dartz/dartz.dart';
import 'package:simple_hive_note/core/exceptions/error.dart';
import 'package:simple_hive_note/features/setting/domain/repositories/setting_repository.dart';

class SaveLanguageUsecase {
  final SettingRepository _repository;

  SaveLanguageUsecase(this._repository);

  Either<NoteError, Unit> call(String value) {
    try {
      _repository.saveLanguage(value);
      return right(unit);
    } catch (e) {
      return left(NoteError(message: "Failed to change Language"));
    }
  }
}
