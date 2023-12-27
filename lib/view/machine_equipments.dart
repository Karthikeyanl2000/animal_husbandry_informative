import 'package:animal_husbandry/view/LiveStock.dart';
import 'package:animal_husbandry/widgets/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class Machinery extends StatelessWidget {
  const Machinery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    bool isEnglish = (localizationDelegate.currentLocale.languageCode == 'en');
    return Scaffold(
        appBar: AppBar(
          title: Text(translate("main_menu.4")),
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
                  isEnglish
                      ? translate("Machinery and Equipments.machine_menu.1")
                      : translate(
                          "கருவிகள் மற்றும் இயந்திரங்கள்.machine_menu.1"),
                  "assets/images/milking_machine_icon.png",
                  translate("main_menu.4"),
                  Colors.white54,
                  context,
                ),
                LiveStock.createHomePage(
                  isEnglish
                      ? translate("Machinery and Equipments.machine_menu.2")
                      : translate(
                          "கருவிகள் மற்றும் இயந்திரங்கள்.machine_menu.2"),
                  "assets/images/incubator_icon.png",
                  translate("main_menu.4"),
                  Colors.white54,
                  context,
                ),
                LiveStock.createHomePage(
                  isEnglish
                      ? translate("Machinery and Equipments.machine_menu.3")
                      : translate(
                          "கருவிகள் மற்றும் இயந்திரங்கள்.machine_menu.3"),
                  "assets/images/chaff_cutter.png",
                  translate("main_menu.4"),
                  Colors.white54,
                  context,
                ),
                LiveStock.createHomePage(
                  isEnglish
                      ? translate("Machinery and Equipments.machine_menu.4")
                      : translate(
                          "கருவிகள் மற்றும் இயந்திரங்கள்.machine_menu.4"),
                  "assets/images/equipments_icon.png",
                  translate("main_menu.4"),
                  Colors.white54,
                  context,
                ),
              ],
            ),
      AppTheme.waterMark()
            ]
            )
        ));
  }
}
