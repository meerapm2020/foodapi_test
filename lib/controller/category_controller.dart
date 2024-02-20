import 'package:flutter/material.dart';
import 'package:foodapi_test/model/foodapi_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryScreenController with ChangeNotifier {
  Map<String, dynamic> decodedData = {};
  FoodApiModel? myFoodCategoryModel;
  bool isLoading = false;

  Future searchData({required String searchData}) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/filter.php?c=$searchData");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
      myFoodCategoryModel = FoodApiModel.fromJson(decodedData);
    } else {
      print("api failed");
    }
    isLoading = false;
    notifyListeners();
  }
}
