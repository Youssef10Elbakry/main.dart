import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/utilities/app_images.dart';

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
  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as QuranOrHadethDataToShow;
    if(surahOrhadethContent.isEmpty) {getSurahOrHadethContent();}

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.defaultBackgroundImage)
          )
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
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
        body: Container(
          color: Colors.white.withOpacity(0.4),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          margin: const EdgeInsets.only(left: 30, right: 30, top: 70, bottom: 40),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: [
              const Spacer(flex: 1,),
              Center(child: Text(" سورة ${arguments.quranOrHadethname}", style: const TextStyle(fontSize: 35),)),
              const Divider(thickness: 3, color: AppColors.primary,),
              Expanded(flex:9, child: ListView(children: [Text(surahOrhadethContent, style: const TextStyle(fontSize: 25), textAlign: TextAlign.right,)]))
            ],
          ),
        ),
      ),
    );
  }

  void getSurahOrHadethContent() async {
    if(arguments.isQuran){
      print("yes");
      surahOrhadethContent = await rootBundle.loadString("assets/quran_files/${arguments.fileName}.txt");
      print("surah: $surahOrhadethContent");
      setState(() {});
    }
    else{
      surahOrhadethContent = await rootBundle.loadString("assets/hadeth_files/${arguments.fileName}.txt");
      setState(() {});
    }

  }

}
