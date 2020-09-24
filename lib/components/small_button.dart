import 'package:flutter/material.dart';
import '../constants.dart';

class SmallButton extends StatelessWidget {
  final String text;
  final Function onPress;

  const SmallButton({@required this.text, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: kAlmostBlack,
            borderRadius: new BorderRadius.only(
              topRight: Radius.circular(3.0),
              bottomRight: Radius.circular(3.0),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ],
          ),
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.45,
          child: Text(
            text,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.02,
              color: kAlmostWhite,
              fontFamily: kBasicFont,
            ),
          ),
        ),
        onPressed: onPress,
      ),
    );
  }
}
