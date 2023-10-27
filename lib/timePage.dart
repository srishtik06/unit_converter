import 'package:flutter/material.dart';

class timePage extends StatefulWidget {
  const timePage({super.key});

  @override
  State<timePage> createState() => _timePageState();
}

class _timePageState extends State<timePage> {
  String selectedUnit = 'Hours';
  String selectedUnit1 = 'Minutes';
  double inputValue = 0.0;
  double result = 0.0;
  final Map<String, double> conversionFactors = {
    'Meters': 1.0,
    'Feet': 3.28084, // 1 meter = 3.28084 feet
    'Inches': 39.3701, // 1 meter = 39.3701 inches
    'Centimeters': 100.0, // 1 meter = 100 centimeters
  };

  void convert() {
    // Convert the input value to meters (base unit)
    double valueInMeters = inputValue / conversionFactors[selectedUnit]!;

    // Convert from meters to the selected target unit
    result = valueInMeters * conversionFactors[selectedUnit1]!;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: const Color(0xFF314A69),
      body: Column(
        children: [
          Container(
            height: size.height * 0.2,
            width: size.width,
            decoration: const BoxDecoration(
              color:Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.zero,
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(40, 90, 0, 0),
              child: Text(
                'Time',
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xFF314A69),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(80, 20, 0, 0),
              child: Text(
                'From',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          Container(
            height: size.height * 0.1,
            width: size.width * 0.8,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: DropdownButton<String>(
                      value: selectedUnit,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedUnit = newValue!;
                          convert();
                        });
                      },
                      items: <String>['Hours', 'Minutes', 'Seconds']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text('|', style: TextStyle(
                      color: Colors.grey,
                      fontSize: 45,
                    ),),
                  ),


                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          // Handle the input value
                          if (double.tryParse(value) != null) {
                            inputValue = double.parse(value);
                            convert();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: size.height * 0.01),

          const Icon(
            Icons.swap_vert, // Add your desired conversion icon
            size: 68, // Set the size of the icon as desired
            color: Colors.grey, // Set the color of the icon
          ),

          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
              child: Text(
                'To',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),
          ),

          SizedBox(height: size.height * 0.01),

          Container(
            height: size.height * 0.1,
            width: size.width * 0.8,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: DropdownButton<String>(
                      value: selectedUnit1,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedUnit1 = newValue!;
                        });
                      },
                      items: <String>['Hours', 'Minutes', 'Seconds']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text('|', style: TextStyle(
                      color: Colors.grey,
                      fontSize: 45,
                    ),),
                  ),



                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: TextField(
                        keyboardType: TextInputType.number, // Allow numeric input
                        decoration: const InputDecoration(
                          border: InputBorder.none, // Remove the bottom line
                        ),
                        onChanged: (value) {
                          // Handle the input value
                          if (double.tryParse(value) != null) {
                            inputValue = double.parse(value);
                            convert();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: size.height * 0.04),

          Container(
            height: size.height*0.15,
            width: size.width*0.45,
            color: Colors.white,

            child: Column(
              children: [
                SizedBox(height: size.height * 0.08),

                const Text('Result',style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),)
              ],
            ),

          ),

          SizedBox(height: size.height * 0.04),

          Container(
            height: size.height * 0.1,
            width: size.width * 0.8,
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Center(
              child: Text('Convert',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Color(0xFF314A69),
              ),),
            ),
          )

        ],
      ),
    );
  }
}
