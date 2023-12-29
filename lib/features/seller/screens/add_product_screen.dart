import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:thriftedbookstore/common/appbar/comman_appbar.dart';
import 'package:thriftedbookstore/common/custom_button.dart';
import 'package:thriftedbookstore/common/custom_text_field.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/seller/services/seller_services.dart';
import 'package:thriftedbookstore/utils/utils.dart';

class AddProduct extends StatefulWidget {
  static const String routeName = "/add-product";

  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final int maxLines = 1;
  final _addProductFormKey = GlobalKey<FormState>();
  final SellerServices sellerServices = SellerServices();

  List<String> bookCategories = [
    "Academics",
    "Comic",
    "Fiction",
    "Novel",
    "Collectibles"
  ];

  String category = "Academics";
  List<File> images = [];

  void selectImages() async {
    var res = await pickImage();
    setState(() {
      images = res;
    });
  }

  void sellProducts() {
    if (_addProductFormKey.currentState!.validate() && images.isEmpty) {
      sellerServices.sellProduct(
          context: context,
          name: productNameController.text,
          description: descriptionController.text,
          price: double.parse(priceController.text),
          quantity: double.parse(quantityController.text),
          category: category,
          images: images);
    }
  }

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: commonAppBar("Add", "Books", size),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _addProductFormKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    images.isNotEmpty
                        ? CarouselSlider(
                            items: [
                                for (final image in images)
                                  Builder(
                                      builder: (context) => Image.file(image))
                              ],
                            options: CarouselOptions(
                              viewportFraction: 1,
                              height: 200,
                            ))
                        : const SizedBox(height: 10),
                    GestureDetector(
                      onTap: selectImages,
                      child: DottedBorder(
                          borderType: BorderType.RRect,
                          dashPattern: const [10, 4],
                          strokeCap: StrokeCap.round,
                          radius: const Radius.circular(10),
                          child: Container(
                            height: 150,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    primaryColor.withOpacity(0.05),
                                    primaryColor.withOpacity(0.01)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.file_upload,
                                  color: primaryColor,
                                  size: 40,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Select Book Images",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: textColor.withOpacity(0.5)),
                                ),
                              ],
                            ),
                          )),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                        controller: productNameController,
                        hintText: "Book Name"),
                    const SizedBox(height: 10),
                    CustomTextField(
                        controller: descriptionController,
                        hintText: "Description"),
                    const SizedBox(height: 10),
                    CustomTextField(
                        controller: priceController, hintText: "Price"),
                    const SizedBox(height: 10),
                    CustomTextField(
                        controller: quantityController, hintText: "Quantity"),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          value: category,
                          items: [
                            for (final category in bookCategories)
                              DropdownMenuItem(
                                  value: category, child: Text(category))
                          ],
                          onChanged: (value) {
                            setState(() {
                              category = value!;
                            });
                          }),
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 10),
                    CustomButton(
                      onTap: sellProducts,
                      text: "Sell",
                      color: primaryColor,
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
