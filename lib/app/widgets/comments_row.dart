import 'package:aventude_assignment/app/core/datamodels/comment.dart';
import 'package:aventude_assignment/app/shared/text_view.dart';
import 'package:aventude_assignment/app/shared/ui_helper.dart';
import 'package:flutter/material.dart';

class CommentiewRow extends StatefulWidget with TextViewClass {
  final int position;
  final Comments model;

  @override
  _CommentiewRowState createState() => _CommentiewRowState();

  CommentiewRow(this.position, this.model, {Key? key}) : super(key: key);
}

class _CommentiewRowState extends State<CommentiewRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceVerySmall,
            Row(
              children: [
                const Text(" • "),
                TextViewClass().setText("Name : ", false),
                Flexible(
                  child: TextViewClass().setText(widget.model.name ?? '', true),
                ),
              ],
            ),
            UIHelper.verticalSpaceVerySmall,
            Row(
              children: [
                const Text(" • "),
                TextViewClass().setText("Comments : ", false),
                Flexible(
                  child: TextViewClass().setText(widget.model.body ?? '', true),
                ),
              ],
            ),
            UIHelper.verticalSpaceSmall
          ]),
    );
  }
}
