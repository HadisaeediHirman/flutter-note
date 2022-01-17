import 'package:dartz/dartz.dart';
import 'package:simple_hive_note/core/exceptions/error.dart';
import 'package:simple_hive_note/features/setting/domain/repositories/setting_repository.dart';

class GetThemeUsecase {
  final SettingRepository _repository;

  GetThemeUsecase(this._repository);

  Either<NoteError, bool> call() {
    try {
      final theme = _repository.getTheme();
      return right(theme);
    } catch (e) {
      return left(NoteError(message: "Failed to load Theme"));
    }
  }
}
