import 'package:attendease/facultySignup.dart';
import 'package:attendease/customButton.dart';
import 'package:attendease/studentSignup.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isStudent = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mode = isStudent ? "Student" : "Faculty";
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [Colors.blue.shade100, Colors.blue.shade300],
              stops: [0.2, 1.0],
            )
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundButton(
                      btnName: 'SignUp as student',
                      icon: Icon(Icons.person_add, color: Colors.blue.shade900,),
                      callBack: (){ // callBack function does not take or return anything just does the specified work
                        setState(() {
                          isStudent = true;
                        });
                      },
                      textStyle: TextStyle(fontSize: 11, color: Colors.white),
                    ),
                    RoundButton(
                      btnName: 'SignUp as faculty',
                      icon: Icon(Icons.person_add, color: Colors.blue.shade900,),
                      callBack: (){ // callBack function does not take or return anything just does the specified work
                        setState(() {
                          isStudent = false;
                        });
                      },
                      textStyle: TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  ],
                ),
                Image.asset('assets/images/background.png', width: 300, fit: BoxFit.fill,),
                Text('$mode SignUp'),
                SizedBox(height: 10),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 500),
                  child: isStudent ? StudentSignUp() : FacultySignUp(),
                ),
                SizedBox(
                  width: 110,
                  child: RoundButton(
                    btnName: 'Submit',
                    icon: Icon(Icons.send, color: Colors.blue.shade900,),
                  callBack: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Form is valid, perform sign-up logic
                    }
                  },
                    textStyle: TextStyle(fontSize: 11, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
