import 'package:aventude_assignment/app/core/constants/appconstans.dart';
import 'package:aventude_assignment/app/core/datamodels/post.dart';
import 'package:aventude_assignment/app/core/viewmodels/home_view_model.dart';
import 'package:aventude_assignment/app/screens/base_view.dart';
import 'package:aventude_assignment/app/shared/app_colors.dart';
import 'package:aventude_assignment/app/widgets/post_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostView extends StatefulWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    var posts = Provider.of<List<Post>>(context);

    return BaseView<HomeViewModel>(
      onModelReady: (model) {
        model.init();
      },
      builder: (context, model, child) => Stack(
        children: [
          Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
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
                          itemCount: posts.length,
                          padding: const EdgeInsets.all(5),
                          itemBuilder: (context, i) {
                            return SizedBox(
                              height: 100.0,
                              child: GestureDetector(
                                  onTap: () async {
                                    bool result =
                                        await model.getComments(posts[i].id!);

                                    if (result) {
                                      Navigator.pushNamed(
                                          context, RoutePaths.comment);
                                    }
                                  },
                                  child: Card(
                                    elevation: 10,
                                    shadowColor: appColorsPurple,
                                    child: PostViewRow(i, posts[i]),
                                  )),
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
