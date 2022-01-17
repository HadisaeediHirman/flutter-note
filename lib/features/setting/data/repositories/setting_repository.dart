import '../../../../core/data/local_storage_provider.dart';
import '../../../../core/utils/utils.dart';
import '../../domain/repositories/setting_repository.dart';

class SettingRepositoryImpl implements SettingRepository {
  @override
  String getLanguage() {
    try {
      final lang = LocalStorageProvider().read(AppStrings.language);
      return lang;
    } catch (e) {
      rethrow;
    }
  }

  @override
  bool getTheme() {
    try {
      final theme = LocalStorageProvider().read(AppStrings.isDark);
      return theme;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void changeTheme(bool value) async {
    try {
      await LocalStorageProvider().write(AppStrings.isDark, value);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void changeLanguage(String value) async {
    try {
      await LocalStorageProvider().write(AppStrings.language, value);
    } catch (e) {
      rethrow;
    }
  }
}
