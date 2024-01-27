import 'package:flutter/material.dart' show debugPrint;

class User {
  int? id;
  late String firstName;
  late String lastName;
  late String gender;
  late int idLC;
  late String product;
  late String lc;
  late String department;
  late bool hasEPs;
  late String imgUrl;
  late String positionName;

  User();

  User.fromJson(Map json) {
    final List currentOffices = json['current_offices'];
    final List currentPositions = json['current_positions'];
    id = json['id'];
    firstName = fetchName(json['first_name']).trim();
    lastName = fetchName(json['last_name']).trim();
    gender = json['gender'].trim();
    idLC = currentOffices[currentOffices.length - 1]['id'];
    product = currentPositions[currentPositions.length - 1]['focus_products'][0]
        .trim();
    lc = currentOffices[currentOffices.length - 1]['name'].trim();
    department = ((json['current_teams']
            [json['current_teams'].length - 1])['name'] as String)
        .trim()
        .toUpperCase();
    positionName =
        currentPositions[currentPositions.length - 1]['title'].trim();
    imgUrl =
        'https://cdn-expa.aiesec.org/gis-img/missing_profile_${firstName[0].toLowerCase()}.svg';
    hasEPs = (json['managed_people'] as List).isNotEmpty;
    showUser();
  }
  showUser() {
    debugPrint(
        '[USER] : ($id) $firstName $lastName | $gender | $lc ($idLC) | $department ($product) as $positionName');
  }

  String fetchName(String name) {
    return '${name[0].toUpperCase()}${name.substring(1).toLowerCase()}';
  }
}
