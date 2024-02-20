import 'package:flutter/material.dart';
import 'package:foodapi_test/model/foodapi_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  FoodApiModel? myFoodModel;
  bool isLoading = false;

  Future getData() async {
    isLoading = true;
    notifyListeners();

    final url =
        Uri.parse("http://www.themealdb.com/api/json/v1/1/categories.php");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      myFoodModel = FoodApiModel.fromJson(decodedData);
    } else {
      print("api failed");
    }
    isLoading = false;
    notifyListeners();
  }
}
