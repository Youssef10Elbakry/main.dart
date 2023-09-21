import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../info class/quran_or_hadeth_data.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_constants.dart';
import '../../../utilities/app_images.dart';
import '../../content screen/quran_or_hadeth_screen.dart';
class HadethTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<String> hadethNamesInCorrectOrder = AppConstants.hadethNames.reversed.toList();
    return Column(
      children: [
        Center(child: Image.asset(AppImages.logoHadeth)),
        const Divider(thickness: 3, color: AppColors.primary,),
        const Text("Hadeth Name", style: TextStyle(color: AppColors.accent, fontSize: 30)),
        const Divider(thickness: 3, color: AppColors.primary,),
        Expanded(
          child: ListView.builder(
              itemCount: hadethNamesInCorrectOrder.length,
              itemBuilder: (BuildContext context, index) {
                print(index);
                return TextButton(onPressed: () {
                  Navigator.pushNamed(context, QuranOrHadethScreen.routeName,
                      arguments: QuranOrHadethDataToShow(fileName: "h${index+1}", quranOrHadethname: hadethNamesInCorrectOrder[index], isQuran: false));
                },
                    child: Text(hadethNamesInCorrectOrder[index], style: const TextStyle(color: AppColors.accent),)
                );
              }
          ),
        )
      ],
    );
  }
}
