import 'package:flutter/services.dart';
import 'package:mpay/core/theme/theme_service.dart';
import 'core/common/languages/app_language.dart';
import 'config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, AsyncSnapshot<SharedPreferences> snapData) {
          if (snapData.hasData) {
            return MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                      create: (_) => ThemeService(snapData.data!)),
                 
                ],
                child: Consumer<ThemeService>(builder: (context, theme, child) {

                  return ScreenUtilInit(
                      child: MaterialApp(
                          title: appFonts.mpay,
                          debugShowCheckedModeBanner: false,
                          theme: AppTheme.fromType(ThemeType.light).themeData,
                          darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
                          localizationsDelegates: const [
                            AppLocalizations.delegate,
                            AppLocalizationDelagate(),
                            GlobalMaterialLocalizations.delegate,
                            GlobalWidgetsLocalizations.delegate,
                            GlobalCupertinoLocalizations.delegate
                          ],
                          supportedLocales: appArray.localList,
                          // themeMode: theme.,
                          initialRoute: "/",
                          routes: appRoute.route));
                }));
          } else {
            return ScreenUtilInit(
              child: MaterialApp(
                  theme: AppTheme.fromType(ThemeType.light).themeData,
                  darkTheme: AppTheme.fromType(ThemeType.dark).themeData,
                  themeMode: ThemeMode.light,
                  debugShowCheckedModeBanner: false,
                  home: const HomeBodyLayout()),
            );
          }
        });
  }
}
