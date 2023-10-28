import 'package:flutter/material.dart';

class speedPage extends StatefulWidget {
  const speedPage({super.key});

  @override
  State<speedPage> createState() => _speedPageState();
}

class _speedPageState extends State<speedPage> {
  String selectedUnit = 'km/hr';
  String selectedUnit1 = 'm/s';
  double inputValue = 0.0;
  double result = 0.0;

  void convert() {
    if (selectedUnit == 'km/hr' && selectedUnit1 == 'm/s') {
      result = inputValue * 1000 / 3600;
    } else if (selectedUnit == 'm/s' && selectedUnit1 == 'km/hr') {
      result = inputValue * 3600 / 1000;
    }
    setState(() {});
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
                  'Speed',
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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25)
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
                        items: <String>['km/hr', 'm/s']
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
                          style: const TextStyle(fontSize: 30,
                          color: Colors.black54),
                          decoration: const InputDecoration(
                            hintText: '0.0',
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
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25)
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
                        items: <String>['km/hr', 'm/s']
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

                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            '$result', // Display the result value
                            style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: size.height * 0.04),



            SizedBox(height: size.height * 0.04),

            GestureDetector(
              onTap: (){
                convert();
              },
              child: Container(
                height: size.height * 0.1,
                width: size.width * 0.8,
                decoration:  BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(25)
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
