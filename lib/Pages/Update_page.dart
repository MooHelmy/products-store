import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:products/Cubit/updatecubit/update_cubit_cubit.dart';
import 'package:products/Custome_widget/Custom_Button_.dart';
import 'package:products/Models/Prodects_Model.dart';
import 'package:products/Pages/Home.dart';

import '../Custome_widget/Custom_Texte_field.dart';

class UpdateProductPage extends StatelessWidget {
  static String id = 'Update Product Page';
  String? productname, description;

  var Price;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return BlocConsumer<UpdateCubit, UpdateCubitState>(
      listener: (context, state) {
        if (state is UpdateCubitIsuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('update Success ')));
        } else if (state is UpdateCubitfailuer) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Update Product'),
              backgroundColor: Colors.transparent,
            ),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Custom_text(
                        onchange: (data) {
                          productname = data;
                        },
                        hinte: 'Product name',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Custom_text(
                        onchange: (data) {
                          description = data;
                        },
                        hinte: 'description',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Custom_text(
                        textInputType: TextInputType.number,
                        onchange: (data) {
                          Price = data;
                        },
                        hinte: 'Price',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Custom_text(
                      //   onchange: (data) {
                      //     image = data;
                      //   },
                      //   hinte: 'image',
                      // ),
                      const SizedBox(
                        height: 50,
                      ),
                      Cusom_Button(
                        name: 'Update',
                        ontap: () {
                          BlocProvider.of<UpdateCubit>(context).updateproudct(
                              id: product.id,
                              title: productname == null
                                  ? product.title
                                  : productname!,
                              price: Price == null ? product.price : Price!,
                              description: description == null
                                  ? product.descriptions
                                  : description!,
                              category: product.category,
                              image: product.image);
                          Get.to(HomePage());
                        },
                      )
                    ],
                  ),
                )));
      },
    );
  }
}
