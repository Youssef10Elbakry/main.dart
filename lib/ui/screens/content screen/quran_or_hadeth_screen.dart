import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/ui/utilities/app_images.dart';
import 'package:provider/provider.dart';

import '../../info class/quran_or_hadeth_data.dart';
import '../../utilities/app_colors.dart';

class QuranOrHadethScreen extends StatefulWidget {
  static String routeName = "Quran or hadeth screen";
  const QuranOrHadethScreen({super.key});

  @override
  State<StatefulWidget> createState() => _QuranOrHadethScreen();
}

class _QuranOrHadethScreen extends State{
  late QuranOrHadethDataToShow arguments;
  String surahOrhadethContent = "";
  late SettingsProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    arguments = ModalRoute.of(context)!.settings.arguments as QuranOrHadethDataToShow;
    if(surahOrhadethContent.isEmpty) {getSurahOrHadethContent();}

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(provider.currentTheme == ThemeMode.light ? AppImages.defaultBackgroundImage : AppImages.darkBackgroundImage)
          )
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          title: const Text(
            "Islami",
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          color: Colors.white.withOpacity(0.4),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.only(left: 30, right: 30, top: 70, bottom: 40),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: [
              const Spacer(flex: 1,),
              Center(child: Text(arguments.isQuran?"سورة ${arguments.quranOrHadethname}":arguments.quranOrHadethname)),
              const Divider(thickness: 3, color: AppColors.primary,),
              Expanded(flex:9, child: ListView(children: [surahOrhadethContent.isEmpty?const CircularProgressIndicator():Text(surahOrhadethContent)]))
            ],
          ),
        ),
      ),
    );
  }

  void getSurahOrHadethContent() async {
    // List<String> arabicNumbers = ['٠', '١', '٢', '٣','٤', '٥', '٦','٧', '٨', '٩'];
    // List<String> ayat = [];
    // String surahWithAyahNumber = "";
    if(arguments.isQuran){
      surahOrhadethContent = await rootBundle.loadString("assets/quran_files/${arguments.fileName}.txt");
      // ayat = surahOrhadethContent.split("\n");
      // for(int i = 0; i<ayat.length; i++) {
      //   surahWithAyahNumber += "${ayat[i]}(١)";
      //
      // }
      // surahOrhadethContent = surahWithAyahNumber;
      setState(() {});
    }
    else{
      surahOrhadethContent = await rootBundle.loadString("assets/hadeth_files/${arguments.fileName}.txt");
      setState(() {});
    }

  }

  String convertToArabicNumber(int number){
    List<String> arabicNumbers = ['٠', '١', '٢', '٣','٤', '٥', '٦','٧', '٨', '٩'];
    List<int> englishNumbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    int index = englishNumbers.indexOf(number);
    return arabicNumbers[index];
  }

}
