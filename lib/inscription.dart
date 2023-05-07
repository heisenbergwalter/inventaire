import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inventaire/authentification.dart';
import 'package:http/http.dart' as http;

import 'package:inventaire/logintest.dart';
class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  bool isValid = false;
  bool isValid2 = false;


  bool isValidPassword(String password) {
    String passwordRegex = "^[A-Za-z0-9]{8}\$";

    RegExp regExp = RegExp(passwordRegex);
    return regExp.hasMatch(password);

  }


  bool isValidEmail(String email) {
    String emailRegex = r'^([a-zA-Z0-9_\.-]+)@([\da-zA-Z\.-]+)\.([a-zA-Z\.]{2,6})$';

    RegExp regExp = RegExp(emailRegex);
    return regExp.hasMatch(email);

  }

  void _submitForm(BuildContext context) async {
    final data = {
      "email":_emailController.text,
      "password":_passwordController.text,
      "full_name":_fullNameController.text,
      "phone":_phoneController.text
    };
    // Send login request to server
    final response = await http.post(
        Uri.parse('http://10.0.2.2:80/inventaire/signUp.php'),
        body:jsonEncode(data)
    );

    // Handle server response
    if (response.statusCode == 200) {
      print(response.body);
      // Login successful, navigate to home page
    } else {
      // Login failed, display error message
      throw Exception(response.reasonPhrase);
    }

    //RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    //if(emailRegex.matchAsPrefix(_emailController.text) != null){

    // }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Wrap(
          children: [
            Container(
                margin: EdgeInsets.only(top: 45,left: 20) ,
                child: IconButton(
                  icon: Icon(Icons.arrow_back,size: 30,),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return Authentification();
                    }));
                  },
                )

            ),
            Container(
              height: 150,
              width: 300,
              margin: EdgeInsets.only(top: 0,left: 50),
              child: Image.asset('assets/inscription.jpeg'),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("S'indentifier",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
                  SizedBox(height: 50,),
                  Padding(padding: EdgeInsets.only(left: 15,right: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15,right: 15),
                          child: TextField(
                            onChanged: (text) {
                              setState(() {
                                isValid = isValidEmail(_emailController.text);
                              });
                            },
                            controller: _emailController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(),
                              errorText: isValid ? null : 'Invalid email',
                              labelText: 'Email',
                              hintText: 'Entrez Votre Email',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 15,right: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15,right: 15,top: 10),
                          child: TextField(
                            controller: _fullNameController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                              labelText: 'Nom et prénom',
                              hintText: 'Entrez Votre Nom et prénom',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 15,right: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15,right: 15,top: 10),
                          child: TextField(
                            onChanged: (text) {
                              setState(() {
                                isValid2 = isValidPassword(_passwordController.text);
                              });
                            },
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.security),
                              border: OutlineInputBorder(),
                              errorText: isValid2 ? null : 'Invalid password',
                              labelText: 'Mot de Passe',
                              hintText: 'Entrez Votre Mot de Passe ',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 15,right: 15),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15,right: 15,top: 10),
                          child: TextField(
                            controller: _phoneController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(),
                              labelText: 'Téle',
                              hintText: 'Entrez Votre Téléphone',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                  Padding(
                      padding: EdgeInsets.only(top: 40,left: 40,right: 40,bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(60),
                          backgroundColor:  Color(0xFF1450AA),
                          shape: RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onPressed: () {

                          if(isValid && isValid2){
                            try{
                              _submitForm(context);
                            }catch(e){
                              throw Exception(e);
                            }
                            }
                        },
                        child: Text("S'incrire"),
                      )
                  ),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 100),
                        child: Text("nous a rejoint avant "),

                      ),
                      TextButton(
                        onPressed: () {

                          // Function to be called when the button is pressed
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return Authentification();
                          }));

                        },
                        child: Text("Se Connecter"),
                      )
                    ],
                  )

                ],
              ),

            ),
          ],
        ),


      ),
    );
  }
}
