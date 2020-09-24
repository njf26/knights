import 'package:flutter/material.dart';
import '../constants.dart';

class OptionButton extends StatelessWidget {
  final Function callback;
  final String option;

  OptionButton(this.option, this.callback);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.28,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Center(
          child: Text(
            option,
            style: kBasicTextWhite.copyWith(
              fontSize: MediaQuery.of(context).size.width * 0.04,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: kAlmostBlack,
          borderRadius: new BorderRadius.all(Radius.circular(5.0)),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3))
          ],
        ),
      ),
      onPressed: callback,
    );
  }
}
