import 'package:animal_husbandry/widgets/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(translate("app_bar.title")),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) async {
                if (value == 'english') {
                  changeLocale(context, 'en');
                } else if (value == 'tamil') {
                  changeLocale(context, 'ta');
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'english',
                    child: ListTile(
                      leading: const Icon(Icons.translate_sharp),
                      title: Text(translate('language.name.en')),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'tamil',
                    child: ListTile(
                      leading: const Icon(Icons.translate_sharp),
                      title: Text(translate('language.name.ta')),
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 15.0, 16.0, 8.0),
          child: Stack(
            children: [
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                children: [
                  AppTheme.createHomePage(
                    translate("main_menu.1"),
                    '/livestock',
                    "assets/images/livestock.png",
                    Colors.white54,
                    context,
                  ),
                  AppTheme.createHomePage(
                    translate("main_menu.2"),
                    '/poultry',
                    "assets/images/chicken.png",
                    Colors.white54,
                    context,
                  ),
                  AppTheme.createHomePage(
                    translate("main_menu.3"),
                    '/major',
                    "assets/images/cow_chicken_pig_icon.png",
                    Colors.white54,
                    context,
                  ),
                  AppTheme.createHomePage(
                    translate("main_menu.4"),
                    '/machinery',
                    "assets/images/chaff_cutter.png",
                    Colors.white54,
                    context,
                  ),
                  AppTheme.createHomePage(
                    translate("main_menu.5"),
                    '/',
                    "assets/images/success_icon.png",
                    Colors.white54,
                    context,
                  ),
                  AppTheme.createHomePage(
                    translate("main_menu.6"),
                    '/',
                    "assets/images/link_icon.png",
                    Colors.white54,
                    context,
                  ),
                ],
              ),
              AppTheme.waterMark()
            ],
          ),
        ));
  }
}
