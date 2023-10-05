import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:products/Models/Prodects_Model.dart';

import '../Pages/Update_page.dart';

class Custome_Card extends StatefulWidget {
  Custome_Card({super.key, required this.product, this.onTap});
  ProductModel product;
  final Function()? onTap;

  @override
  State<Custome_Card> createState() => _Custome_CardState();
}

class _Custome_CardState extends State<Custome_Card> {
  bool iconcolor = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(.2),
                  spreadRadius: 0,
                  offset: const Offset(1, 1))
            ]),
            child: Card(
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title.substring(0, 9),
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${widget.product.price.toString()}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  iconcolor = !iconcolor;
                                });
                              },
                              icon: iconcolor
                                  ? const Icon(Icons.favorite,
                                      color: Colors.red)
                                  : const Icon(Icons.favorite,
                                      color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 20,
              top: -50,
              child: Image.network(
                widget.product.image,
                height: 100,
                width: 100,
              )),
        ],
      ),
    );
  }
}
