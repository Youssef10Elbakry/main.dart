import 'package:flutter/material.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/ui/screens/content%20screen/quran_or_hadeth_screen.dart';
import 'package:islami_app/ui/screens/home screen/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/ui/utilities/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_)=> SettingsProvider(),
      child: MyApp()
  )
  );
}

class MyApp extends StatelessWidget {
  late SettingsProvider provider;
  @override
  Widget build(BuildContext context){
    provider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      themeMode: provider.currentTheme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      locale: provider.currentLocale,
      routes: {
        HomeScreen.routeName: (_)=> HomeScreen(),
        QuranOrHadethScreen.routeName: (_)=> const QuranOrHadethScreen()
      },
      initialRoute: HomeScreen.routeName,
    );
  }


}