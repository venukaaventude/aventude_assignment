import 'package:aventude_assignment/app/core/datamodels/comment.dart';
import 'package:aventude_assignment/app/core/viewmodels/home_view_model.dart';
import 'package:aventude_assignment/app/screens/base_view.dart';
import 'package:aventude_assignment/app/shared/app_colors.dart';
import 'package:aventude_assignment/app/widgets/comments_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentView extends StatefulWidget {
  const CommentView({Key? key}) : super(key: key);

  @override
  _CommentViewState createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  @override
  Widget build(BuildContext context) {
    var comments = Provider.of<List<Comments>>(context);
    return BaseView<HomeViewModel>(
      onModelReady: (model) {
        model.init();
      },
      builder: (context, model, child) => Stack(
        children: [
          Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              title: Text(
                "Comments",
                style: Theme.of(context).textTheme.headline5,
              ),
              centerTitle: true,
              backgroundColor: Theme.of(context).primaryColor,
            ),
            body: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: comments.length,
                          padding: const EdgeInsets.all(5),
                          itemBuilder: (context, i) {
                            return SizedBox(
                              height: 100.0,
                              child: Card(
                                elevation: 10,
                                shadowColor: appColorsPurple,
                                child: CommentiewRow(i, comments[i]),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),

                // /*- Divider -*/
                // Divider(
                //   color: Theme.of(context).primaryColor,
                //   height: 5.0,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
