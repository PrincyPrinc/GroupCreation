import 'package:flutter/material.dart';
import 'reusableprofile.dart';
import 'screenutil.dart';
import 'colors.dart';

class MyListView extends StatefulWidget {
  final List<Map<String, dynamic>> arrayData;
  MyListView({required this.arrayData});

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  List<bool> isSelected = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      //scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey.shade300,
          thickness: 1.0,
        );
      },
      itemCount: widget.arrayData.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              isSelected[index] = !isSelected[index];
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 33.0,
            ),
            child: Row(
              children: [
                Stack(
                  children: [
                    CustomProfile(
                      image: widget.arrayData[index]['imagepath'],
                    ),
                    if (isSelected[index])
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  widget.arrayData[index]['Firstname'],
                  style: TextStyle(fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
