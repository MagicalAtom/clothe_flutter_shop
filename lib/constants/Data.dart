import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


List<String> categories = ["All","Dress","Hat","Shirt"];

List<String> images = ["1","2","3","4","5","6"];


Widget generateIcon({color,index}){
  List<Icon> icons  = [
    Icon(Icons.all_inclusive,color: color,),
    Icon(CupertinoIcons.shopping_cart,color: color,),
    Icon(Icons.shopping_basket_outlined,color: color,),
    Icon(Icons.shopping_bag_outlined,color: color,),
  ];
  return icons[index];
}