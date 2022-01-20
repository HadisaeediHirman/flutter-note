import 'package:dartz/dartz.dart';
import 'package:simple_hive_note/core/exceptions/error.dart';
import 'package:simple_hive_note/features/setting/domain/repositories/setting_repository.dart';

class SaveThemeUsecase {
  final SettingRepository _repository;

  SaveThemeUsecase(this._repository);

  Either<NoteError, Unit> call(bool value) {
    try {
      _repository.saveTheme(value);
      return right(unit);
    } catch (e) {
      return left(NoteError(message: "Failed to change Theme"));
    }
  }
}
