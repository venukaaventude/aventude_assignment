import 'package:aventude_assignment/app/core/constants/dialog_manager.dart';
import 'package:aventude_assignment/app/core/datamodels/album.dart';
import 'package:aventude_assignment/app/core/datamodels/comment.dart';
import 'package:aventude_assignment/app/core/datamodels/post.dart';
import 'package:aventude_assignment/app/core/datamodels/user.dart';
import 'package:aventude_assignment/app/core/services/api.dart';
import 'package:aventude_assignment/app/core/services/authentication_service.dart';
import 'package:aventude_assignment/app/core/services/theme_service.dart';
import 'package:aventude_assignment/app/router/locator.dart';
import 'package:aventude_assignment/app/screens/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aventude_assignment/app/router/routes.dart' as route;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  // Load Theme
  ThemeService themeService = locator<ThemeService>();
  String? _darkMode;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  try {
    _darkMode = prefs.getString("dark_mode");
    _darkMode ??= 'No';
  } catch (e) {
    if (kDebugMode) {
      print("User Not Found: $e");
    }
  }
  ThemeData _themeData = themeService.getTheme(_darkMode!);

  Api.initAPIEndPoint(prefs);
  runApp(
    MyApp(
      themeData: _themeData,
    ),
  );
}

class MyApp extends StatefulWidget {
  final ThemeData themeData;

  const MyApp({required this.themeData});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _auth = locator<AuthenticationService>();

  @override
  void initState() {
    super.initState();
    _auth.initial();
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationService _auth = locator<AuthenticationService>();

    return MultiProvider(
      providers: [
        StreamProvider<User>(
            initialData: User.initial(),
            updateShouldNotify: (User previous, User current) =>
                (current != previous),
            create: (context) => _auth.user),
        StreamProvider<List<Post>>(
            initialData: const [],
            updateShouldNotify: (List<Post> previous, List<Post> current) =>
                (!listEquals(previous, current)),
            create: (context) => _auth.post),
        StreamProvider<List<Album>>(
            initialData: const [],
            updateShouldNotify: (List<Album> previous, List<Album> current) =>
                (!listEquals(previous, current)),
            create: (context) => _auth.album),
        StreamProvider<List<Comments>>(
            initialData: const [],
            updateShouldNotify:
                (List<Comments> previous, List<Comments> current) =>
                    (!listEquals(previous, current)),
            create: (context) => _auth.comments),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aventude',
        builder: (context, widget) => Navigator(
          onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(
              child: widget ?? Container(),
            ),
          ),
        ),
        theme: widget.themeData,
        home: const RedirectionWidget(),
        onGenerateRoute: route.Router.generateRoute,
      ),
    );
  }
}

class RedirectionWidget extends StatelessWidget {
  const RedirectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<User?>(
        builder: (BuildContext context, User? user, Widget? child) {
      if (user == null || user.status == UserStatus.uninitialized) {
        return const LoginView();
      } else if (user.status == UserStatus.unauthenticated) {
        return const LoginView();
      } else if (user.status == UserStatus.authenticated) {
        return const LoginView();
      }
      return Container();
    });
  }
}
