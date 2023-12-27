import 'package:animal_husbandry/view/LiveStock.dart';
import 'package:animal_husbandry/widgets/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class MajorActivities extends StatelessWidget {
  const MajorActivities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    bool isEnglish = (localizationDelegate.currentLocale.languageCode == 'en');
    return Scaffold(
        appBar: AppBar(
          title: Text(translate("main_menu.3")),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 5.0),
            child: Stack(
    children:[
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              children: [
                LiveStock.createHomePage(
                  isEnglish?
                  translate("Major Activities.major_menu.1"):
                  translate("முக்கிய செயல்பாடுகள்.major_menu.1"),
                  "assets/images/AI_icon.png",
                  translate("main_menu.3"),
                  Colors.white54,
                  context,
                ),
                LiveStock.createHomePage(
                  isEnglish?
                  translate("Major Activities.major_menu.2"):
                  translate("முக்கிய செயல்பாடுகள்.major_menu.2"),

                  "assets/images/pest_manage_icon.png",
                  translate("main_menu.3"),
                  Colors.white54,
                  context,
                ),
                LiveStock.createHomePage(
                  isEnglish?
                  translate("Major Activities.major_menu.3"):
                  translate("முக்கிய செயல்பாடுகள்.major_menu.3"),

                  "assets/images/disease_prevention_icon.png",
                  translate("main_menu.3"),
                  Colors.white54,
                  context,
                ),
                LiveStock.createHomePage(
                  isEnglish?
                  translate("Major Activities.major_menu.4"):
                  translate("முக்கிய செயல்பாடுகள்.major_menu.4"),
                  "assets/images/insurance_icon.png",
                  translate("main_menu.3"),
                  Colors.white54,
                  context,
                ),
                LiveStock.createHomePage(
                  isEnglish?
                  translate("Major Activities.major_menu.5"):
                  translate("முக்கிய செயல்பாடுகள்.major_menu.5")  ,
                  "assets/images/extension_service_icon.png",
                  translate("main_menu.3"),
                  Colors.white54,
                  context,
                ),
              ],
            ),
      AppTheme.waterMark()
  ]
            )

        )
    );
  }
}
