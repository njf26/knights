import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../constants.dart';
import 'home_page.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  final HomePage loginParent;

  const LoginScreen({Key key, @required this.loginParent}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final _auth = FirebaseAuth.instance;
  //final _firestore = FirebaseFirestore.instance;
  bool showSpinner = false;
  String email;
  String password;
  static const HOME_INDEX = 0;
  static const ACCOUNT_AUTHENTICATED_INDEX = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType:
                    TextInputType.emailAddress, //makes adding email easier
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextInputDecor.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true, //make secret password dots
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextInputDecor.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  elevation: 5.0,
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () async {
                      setState(() {
                        showSpinner = true;
                      });

                      //Implement login/registration functionality.
                      /*try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);

                        //if login fails check if they can register
                        if (user == null) {
                          final newUser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                          //if registration worked change to authenticated view
                          if (newUser != null) {
                            //add user to users store
                            _firestore.collection('users').doc(email).set({
                              'nickname': '',
                              'firstScore': 0,
                              'secondScore': 0,
                              'thirdScore': 0
                            });

                            widget.loginParent
                                .changePage(ACCOUNT_AUTHENTICATED_INDEX);
                          } else {
                            //otherwise they have an account but messed up login credentials. Send back home
                            widget.loginParent.changePage(HOME_INDEX);
                          }
                        } else if (user != null) {
                          //if login worked change to authenticated view
                          widget.loginParent
                              .changePage(ACCOUNT_AUTHENTICATED_INDEX);
                        }

                        setState(() {
                          showSpinner = false;
                        });
                      } catch (e) {
                        Navigator.pop(context);
                        print(e);
                      }*/
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
