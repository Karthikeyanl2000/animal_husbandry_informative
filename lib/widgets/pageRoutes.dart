import 'package:animal_husbandry/view/LiveStock.dart';
import 'package:animal_husbandry/view/machine_equipments.dart';
import 'package:animal_husbandry/view/major_activities.dart';
import 'package:animal_husbandry/view/poultry.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> myRoutes(BuildContext context) {

  return {
    '/livestock': (BuildContext context) => const LiveStock(),
    '/poultry':(BuildContext context) => const Poultry(),
    '/major':(BuildContext context) => const MajorActivities(),
    '/machinery':(BuildContext context)=> const Machinery()
  };
}
