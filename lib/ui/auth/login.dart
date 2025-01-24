import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan/ui/dashboard/dashboard_view.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_colors.dart';
import '../../components/submit_button.dart';
import '../../components/text_field_widget.dart';
import 'auth_viewmodel.dart';

class Login extends StatefulWidget {
  final String? username;
  const Login({super.key, required this.username});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<AuthViewModel>.reactive(
        onViewModelReady: (model) {
          // model.init(widget.username);
        },
        viewModelBuilder: () => AuthViewModel(),
        builder: (context, model, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                      ),
                      Text(
                        'Login here',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24,
                            color: kcSecondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Welcome back my scanner',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 30),
                      TextFieldWidget(
                        hint: "Email",
                        controller: model.email,
                      ),
                      SizedBox(height: 16),
                      TextFieldWidget(
                        hint: "Password",
                        controller: model.password,
                        obscureText: model.obscure,
                        suffix: InkWell(
                          onTap: () {
                            model.toggleObscure();
                          },
                          child: Icon(model.obscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                      SizedBox(height: 16),
                      SubmitButton(
                        isLoading: model.isBusy,
                        boldText: true,
                        label: "Login",
                        submit: () {
                          model.login(context);
                        },
                        color: kcPrimaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
