import 'package:aventude_assignment/app/core/constants/appconstans.dart';
import 'package:aventude_assignment/app/core/viewmodels/login_view_model.dart';
import 'package:aventude_assignment/app/screens/base_view.dart';
import 'package:aventude_assignment/app/screens/home_view.dart';
import 'package:aventude_assignment/app/shared/keyboard_handler.dart';
import 'package:aventude_assignment/app/widgets/button_with_progress_indicator.dart';
import 'package:aventude_assignment/app/widgets/decorated_text_field.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with DismissKeyboard {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            dismissKeyboard(context);
          },
          child: SafeArea(
            top: true,
            bottom: false,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      /* -- Logo Area -- */
                      const SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 115.0,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: Container(
                            height: 32.0,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/aventude.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 65,
                      ),
                      /* -- User Email -- */
                      TextFieldWidget(
                        controller: _emailController,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        prefixIconData: Icons.mail_outline,
                        onChanged: (value) {
                          //model.isValidEmail(value);
                        },
                      ),

                      /* -- Spacer -- */
                      const SizedBox(height: 24.0),

                      /* -- Password & Forgot Password Section -- */
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          /* -- Password -- */
                          TextFieldWidget(
                              controller: _passwordController,
                              hintText: 'Password',
                              obscureText: !model.isPasswordVisible,
                              //model.isVisible ? false : true,
                              prefixIconData: Icons.lock_outline,
                              suffixIconData: model.isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              onSuffixIconTap: () {
                                setState(() {
                                  model.isPasswordVisible =
                                      !model.isPasswordVisible;
                                });
                              }),

                          /* -- Forgot password -- */
                          InkWell(
                            splashColor: const Color(0xf1f1f1fe),
                            highlightColor: const Color(0xb1fefefe),
                            onTap: () async {},
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, bottom: 20.0),
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .buttonTheme
                                      .colorScheme!
                                      .secondary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      /* -- Login Button -- */
                      ButtonWithProgressIndicator(
                        title: 'Login',
                        hasBorder: false,
                        shouldDismissKeyboard: true,
                        isBusy: model.isLoginInprogress,
                        onTap: () async {
                          bool result = await model.login(
                            _emailController.text,
                            _passwordController.text,
                          );

                          if (result) {
                            Navigator.pushNamed(context, RoutePaths.home);
                          }
                        },
                      ),

                      /* -- Spacer -- */
                      const SizedBox(
                        height: 40.0,
                      ),

                      /* -- Spacer -- */
                      const SizedBox(
                        height: 40.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
