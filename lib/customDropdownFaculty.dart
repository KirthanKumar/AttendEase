import 'package:flutter/material.dart';

class CustomDropdownFaculty extends StatefulWidget {
  final List<String> items;

  CustomDropdownFaculty({required this.items});

  @override
  _CustomDropdownFacultyState createState() => _CustomDropdownFacultyState();
}

class _CustomDropdownFacultyState extends State<CustomDropdownFaculty> {
  List<String> selectedValues = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
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
              value: selectedValues.isEmpty ? widget.items.first : selectedValues.last,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.transparent,
              ),
              onChanged: (String? newValue) {
                if (newValue != null && newValue!=widget.items.first && newValue!=selectedValues.contains(newValue)) {
                  setState(() {
                    selectedValues.add(newValue);
                  });
                }
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
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          children: selectedValues
              .map((value) => InputChip(
                    label: Text(value),
                    onDeleted: () {
                      setState(() {
                        selectedValues.remove(value);
                      });
                    },
            backgroundColor: Colors.blue.shade100,
            labelStyle: TextStyle(color: Colors.black),
            deleteIconColor: Colors.black,
            elevation: 2,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
