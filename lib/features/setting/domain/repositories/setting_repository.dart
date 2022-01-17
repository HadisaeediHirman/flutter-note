abstract class SettingRepository {
  bool getTheme();
  String getLanguage();
  void changeTheme(bool value);
  void changeLanguage(String value);
}
