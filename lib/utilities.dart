import 'package:flutter/material.dart';

Widget unitBlock(color ,String text , height , width, context, page ){
  return GestureDetector(
    onTap: (){
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => page));
    },
    child: Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10.0,
            offset: Offset(0, 5),
          ),
        ],
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),

      height: height,
      width: width,
      child: Center(child: Text(text,style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.white,
      ),)),
    ),
  );
}