import 'package:aventude_assignment/app/core/datamodels/album.dart';
import 'package:aventude_assignment/app/core/datamodels/post.dart';
import 'package:aventude_assignment/app/core/viewmodels/home_view_model.dart';
import 'package:aventude_assignment/app/screens/base_view.dart';
import 'package:aventude_assignment/app/shared/app_colors.dart';
import 'package:aventude_assignment/app/widgets/album_row.dart';
import 'package:aventude_assignment/app/widgets/post_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlbumView extends StatefulWidget {
  const AlbumView({Key? key}) : super(key: key);

  @override
  _AlbumViewState createState() => _AlbumViewState();
}

class _AlbumViewState extends State<AlbumView> {
  @override
  Widget build(BuildContext context) {
    var albums = Provider.of<List<Album>>(context);

    return BaseView<HomeViewModel>(
      onModelReady: (model) {
        model.init();
        // _connectivity.initialise();
        // _connectivity.result.listen((source) async {
        //   if (mounted) {
        //     _source = source;
        //     if ((_source[ConnectivityResult.mobile] ?? false) ||
        //         (_source[ConnectivityResult.wifi] ?? false)) {
        //       try {
        //         int result = await compute(syncNotificationCount,
        //             _user); // run notification sync in an isolate
        //         NotificationService.instance.setNotificationCount(result);
        //       } catch (e) {
        //         if (kDebugMode) {
        //           print(e);
        //         }
        //       }
        //     }
        //   }
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
                          itemCount: albums.length,
                          padding: const EdgeInsets.all(5),
                          itemBuilder: (context, i) {
                            return SizedBox(
                              height: 75.0,
                              child: Card(
                                elevation: 10,
                                shadowColor: appColorsPurple,
                                child: AlbumRow(i, albums[i]),
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
