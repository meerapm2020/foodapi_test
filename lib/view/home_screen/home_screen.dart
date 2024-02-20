//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodapi_test/controller/home_controller.dart';
import 'package:foodapi_test/model/foodapi_model.dart';

//import 'package:foodapi_test/model/foodapi_model.dart';
//import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = HomeController();
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future fetchData() async {
    homeController.getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: ((context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                homeController.myFoodModel?.categories
                                        ?.strCategoryThumb
                                        .toString() ??
                                    "",
                              ),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      title: Text(
                        homeController.myFoodModel?.categories?.strCategory
                                .toString() ??
                            "",
                      ),
                      subtitle: Column(
                        children: [
                          Text(
                            homeController.myFoodModel?.categories
                                    ?.strCategoryDescription
                                    .toString() ??
                                "",
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
