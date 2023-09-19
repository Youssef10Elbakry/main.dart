import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:islami_app/ui/screens/home%20screen/tabs/hadeth_tab.dart';
import 'package:islami_app/ui/screens/home%20screen/tabs/quran_tab.dart';
import 'package:islami_app/ui/screens/home%20screen/tabs/radio_tab.dart';
import 'package:islami_app/ui/screens/home%20screen/tabs/sebha_tab.dart';
import '/ui/utilities/app_images.dart';
import '/ui/utilities/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home Screen";
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State {
  List<Widget> tabs = [const RadioTab(), SebhaTab(), HadethTab(), QuranTab()];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.defaultBackgroundImage))),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.transparent,
            title: const Text(
              "Islami",
              style: TextStyle(
                  color: AppColors.accent, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: tabs[i],
          backgroundColor: Colors.transparent,
          bottomNavigationBar: MyBottomNavigationBar(),
        ));
  }

  Widget MyBottomNavigationBar() {
    return Theme(
        data: ThemeData(canvasColor: AppColors.primary),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.iconRadio)),
                label: "Radio"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.iconSebha)),
                label: "Sebha"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.iconHadeth)),
                label: "Hadeth"),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppImages.iconQuran)),
                label: "Quran")
          ],
          onTap: (index) {
            i = index;
            setState(() {});
          },
          currentIndex: i,
          iconSize: 35,
          selectedItemColor: AppColors.accent,
        ));
  }
}
