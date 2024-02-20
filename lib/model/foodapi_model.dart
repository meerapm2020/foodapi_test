// To parse this JSON data, do
//
//     final foodApiModel = foodApiModelFromJson(jsonString);

import 'dart:convert';

FoodApiModel foodApiModelFromJson(String str) => FoodApiModel.fromJson(json.decode(str));


class FoodApiModel {
    Categories? categories;

    FoodApiModel({
        this.categories,
    });

    factory FoodApiModel.fromJson(Map<String, dynamic> json) => FoodApiModel(
        categories: json["categories"] == null ? null : Categories.fromJson(json["categories"]),
    );

    
}

class Categories {
    String? idCategory;
    String? strCategory;
    String? strCategoryThumb;
    String? strCategoryDescription;

    Categories({
        this.idCategory,
        this.strCategory,
        this.strCategoryThumb,
        this.strCategoryDescription,
    });

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        idCategory: json["idCategory"],
        strCategory: json["strCategory"],
        strCategoryThumb: json["strCategoryThumb"],
        strCategoryDescription: json["strCategoryDescription"],
    );

    
}
