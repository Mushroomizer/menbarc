import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Consts {
  Consts._();

  static const double padding = 8.0;
  static const double avatarRadius = 33.0;
}

class CircleImageDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget content;
  final IconData iconData;
  final Color iconBackgrounColor;
  final Function onButtonPressed;

  CircleImageDialog(
      {@required this.title,
      @required this.description,
      @required this.content,
      @required this.buttonText,
      @required this.iconData,
      @required this.iconBackgrounColor,
      this.onButtonPressed});

  Widget dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: Consts.avatarRadius + Consts.padding,
            bottom: Consts.padding,
            left: Consts.padding,
            right: Consts.padding,
          ),
          margin: EdgeInsets.only(top: Consts.avatarRadius),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(Consts.padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
              content,
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    onButtonPressed();
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text(buttonText),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Consts.padding,
          right: Consts.padding,
          child: CircleAvatar(
            child: Icon(
              iconData,
              size: Consts.avatarRadius,
            ),
            backgroundColor: iconBackgrounColor,
            radius: Consts.avatarRadius,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
