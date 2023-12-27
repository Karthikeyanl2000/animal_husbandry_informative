import 'dart:convert';
import 'package:animal_husbandry/LiveStock/Cattle_Details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class CattleInformation extends StatefulWidget {
  final String heading;
  final String mainMenu;

  const CattleInformation(
      {Key? key, required this.heading, required this.mainMenu})
      : super(key: key);

  @override
  State<CattleInformation> createState() => CattleInformationState();
}

class CattleInformationState extends State<CattleInformation> {
  String? selectedPoint;

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    String jsonFilePath = 'assets/i18n/en.json';

    if (localizationDelegate.currentLocale.languageCode == 'ta') {
      jsonFilePath = 'assets/i18n/ta.json';
    }

    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(jsonFilePath),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> cattleData =
              json.decode(snapshot.data.toString());

          if (cattleData.containsKey(widget.mainMenu)) {
            Map<String, dynamic> jsonData = cattleData[widget.mainMenu];

            if (jsonData.containsKey(widget.heading)) {
              Map<String, dynamic> jsonDataCategory =
                  jsonData[widget.heading];

              if (jsonDataCategory.containsKey("heading") &&
                  jsonDataCategory["heading"] is Map<String, dynamic>) {
                Map<String, dynamic> headingPoints =
                    jsonDataCategory["heading"];


                return Scaffold(
                  appBar: AppBar(
                    title: Text(translate(widget.heading)),
                  ),
                  body: ListView.builder(
                    itemCount: headingPoints.length,
                    itemBuilder: (context, index) {
                      String pointKey = headingPoints.keys.elementAt(index);
                      dynamic pointValue = headingPoints[pointKey];

                      if (pointValue is String && pointValue.startsWith("Image:")) {
                        String imagePath = pointValue.substring("Image:".length);
                        return Image.asset(
                          imagePath.trim(),
                          width: 200,
                          height: 200,
                        );
                      } else {
                        Color tileColor = index % 2 == 0
                            ? Colors.teal .withOpacity(0.4)
                            : Colors.teal.withOpacity(0.4);

                        TextStyle textStyle = index % 2 == 0
                            ? const TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)
                            : const TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                            fontWeight: FontWeight.bold);
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          child:
                        ListTile(
                          title: Text(
                            pointValue,
                            style: textStyle,
                          ),
                          trailing: const Icon(Icons.keyboard_arrow_down),
                          tileColor: tileColor,
                          onTap: () {
                            setState(() {
                              selectedPoint = pointValue;
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CattleHeadingDetails(
                                  selectedPoint: selectedPoint.toString(),
                                  heading: widget.heading,
                                  mainMenu: widget.mainMenu.toString(),
                                ),
                              ),
                            );
                            print("Selected point: $selectedPoint");
                          },
                        )
                        );
                      }
                    },
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    "Error: 'heading' key is missing or not a map for ${widget.heading}",
                  ),
                );
              }
            } else {
              return Center(
                child: Text(
                  "Error: ${widget.heading} is not a valid key in cattleData",
                ),
              );
            }
          }
        } else if (snapshot.hasError) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Container();
      },
    );
  }
}