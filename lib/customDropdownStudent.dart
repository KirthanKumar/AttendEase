import 'package:flutter/material.dart';

class CustomDropdownStudent extends StatefulWidget {
  final List<String> items;

  CustomDropdownStudent({required this.items});
  @override
  _CustomDropdownStudentState createState() => _CustomDropdownStudentState();
}

class _CustomDropdownStudentState extends State<CustomDropdownStudent> {
  String selectedValue = "";

  @override
  void initState() {
    super.initState();
    selectedValue = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
          border: Border.all(color: Colors.grey),
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade300],
            stops: [0.2, 1.0],
          ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
          
        ],
      ),
      child: Center(
        child: DropdownButton<String>(
          value: selectedValue,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
          items: widget.items
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
