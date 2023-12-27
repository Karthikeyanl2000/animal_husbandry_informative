import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class CattleHeadingDetails extends StatelessWidget {
  final String selectedPoint;
  final String heading;
  final String mainMenu;

  const CattleHeadingDetails({Key? key, required this.selectedPoint, required this.heading, required this.mainMenu}) : super(key: key);

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
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Map<String, dynamic> jsonData = json.decode(snapshot.data.toString());

              //Filter Livestock data from json
              if (jsonData.containsKey(mainMenu)) {
                Map<String, dynamic> mainMenuData = jsonData[mainMenu];


                //Filter Cattle data from Livestock data
                if (mainMenuData.containsKey(heading)) {
                  Map<String, dynamic> mainMenuCategory = mainMenuData[heading];

                  //Filter heading details from live stock animals
                  if (mainMenuCategory.containsKey(selectedPoint)) {
                    List<dynamic> headingDetails = mainMenuCategory[selectedPoint];

                    return Scaffold(
                      appBar: AppBar(
                        title: Text(translate(selectedPoint)),
                      ),
                      body: InteractiveViewer(
                        boundaryMargin: const EdgeInsets.all(20.0),
                        minScale: 0.1,
                        maxScale: 7.0,
                        child: ListView.builder(
                          itemCount: headingDetails.length,
                          itemBuilder: (context, index) {
                            if (headingDetails[index].toString().startsWith("Image:")) {
                              String imagePath = headingDetails[index].toString().substring("Image:".length);
                              return Image.asset(
                                imagePath,
                                width: 300.0,
                                height: 200.0,
                              );
                            } else {
                              String listItemText = headingDetails[index];

                              // Check if the text starts with "H:"
                              bool startsWithH = listItemText.startsWith("H:");
                              if (listItemText.startsWith("H:")) {
                                // Display only the text after "H:"
                                listItemText = listItemText.substring(2);
                              }

                              // Check if the text starts with "T:"
                              bool startsWithT = listItemText.startsWith("T:");
                              if(listItemText.startsWith("T:")){
                                listItemText = listItemText.substring(2);
                              }

                              return ListTile(
                                title: Text(
                                  listItemText,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    // Use color based on whether the text starts with "H:" or "T:"
                                    color: startsWithH ? Colors.blue : (startsWithT ? Colors.red : Colors.black),
                                    fontWeight: startsWithH ? FontWeight.bold : (startsWithT ? FontWeight.bold : FontWeight.normal),
                                  ),
                                ),
                              );
                            }
                          },
                        ),                      ),
                    );
                  } else {
                    return Center(
                      child: Text("Error: $selectedPoint details are not available"),
                    );
                  }
                } else {
                  return Center(
                    child: Text("Error: 'heading' key is missing or not a map for $heading"),
                  );
                }
              } else {
                return Center(
                  child: Text("Error: $heading is not a valid key in mainMenuData"),
                );
              }
            } else {
              return const Center(
                child: Text("Error: 'Livestock' key is missing in jsonData"),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error loading data: ${snapshot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
    );
  }
}