import 'package:flutter/material.dart';
import 'package:thriftedbookstore/common/appbar/comman_appbar.dart';
import 'package:thriftedbookstore/constants/constants.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: commonAppBar("Thrifted", "Categories", size),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: GridView.builder(
            itemCount: categories.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 7, crossAxisSpacing: 7),
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          categories[index].color.withOpacity(0.1),
                          categories[index].color.withOpacity(0.01)
                        ])),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          categories[index].title,
                          style: const TextStyle(
                              fontSize: 21,
                              color: Color.fromARGB(255, 44, 44, 44)),
                        )
                      ],
                    ),
                  ),
                )),
      ),
    );
  }
}
