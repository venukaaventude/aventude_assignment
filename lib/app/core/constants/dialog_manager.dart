import 'package:aventude_assignment/app/core/datamodels/alert_request.dart';
import 'package:aventude_assignment/app/core/datamodels/alert_response.dart';
import 'package:aventude_assignment/app/core/services/dialog_service.dart';
import 'package:aventude_assignment/app/router/locator.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

  const DialogManager({Key? key, required this.child}) : super(key: key);

  @override
  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  final _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(AlertRequest request) {
    List<DialogButton> buttonList = [];

    if (request.cancelButtonTitle != null) {
      buttonList.add(
        DialogButton(
          child: Text(request.cancelButtonTitle ?? ''),
          onPressed: () {
            _dialogService.dialogComplete(AlertResponse(confirmed: false));
            Navigator.of(context).pop();
          },
        ),
      );
    }

    buttonList.add(
      DialogButton(
        child: Text(
          request.confirmButtonTitle ?? '',
          style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              fontFamily: 'Avenir',
              color: Colors.white),
        ),
        color: Theme.of(context).buttonTheme.colorScheme!.secondary,
        onPressed: () {
          _dialogService.dialogComplete(AlertResponse(confirmed: true));
          Navigator.of(context).pop();
        },
      ),
    );

    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: request.barrierDismissible ?? false,
      descStyle:
          TextStyle(fontWeight: FontWeight.bold, fontSize: request.fontSize),
      animationDuration: const Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: const BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: const TextStyle(
        color: Colors.grey,
      ),
    );

    Alert(
            context: context,
            style: alertStyle,
            title: request.title,
            type: AlertType.none,
            desc: request.description,
            closeFunction: () =>
                _dialogService.dialogComplete(AlertResponse(confirmed: false)),
            buttons: buttonList,
            useRootNavigator: false)
        .show();
  }
}
