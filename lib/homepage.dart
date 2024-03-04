import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:task28/containerreusable.dart';
import 'package:task28/mylistview.dart';

import 'package:task28/reusableprofile.dart';

import 'containerinput.dart';
import 'screenutil.dart';
import 'colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedOption;
  List<String> _options = ['Friends', 'Work', 'Study'];
  TextEditingController textEditingController = TextEditingController();
  List<bool> isSelected = List.generate(10, (index) => false);

  List<Map<String, dynamic>> Maps = [
    {
      'Firstname': 'Thomas Abraham',
      'Lastname': 'Thomas',
      'imagepath': 'assets/h2.png',
    },
    {
      'Firstname': 'Jane willaim',
      'Lastname': 'willaim',
      'imagepath': 'assets/id5.jpg',
    },
    {
      'Firstname': 'Bob watson',
      'Lastname': 'watson',
      'imagepath': 'assets/pr.png',
    },
    {
      'Firstname': 'wattson martn',
      'Lastname': 'martn',
      'imagepath': 'assets/h2.png',
    },
    {
      'Firstname': 'kane williamson',
      'Lastname': 'williamson',
      'imagepath': 'assets/id5.jpg',
    },
    {
      'Firstname': 'virat kohli',
      'Lastname': 'willaim',
      'imagepath': 'assets/pr.png',
    },
    {
      'Firstname': 'mahendrasing dhon',
      'Lastname': 'mahendrasing',
      'imagepath': 'assets/h2.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenUtil.screenHeight(context);
    final screenWidth = ScreenUtil.screenWidth(context);
    return Scaffold(
      backgroundColor: accentColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 30, top: 12),
        //scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 32, top: 30, bottom: 20),
              child: const Text(
                'Create a Group',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const CustomContainer(
              heading1: 'Basic Information',
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 3.0, horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Group Name', style: myTextStyle),
                  const SizedBox(
                    height: 10,
                  ),
                  InputContainer(
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.4),
                        width: 1.0,
                      ),
                      child: TextField(
                        controller: textEditingController,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.only(left: 15, bottom: 12)),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('Group Type', style: myTextStyle),
                  const SizedBox(
                    height: 10,
                  ),
                  InputContainer(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.4),
                      width: 1.0,
                    ),
                    child: DropdownButtonFormField<String>(
                      value: _selectedOption,
                      items: _options.map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(
                            option,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption = newValue;
                        });
                      },
                      decoration: const InputDecoration(
                          // labelText: 'Select an option',
                          contentPadding: EdgeInsets.only(bottom: 7, left: 15),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.black)),
                      validator: (value) {
                        // Perform validation
                        if (value == null || value.isEmpty) {
                          return 'Please select an option';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Group image',
                    style: myTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DottedBorder(
                    color: Colors.black.withOpacity(0.2),
                    strokeWidth: 1,
                    dashPattern: [
                      8,
                      7,
                    ],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    child: const InputContainer(
                        child: Center(
                      child: Text(
                        // textAlign: TextAlign.center,
                        'UPLOAD IMAGE',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/id5.jpg',
                            width: screenWidth * .22,
                            height: screenHeight * .12,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 70,
                        left: 80,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const CustomContainer(heading1: 'Selected Friends', heading2: '2'),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 33.0, vertical: 14),
              width: double.infinity,
              height: screenHeight * .17,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 16); // Add empty space between items
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CustomProfile(
                        image: Maps[index]['imagepath'],
                        positionedWidget: Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Text(
                        Maps[index]['Lastname'],
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            const CustomContainer(
              heading1: 'Add friends',
            ),
            MyListView(
              arrayData: Maps,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                width: 160,
                height: 45,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor),
                    ),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        Text(
                          'Create Group',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
