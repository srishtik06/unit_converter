import 'package:flutter/material.dart';
import 'package:converter_app/utilities.dart';
import 'package:converter_app/LengthPage.dart';
import 'package:converter_app/weightPage.dart';
import 'package:converter_app/tempPage.dart';
import 'package:converter_app/timePage.dart';
import 'package:converter_app/speedPage.dart';
import 'package:converter_app/currencyPage.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff324b6a),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(31, 0, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height*0.1,),

            const Text('easy',style: TextStyle(
              fontSize: 60,
              color: Colors.lightBlueAccent,
              fontWeight: FontWeight.bold,
            ),),

            const Text('CONVERT',style: TextStyle(

              fontSize: 50,
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),),

            SizedBox(height: size.height*0.04,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

               unitBlock(const Color(0xffff3040), 'Length', size.width*0.35,size.width*0.39, context, const LengthPage()),



                unitBlock(const Color(0xffb620e1), 'Weight', size.width*0.35,size.width*0.39, context, const weightPage()),
              ],
            ),

            SizedBox(height: size.height*0.04,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                unitBlock(const Color(0xff13b3d7), 'Temperature', size.width*0.35,size.width*0.39, context, const tempPage()),

                unitBlock(const Color(0xffffb94d), 'Time', size.width*0.35,size.width*0.39, context, const timePage())
              ],
            ),

            SizedBox(height: size.height*0.04,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                unitBlock(const Color(0xfffd5d2d), 'Speed', size.width*0.35,size.width*0.39, context, const speedPage()),

                unitBlock(const Color(0xff8ad53c), 'Currency', size.width*0.35,size.width*0.39, context, const currencyPage())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
