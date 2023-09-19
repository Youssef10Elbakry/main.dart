import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/info%20class/quran_or_hadeth_data.dart';
import 'package:islami_app/ui/screens/content%20screen/quran_or_hadeth_screen.dart';
import '/ui/utilities/app_images.dart';
import '/ui/utilities/app_colors.dart';
import '/ui/utilities/app_constants.dart';
class QuranTab extends StatelessWidget{
  const QuranTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset(AppImages.quranScreenLogo)),
        const Divider(thickness: 3, color: AppColors.primary,),
        const Text("Surah Name", style: TextStyle(color: AppColors.accent, fontSize: 30)),
        const Divider(thickness: 3, color: AppColors.primary,),
        Expanded(
          child: ListView.builder(
            itemCount: AppConstants.surahNames.length,
              itemBuilder: (BuildContext context, index) {
              print(index);
                return TextButton(onPressed: () {
                  Navigator.pushNamed(context, QuranOrHadethScreen.routeName,
                      arguments: QuranOrHadethDataToShow(fileName: "${index+1}", quranOrHadethname: AppConstants.surahNames[index], isQuran: true));
                },
                    child: Text(AppConstants.surahNames[index], style: const TextStyle(color: AppColors.accent),)
                );
              }
          ),
        )
      ],
    );
  }

}