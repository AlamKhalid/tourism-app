import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourism_app/misc/colors.dart';
import 'package:tourism_app/pages/navpages/main_page.dart';
import 'package:tourism_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:tourism_app/screens/login_success/login_success_screen.dart';
import 'package:tourism_app/services/userService.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../complete_profile/complete_profile_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../sign_up/sign_up_screen.dart';
import '../sign_in_screen.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  bool loggingIn = false;
  String? email;
  String? password;
  String? conform_password;
  bool remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: 20),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(15)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value!;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ForgotPasswordScreen()))
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(height: 30),
          DefaultButton(
            text: loggingIn ? "Logging In..." : "Login",
            press: () async {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  loggingIn = true;
                });
                var response = await login(email, password);
                setState(() {
                  loggingIn = false;
                });
                if (response == "success") {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('email', 'useremail@gmail.com');
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => LoginSuccessScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email already taken')));
                }
              }
            },
          ),
          SizedBox(height: 10),
          DefaultButton(
              text: "Continue as Guest",
              color: AppColors.textColor4,
              press: () {
                SpinKitRotatingCircle(
                  color: Colors.white,
                  size: 50.0,
                );
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MainPage()));
              }),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 6) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 6) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: '  Password ',
        hintText: "Enter your Password",
        suffixIcon: Icon(Icons.lock),
        contentPadding: const EdgeInsets.only(left: 30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0.0,
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        email = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(height: 0),
        labelText: '  Email ',
        hintText: "Enter your Name",
        suffixIcon: Icon(Icons.email),
        contentPadding: const EdgeInsets.only(left: 30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0.0,
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
        ),
      ),
    );
  }
}
