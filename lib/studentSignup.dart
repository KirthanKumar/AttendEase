import 'package:attendease/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:attendease/customDropdownStudent.dart';

class StudentSignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _StudentSignUpState();
}

class _StudentSignUpState extends State<StudentSignUp> {

  static List<String> sem = ["Select Semester", "1", '2', '3', '4', '5', '6', '7', '8'];
  static List<String> section = ["Select Section",'A', 'B', 'C', 'D'];

  var USNcontroller = TextEditingController();
  var phNOScontroller = TextEditingController();
  var OTPScontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            labelText: 'USN',
            contro: USNcontroller,
            obscureTextIsIt: false,
            keyboard: TextInputType.text,
            labelTextStyle: TextStyle(color: Colors.black),
            suffixIcon: Icon(Icons.person, color: Colors.black,),
          ),
        ),

        // Add DropdownButton for semester, section, phone number, OTP
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomDropdownStudent(items: sem),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomDropdownStudent(items: section),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextFormField(
            labelText: 'Phone Number',
            keyboard: TextInputType.number,
            contro: phNOScontroller,
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
            contro: OTPScontroller,
            obscureTextIsIt: true,
            suffixIcon: Icon(Icons.password, color: Colors.black,),
            labelTextStyle: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
