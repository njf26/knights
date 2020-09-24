import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '../constants.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class AuthenticatedScreen extends StatefulWidget {
  static String id = '/authenticated';

  @override
  _AuthenticatedScreenState createState() => _AuthenticatedScreenState();
}

class _AuthenticatedScreenState extends State<AuthenticatedScreen> {
  //final _auth = FirebaseAuth.instance;
  //final _firestore = FirebaseFirestore.instance;
  //User loggedInUser;
  bool showSpinner = false;
  String newNickname;
  String nicknameMessage;

  /*Future<void> setNicknameMessage() async {
    DocumentSnapshot userSnapshot = await _firestore.doc(loggedInUser.email).get();
    String nickname = userSnapshot.get('nickname');
    nicknameMessage = nickname == ""
        ? "It looks like you " +
            "don't have a nickname yet for your account. This is the name that will display" +
            "on the scoreboards."
        : "Welcome $nickname!";
    nicknameMessage += "\n You may change your account nickname below:\n";
  }*/

  @override
  void initState() {
    super.initState();
    //setNicknameMessage();
  }

  @override
  Widget build(BuildContext context) {
    //loggedInUser = _auth.currentUser;

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
              Text(nicknameMessage),
              TextField(
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  newNickname = value;
                },
                decoration: kTextInputDecor.copyWith(
                  hintText: 'Nickname',
                ),
              ),
              SizedBox(
                height: 8.0,
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

                      //Change nickname.
                      /*try {
                        _firestore
                            .collection('users')
                            .doc(loggedInUser.email)
                            .set({'nickname': newNickname});

                        setState(() async {
                          await setNicknameMessage();
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
                      'Set Nickname',
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
