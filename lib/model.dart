import 'package:flutter/material.dart';

class Model {
  Color color;
  String titl;
  String desc;
  Icon icon;
  Model(
      {required this.color,
      required this.desc,
      required this.icon,
      required this.titl});
}

class GetModel {
  static List<Model> modelFnc() {
    return [
      Model(
          color: Colors.black,
          desc: '+20 updates',
          icon: const Icon(Icons.gamepad),
          titl: 'Gaming'),
      Model(
          color: Colors.amber,
          desc: '+10 updates',
          icon: const Icon(Icons.food_bank),
          titl: 'FoodBank'),
      Model(
          color: Colors.blue,
          desc: '+4 updates',
          icon: const Icon(Icons.face),
          titl: 'FaceBank')
    ];
  }
}
