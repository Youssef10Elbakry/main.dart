import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/info%20class/sebha_data.dart';
import 'package:islami_app/ui/utilities/app_colors.dart';
import 'package:islami_app/ui/utilities/app_images.dart';
class SebhaTab extends StatefulWidget {


  @override
  _State createState() => _State();
}

class _State extends State {
  SebhaData subhanAllah = SebhaData(text: "سبحان الله");
  SebhaData alhamdullAllah = SebhaData(text: "الحمدلله");
  SebhaData AllahAkbar = SebhaData(text: "الله اكبر");
  int onScreenCount = 0;
  String onScreenText = "سبحان الله";
  double rotationAngle = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const Spacer(),
        Container(
          height: height*0.445,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Center(
            child: InkWell(
              splashColor: AppColors.primary,
              onTap: (){
                onClicked();
                setState(() {
                  rotationAngle += 90;
                });
              },
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(rotationAngle/360),
                child: Image(image: AssetImage(AppImages.bodyLogoSebha),)
            ),
            ),
              ),
              InkWell(
                splashColor: AppColors.primary,
                onTap: (){
                  onClicked();
                  setState(() {
                    rotationAngle += 90;
                  });
                },
                child: Image(image: AssetImage(AppImages.headOfSebhaLogo),),
              ),

          ]
          ),
        ),
        const Spacer(),
        const Text("عدد التسبيحات"),
        const SizedBox(height: 10,),
        Container(
          decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(30)),
        height: height*0.1,
          width: width*0.18,
          child: Center(child: Text(onScreenCount.toString(), style: const TextStyle(color: AppColors.accent, fontWeight: FontWeight.w400, fontSize: 25),)),
        ),
        const Spacer(),
        Container(
          height: height*0.05,
          width: width*0.32,
          decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(30))
          ,
          child: Center(child: Text(onScreenText)),
        ),
        const Spacer()
      ],
    );
  }


  void onClicked(){
    if(onScreenText == subhanAllah.text){
      subhanAllah.count++;
      showOnScreen();
    }
    else if(onScreenText == alhamdullAllah.text){
      alhamdullAllah.count++;
      showOnScreen();
    }
    else{
      AllahAkbar.count++;
      showOnScreen();
    }
  }

  void showOnScreen(){
    if(subhanAllah.count >= 33){
      if(alhamdullAllah.count >= 33){
        if(AllahAkbar.count >= 33){
          startFromBeginning();
        }
        else{
          onScreenCount = AllahAkbar.count;
          onScreenText = AllahAkbar.text;
          return;
        }
      }
      else{
        onScreenCount = alhamdullAllah.count;
        onScreenText = alhamdullAllah.text;
        return;
      }
    }
    else{
      onScreenCount = subhanAllah.count;
      onScreenText = subhanAllah.text;
      return;
    }
  }

  void startFromBeginning(){
    print("Starting from the beginning");
    subhanAllah.count = 0;
    alhamdullAllah.count = 0;
    AllahAkbar.count = 0;
    onScreenCount = 0;
    onScreenText = "سبحان الله";
  }

}
