import 'package:flutter/material.dart';
class Cusom_Button extends StatelessWidget{
  Cusom_Button({required this.name,required this.ontap});
  VoidCallback? ontap;
  String name;
  @override
  Widget build(BuildContext context) {
 return GestureDetector(
   onTap: ontap,
   child: Container(
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(8),
    ),
    width: double.infinity,
    height: 65,
    child: Center(
      child: Text(name,style: TextStyle(fontSize: 24,color: Colors.white),

      ),
    ),
),
 );
  }

}