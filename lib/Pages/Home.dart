import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'package:products/Cubit/homeCubit/home_cubit_cubit.dart';
import 'package:products/Custome_widget/Custome.dart';
import 'package:products/Pages/Update_page.dart';
import 'package:products/Services/get_all_products.dart';

class HomePage extends StatefulWidget {
  static String id = 'Homepage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AllProudctServices allProudctServices = AllProudctServices();
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getproduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: const Text('New Trend ',
                  style: TextStyle(color: Colors.white)),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart, color: Colors.black)),
              ],
            ),
            body: state is HomeCubitsuccess
                ? Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 65),
                    child: GridView.builder(
                      itemCount: state.productlist.length,
                      clipBehavior: Clip.none,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 100),
                      itemBuilder: (context, index) {
                        return Custome_Card(
                          product: state.productlist[index],
                          onTap: () {
                            Get.to(() => UpdateProductPage(),
                                arguments: state.productlist[index]);
                          },
                        );
                      },
                    ))
                : const CircularProgressIndicator());
      },
    );
  }
}
