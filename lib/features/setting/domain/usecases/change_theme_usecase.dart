import 'package:dartz/dartz.dart';
import 'package:simple_hive_note/core/exceptions/error.dart';
import 'package:simple_hive_note/features/setting/domain/repositories/setting_repository.dart';

class ChangeThemeUsecase {
  final SettingRepository _repository;

  ChangeThemeUsecase(this._repository);

  Either<NoteError, Unit> call(bool value) {
    try {
      _repository.changeTheme(value);
      return right(unit);
    } catch (e) {
      return left(NoteError(message: "Failed to change Theme"));
    }
  }
}
