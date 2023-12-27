import 'package:flutter/material.dart';

class AppTheme {
  static GestureDetector createHomePage(String title, String routeName,
      String image, Color color, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(routeName);
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
                  const SizedBox(height: 35), // Spacer between image and text
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

  static waterMark() {
    return Positioned(
      bottom: 16.0,
      right: 16.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5), // Set transparency here
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.all(8.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Farmgate Technology Solutions',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey, // Set text color
              ),
            ),
            Text(
              'Contact No: 9789036947',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey, // Set text color
              ),
            ),
            Text(
              'farmgatettechnologysolutions@gmail.com',
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey, // Set text color
              ),
            ),

          ],
        ),
      ),
    );
  }
}
