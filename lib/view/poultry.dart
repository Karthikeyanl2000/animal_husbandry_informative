import 'package:animal_husbandry/view/LiveStock.dart';
import 'package:animal_husbandry/widgets/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class Poultry extends StatelessWidget {
  const Poultry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    bool isEnglish = (localizationDelegate.currentLocale.languageCode == 'en');
    return Scaffold(
        appBar: AppBar(
          title: Text(translate("main_menu.2")),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 5.0),
            child: Stack(
              children: [
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  children: [
                    LiveStock.createHomePage(
                      isEnglish
                          ? translate("Poultry.poultry_menu.1")
                          : translate("பறவை வளர்ப்பு.poultry_menu.1"),
                      "assets/images/chicken_icon.png",
                      translate("main_menu.2"),
                      Colors.white54,
                      context,
                    ),
                    LiveStock.createHomePage(
                      isEnglish
                          ? translate("Poultry.poultry_menu.2")
                          : translate("பறவை வளர்ப்பு.poultry_menu.2"),
                      "assets/images/quail_icon.png",
                      translate("main_menu.2"),
                      Colors.white54,
                      context,
                    ),
                    LiveStock.createHomePage(
                      isEnglish
                          ? translate("Poultry.poultry_menu.3")
                          : translate("பறவை வளர்ப்பு.poultry_menu.3"),
                      "assets/images/turkey_icon.png",
                      translate("main_menu.2"),
                      Colors.white54,
                      context,
                    ),
                    LiveStock.createHomePage(
                      isEnglish
                          ? translate("Poultry.poultry_menu.4")
                          : translate("பறவை வளர்ப்பு.poultry_menu.4"),
                      "assets/images/duck_icon.png",
                      translate("main_menu.2"),
                      Colors.white54,
                      context,
                    ),
                  ],
                ),
                AppTheme.waterMark()
              ],
            )));
  }
}
