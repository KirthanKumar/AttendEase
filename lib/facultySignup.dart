import 'package:attendease/customDropdownFaculty.dart';
import 'package:attendease/customTextField.dart';
import 'package:flutter/material.dart';

class FacultySignUp extends StatelessWidget {

  static List<String> sem = ["Select [Semester]'s you handle","1", '2', '3', '4', '5', '6', '7', '8'];
  static List<String> section = ["Select [Section]'s you handle", 'A', 'B', 'C', 'D'];
  static List<String> course = ["Select [course]'s you handle", "Advanced Algorithm", "Cryptography", "Complier Design", "Internet of Things", "Artificial Intillegence"];

  var phNOFcontroller = TextEditingController();
  var OTPFcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomDropdownFaculty(items: sem),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomDropdownFaculty(items: section),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomDropdownFaculty(items: course),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            labelText: 'Phone Number',
            keyboard: TextInputType.number,
            contro: phNOFcontroller,
            obscureTextIsIt: false,
            suffixIcon: Icon(Icons.phone, color: Colors.black,),
            labelTextStyle: TextStyle(color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            labelText: 'OTP',
            keyboard: TextInputType.visiblePassword,
            contro: OTPFcontroller,
            obscureTextIsIt: true,
            suffixIcon: Icon(Icons.password, color: Colors.black,),
            labelTextStyle: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
