abstract class SettingRepository {
  bool getTheme();
  String getLanguage();
  void saveTheme(bool value);
  void saveLanguage(String value);
}
