import 'package:dartz/dartz.dart';
import 'package:simple_hive_note/core/exceptions/error.dart';
import 'package:simple_hive_note/features/setting/domain/repositories/setting_repository.dart';

class GetLanguageUsecase {
  final SettingRepository _repository;

  GetLanguageUsecase(this._repository);

  Either<NoteError, String> call() {
    try {
      final lang = _repository.getLanguage();
      return right(lang);
    } catch (e) {
      return left(NoteError(message: "Failed to load Language"));
    }
  }
}
