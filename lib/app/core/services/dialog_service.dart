import 'dart:async';

import 'package:aventude_assignment/app/core/datamodels/alert.dart';
import 'package:aventude_assignment/app/core/datamodels/alert_request.dart';
import 'package:aventude_assignment/app/core/datamodels/alert_response.dart';
import 'package:aventude_assignment/app/shared/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;

class DialogService {
  late Function(AlertRequest) _showDialogListener;
  Completer<AlertResponse>? _dialogCompleter;

  void registerDialogListener(Function(AlertRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  Future<AlertResponse> showDialog(
      {String? title,
      String? description,
      String buttonTitle = 'OK',
      String? cancelButtonTitle,
      double fontSize = 14,
      bool barrierDismissible = false}) {
    _dialogCompleter = Completer<AlertResponse>();

    _showDialogListener(AlertRequest(
        title: title,
        description: description,
        confirmButtonTitle: buttonTitle,
        cancelButtonTitle: cancelButtonTitle,
        fontSize: fontSize,
        barrierDismissible: barrierDismissible));
    return _dialogCompleter!.future;
  }

  void dialogComplete(AlertResponse response) {
    _dialogCompleter?.complete(response);
    _dialogCompleter = null;
  }

  Future<String> remakDialog(BuildContext context,
      [String? reason, String? remark]) async {
    var remarksController = TextEditingController();
    return await material.showDialog(
        context: context,
        builder: (context) => AlertDialog(
              scrollable: true,
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: Column(
                      children: <Widget>[
                        Text(
                          reason!,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        UIHelper.verticalSpaceMedium,
                        TextFormField(
                          controller: remarksController..text = remark ?? '',
                          maxLength: 250,
                          maxLines: 2,
                          decoration: const InputDecoration(
                            hintText: 'Remark',
                          ),
                        ),
                        UIHelper.verticalSpaceMedium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.12,
                                child: ElevatedButton(
                                    child: const Text(
                                      'CANCEL',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      remarksController.text = '';
                                      Navigator.pop(
                                          context, remarksController.text);
                                    }),
                              ),
                            ),
                            UIHelper.horizontalSpaceVeryTiny,
                            Expanded(
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.12,
                                child: ElevatedButton(
                                    child: const Text(
                                      'CONFIRM',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () async {
                                      if (remarksController.text.isEmpty) {
                                        Alert.showToast(
                                            "Please provide the remark.",
                                            Colors.red);
                                        return;
                                      } else {
                                        Navigator.pop(
                                            context, remarksController.text);
                                      }
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ));
  }
}
