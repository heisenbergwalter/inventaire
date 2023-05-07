import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inventaire/creerInventaireBtn.dart';
import 'package:inventaire/inscription.dart';
import 'package:inventaire/ajouterInventaire.dart';
import 'package:inventaire/showListView.dart';
import 'package:http/http.dart' as http;


class Authentification extends StatefulWidget {
  const Authentification({Key? key}) : super(key: key);

  @override
  State<Authentification> createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
  Future _submitForm(BuildContext context) async {
    if (!isValidEmail(_emailController.text) || _passwordController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Email or password is incorrect',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return false;
    } else {
      // Send login request to server
      final response = await http.post(
        Uri.parse('http://10.0.2.2:80/inventaire/login.php'),
        body: {
          'email': _emailController.text,
          'password': _passwordController.text,
        },
      );

      // Handle server response
      if (response.statusCode == 200) {
        print(response.body);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShowListView()),
        );

      } else {
        Fluttertoast.showToast(
        msg:response.reasonPhrase!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
        // Login failed, throw exception with error message
        throw Exception(response.reasonPhrase);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Wrap(
          children: [
            Container(
              height: 206,
              width: 300,
              margin: EdgeInsets.only(top: 50, left: 50),
              child: Image.asset('assets/login.jpeg'),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Authentfication',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: TextField(
                                onChanged: (text) {
                                setState(() {
                                isValid = isValidEmail(_emailController.text);
                                });},
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
                          Container(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20, bottom: 8),
                            child: TextFormField(
                              onChanged: (text) {
                                setState(() {
                                  isValid2 = isValidPassword(_passwordController.text);
                                });
                              },
                              controller: _passwordController,
                              obscureText: true,
                              decoration:  InputDecoration(
                                prefixIcon: Icon(Icons.security),
                                border: OutlineInputBorder(),
                                errorText: isValid2 ? null : 'Invalid password',
                                labelText: 'Mot de Passe',
                                hintText: 'Entrez Votre Mot de Passe ',
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 120,
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Function to be called when the button is pressed
                              },
                              child: const Text("Mote de passe oublié ?"),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 40, left: 40, right: 40, bottom: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(60),
                                  backgroundColor: Color(0xFF1450AA),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                onPressed: () {
                                  _submitForm(context);

                                },
                                child: Text('Se Connecter'),
                              )),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 100),
                                child: Text("je n'ai pas de compte ?"),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Function to be called when the button is pressed
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                        return Inscription();
                                      }));
                                },
                                child: const Text("S'inscrire"),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}