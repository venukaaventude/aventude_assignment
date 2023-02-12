import 'package:aventude_assignment/app/core/datamodels/post.dart';
import 'package:aventude_assignment/app/shared/text_view.dart';
import 'package:aventude_assignment/app/shared/ui_helper.dart';
import 'package:flutter/material.dart';

class PostViewRow extends StatefulWidget with TextViewClass {
  final int position;
  final Post model;

  @override
  _PostViewRowState createState() => _PostViewRowState();

  PostViewRow(this.position, this.model, {Key? key}) : super(key: key);
}

class _PostViewRowState extends State<PostViewRow> {
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
                TextViewClass().setText("Title : ", false),
                Flexible(
                  child:
                      TextViewClass().setText(widget.model.title ?? '', true),
                ),
              ],
            ),
            UIHelper.verticalSpaceVerySmall,
            Row(
              children: [
                const Text(" • "),
                TextViewClass().setText("Message : ", false),
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
