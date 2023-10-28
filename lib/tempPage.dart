import 'package:flutter/material.dart';

class tempPage extends StatefulWidget {
  const tempPage({super.key});

  @override
  State<tempPage> createState() => _tempPageState();
}

class _tempPageState extends State<tempPage> {
  String selectedUnit = 'Celsius';
  String selectedUnit1 = 'Fahrenheit';
  double inputValue = 0.0;
  double result = 0.0;

  void convert() {
    if (selectedUnit == 'Celsius') {
      if (selectedUnit1 == 'Fahrenheit') {
        result = (inputValue * 9 / 5) + 32;
      } else if (selectedUnit1 == 'Kelvin') {
        result = inputValue + 273.15;
      }
    } else if (selectedUnit == 'Fahrenheit') {
      if (selectedUnit1 == 'Celsius') {
        result = (inputValue - 32) * 5 / 9;
      } else if (selectedUnit1 == 'Kelvin') {
        result = (inputValue + 459.67) * 5 / 9;
      }
    } else if (selectedUnit == 'Kelvin') {
      if (selectedUnit1 == 'Celsius') {
        result = inputValue - 273.15;
      } else if (selectedUnit1 == 'Fahrenheit') {
        result = (inputValue * 9 / 5) - 459.67;
      }
    }
    setState(() {}); // Update the UI with the calculated result
  }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: const Color(0xFF314A69),
      body: SingleChildScrollView(
        child: Column(
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
                  'Temperature',
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
                          });
                        },
                        items: <String>['Celsius', 'Fahrenheit', 'Kelvin']
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
                        items: <String>['Celsius', 'Fahrenheit', 'Kelvin']
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
                  SizedBox(height: size.height * 0.02),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 9),
                    child: Text(
                      '$result', // Display the result value
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                      ),
                    ),
                  ),



                  const Text('Result',style: TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),)
                ],
              ),

            ),

            SizedBox(height: size.height * 0.04),

            GestureDetector(
              onTap: (){
                convert();
              },
              child: Container(
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
              ),
            )

          ],
        ),
      ),
    );
  }
}
