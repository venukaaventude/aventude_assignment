import 'package:aventude_assignment/app/shared/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Alert {
  static BuildContext? context;

  static showLoaderDialog(BuildContext contextFrmUser) {
    if (context == null) {
      context = contextFrmUser;
      AlertDialog alert = AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: SizedBox(
          height: 75.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 5.0,
                valueColor: AlwaysStoppedAnimation<Color?>(Colors.blue[900]),
              ),
              UIHelper.verticalSpaceSmall,
              Container(
                  margin: const EdgeInsets.only(left: 7),
                  child: const Text("Loading...",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0))),
            ],
          ),
        ),
      );
      showDialog(
        barrierDismissible: false,
        barrierColor: Colors.black38,
        context: context!,
        builder: (BuildContext ctx) {
          Future.delayed(const Duration(seconds: 30), () {
            Navigator.of(ctx, rootNavigator: true).pop();
            context = null;
          });

          return alert;
        },
      );
    }
  }

  static showErrorSingleButtonBox(
      BuildContext context, String title, String msg) {
    DangerAlertBox(context: context, title: title, messageText: msg);
  }

  static showSuccessingleButtonBox(
      BuildContext context, String title, String msg) {
    SuccessAlertBox(context: context, title: title, messageText: msg);
  }

  static dismissAlert() {
    Navigator.of(context!, rootNavigator: true).pop();
    context = null;
  }

  static showToast(String msg, Color color) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 15.0);
  }
}
