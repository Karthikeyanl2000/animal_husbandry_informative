import 'package:animal_husbandry/LiveStock/Cattle.dart';
import 'package:animal_husbandry/widgets/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class LiveStock extends StatelessWidget {
  const LiveStock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;
    bool isEnglish = (localizationDelegate.currentLocale.languageCode == 'en');

    return Scaffold(
      appBar: AppBar(
        title: Text(translate("main_menu.1")),
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
              createHomePage(
                isEnglish
                    ? translate("Livestock.livestock_menu.1")
                    : translate("கால்நடை.livestock_menu.1"),
                "assets/images/cow.png",
                translate("main_menu.1"),
                Colors.white54,
                context,
              ),
              createHomePage(
                isEnglish
                    ? translate("Livestock.livestock_menu.2")
                    : translate("கால்நடை.livestock_menu.2"),
                "assets/images/buffalo.png",
                translate("main_menu.1"),
                Colors.white54,
                context,
              ),
              createHomePage(
                isEnglish
                    ? translate("Livestock.livestock_menu.3")
                    : translate("கால்நடை.livestock_menu.3"),
                "assets/images/sheep.png",
                translate("main_menu.1"),
                Colors.white54,
                context,
              ),
              createHomePage(
                isEnglish
                    ? translate("Livestock.livestock_menu.4")
                    : translate("கால்நடை.livestock_menu.4"),
                "assets/images/goat.png",
                translate("main_menu.1"),
                Colors.white54,
                context,
              ),
            ],
          ),
      AppTheme.waterMark()
        ]
      )
      ),
    );
  }

  static Widget createHomePage(String title, String image, String mainMenu,
      Color color, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CattleInformation(
                    heading: title.toString(), mainMenu: mainMenu)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.blueGrey, // Set your desired border color
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    width: 64,
                    height: 64,
                  ),
                  const SizedBox(height: 30), // Spacer between image and text
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
