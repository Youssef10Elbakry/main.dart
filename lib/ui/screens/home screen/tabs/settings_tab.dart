import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SettingsTab();

}

class _SettingsTab extends State{
  late bool isArabic;
  late bool isDarkMode;
  late SettingsProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.settings),
          Row(
            children: [
              Text(AppLocalizations.of(context)!.arabic),
              const Spacer(),
              Switch(value: provider.isArabic(),
                  onChanged: (value){
                if(value){
                  provider.setCurrentLocale(const Locale("ar"));
                }
                else{
                  provider.setCurrentLocale(const Locale("en"));
                }
                isArabic = value;
                setState(() {});
                  }
              )
            ],
          ),
          Row(
            children: [
              Text(AppLocalizations.of(context)!.darkMode),
              const Spacer(),
              Switch(value: provider.isDark(),
                  onChanged: (value){
                if(value){
                  provider.setCurrentMode(ThemeMode.dark);
                }
                else{
                  provider.setCurrentMode(ThemeMode.light);
                }
                isDarkMode = value;
                setState(() {});
                  }
              )
            ],
          )
        ],
      ),
    );
  }

}