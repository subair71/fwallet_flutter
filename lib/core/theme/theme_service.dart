import '../../../config.dart';

class ThemeService extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  ThemeService(this.sharedPreferences);


  /// Switch theme and save to local storage
  AppTheme get appTheme  => AppTheme.fromType(ThemeType.light);
}
