import 'package:attendease/customTextField.dart';
import 'package:attendease/main.dart';
import 'package:attendease/resetPassword.dart';
import 'package:attendease/customButton.dart';
import 'package:attendease/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login>{

  var uNameController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Icon(Icons.account_circle, size: 100, color: Colors.blue,),
              // ),
              Image.asset('assets/images/background.png', width: 300, fit: BoxFit.fill,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  labelText: 'Email',
                  keyboard: TextInputType.emailAddress,
                  contro: uNameController,
                  obscureTextIsIt: false,
                  suffixIcon: Icon(Icons.email, color: Colors.black,),
                  labelTextStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 11,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                // child: TextField(
                //   controller: passController,
                //   obscureText: true,
                //   keyboardType: TextInputType.visiblePassword,
                //   decoration: InputDecoration(
                //       label: Text('Password', style: TextStyle(color: Colors.black),),
                //       suffixIcon: Icon(Icons.password, color: Colors.black,),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(21),
                //       )
                //   ),
                // ),
                child: CustomTextFormField(
                  labelText: 'Password',
                  keyboard: TextInputType.visiblePassword,
                  contro: passController,
                  obscureTextIsIt: true,
                  suffixIcon: Icon(Icons.password, color: Colors.black,),
                  labelTextStyle: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 11,),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword()));
              }, child: Text('Forgot Password')),
              SizedBox(
                width: 110,
                child: RoundButton(
                  btnName: 'Login',
                  icon: Icon(Icons.lock, color: Colors.blue.shade900,),
                  callBack: () async{
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: 'AttendEase')));
                  },
                  textStyle: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
              }, child: Text('New User? Register Here')),
            ],
          ),
        ),
      ),
    );
  }
}