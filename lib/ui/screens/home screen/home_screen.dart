import 'package:flutter/material.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/ui/screens/home%20screen/tabs/hadeth_tab.dart';
import 'package:islami_app/ui/screens/home%20screen/tabs/quran_tab.dart';
import 'package:islami_app/ui/screens/home%20screen/tabs/radio_tab.dart';
import 'package:islami_app/ui/screens/home%20screen/tabs/sebha_tab.dart';
import 'package:islami_app/ui/screens/home%20screen/tabs/settings_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '/ui/utilities/app_images.dart';
import '/ui/utilities/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home Screen";

  const HomeScreen({super.key});
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State {
  List<Widget> tabs = [const RadioTab(), SebhaTab(), HadethTab(), const QuranTab(), const SettingsTab()];
  late SettingsProvider provider;

  int i = 0;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(provider.currMode == "Light" ? AppImages.defaultBackgroundImage : AppImages.darkBackgroundImage))),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.transparent,
            title: Text(
              AppLocalizations.of(context)!.islami,
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: tabs[i],
          backgroundColor: Colors.transparent,
          bottomNavigationBar: myBottomNavigationBar(),
        ));
  }

  Widget myBottomNavigationBar() {
    return Theme(
        data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.iconRadio)),
                label: AppLocalizations.of(context)!.radio),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.iconSebha)),
                label: AppLocalizations.of(context)!.sebha),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.iconHadeth)),
                label: AppLocalizations.of(context)!.hadeth),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.iconQuran)),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings)
          ],
          onTap: (index) {
            i = index;
            setState(() {});
          },
          currentIndex: i,
          iconSize: 35,
        ));
  }
}
