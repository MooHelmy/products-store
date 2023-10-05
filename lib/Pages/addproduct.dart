import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../Cubit/updatecubit/update_cubit_cubit.dart';
import '../Custome_widget/Custom_Button_.dart';
import '../Custome_widget/Custom_Texte_field.dart';
import '../Models/Prodects_Model.dart';
import 'Home.dart';

class Addproduct extends StatelessWidget {
  const Addproduct({super.key});

  @override
  Widget build(BuildContext context) {
    String? productname, description;
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    var Price;
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
