import 'package:aventude_assignment/app/core/viewmodels/home_view_model.dart';
import 'package:aventude_assignment/app/screens/album_view.dart';
import 'package:aventude_assignment/app/screens/base_view.dart';
import 'package:aventude_assignment/app/screens/posts_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) {
        model.init();
      },
      builder: (context, model, child) => Stack(
        children: [
          DefaultTabController(
            length: 2,
            child: Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                appBar: AppBar(
                  bottom: const TabBar(
                    indicatorWeight: 2,
                    tabs: [
                      Tab(
                        text: "Posts",
                      ),
                      Tab(
                        text: "Albums",
                      )
                    ],
                  ),
                  title: Text(
                    "Home",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  centerTitle: true,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                body: const TabBarView(
                  children: [PostView(), AlbumView()],
                )),
          )
        ],
      ),
    );
  }
}
