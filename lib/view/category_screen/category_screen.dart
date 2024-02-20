import 'package:flutter/material.dart';
import 'package:foodapi_test/controller/category_controller.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final searchController = TextEditingController();
  CategoryScreenController categoryController = CategoryScreenController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(children: [
              SizedBox(height: 10),
              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 50,
                  crossAxisSpacing: 50,
                  mainAxisExtent: 300,
                ),
                itemBuilder: (context, index) => Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                  categoryController.myFoodCategoryModel
                                          ?.categories?.strCategoryThumb
                                          .toString() ??
                                      "",
                                ),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        title: Text(
                          categoryController
                                  .myFoodCategoryModel?.categories?.strCategory
                                  .toString() ??
                              "",
                        ),
                        subtitle: Column(
                          children: [
                            Text(
                              categoryController.myFoodCategoryModel?.categories
                                      ?.strCategoryDescription
                                      .toString() ??
                                  "",
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}
