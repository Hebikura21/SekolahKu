import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Square extends StatelessWidget{
  final String imagePath;
  const Square({
    super.key,
    required this.imagePath,
  });

 @override
 Widget build(BuildContext context) {
   return Container(
    padding: const EdgeInsets.all(20),
    child: Image.asset(
      imagePath,
      height: 150,
    ),
   );
 }
  
}