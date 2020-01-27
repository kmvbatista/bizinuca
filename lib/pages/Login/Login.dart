import 'package:bizinuca/components/PrimaryInput.dart';
import 'package:bizinuca/components/SecondaryButton.dart';
import 'package:bizinuca/services/FeedBackService.dart';
import 'package:bizinuca/services/authentication_service.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isLoading = false;

  deactivateLoader() => setState(() {
        isLoading = false;
      });

  activateLoader() => setState(() {
        isLoading = true;
      });

  bool isEmailValid() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
  }

  handleLogin() async {
    try {
      activateLoader();
      if (isEmailValid()) {
        var response = await AuthenticationService.loginWithEmail(
            email: emailController.text, password: passwordController.text);
        if (response is String) {
          deactivateLoader();
          FeedBackService.showAlertDialog(context, "Senha ou email inválidos!");
        } else {
          Navigator.popAndPushNamed(context, '/');
        }
      } else {
        FeedBackService.showAlertDialog(context, 'Email em formato incorreto');
        deactivateLoader();
      }
    } catch (e) {
      deactivateLoader();
      FeedBackService.showAlertDialog(
          context, "Houve um erro ao tentar logar.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 128,
              width: 128,
              child: Image.asset("images/tacos2.png"),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Bem vindo ao Bizinuca!",
                style: Theme.of(context).textTheme.headline),
            SizedBox(
              height: 10,
            ),
            PrimaryInput("Email", TextInputType.emailAddress, emailController),
            SizedBox(
              height: 20,
            ),
            PrimaryInput(
              "Senha",
              TextInputType.text,
              passwordController,
              obscureText: true,
            ),
            SizedBox(
              height: 30,
            ),
            isLoading
                ? FeedBackService.showSpinner(Theme.of(context).primaryColor)
                : SecondaryButton("Fazer Login", handleLogin),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 40,
              child: FlatButton(
                child: Text(
                  "Cadastre-se",
                  textAlign: TextAlign.center,
                ),
                textColor: Theme.of(context).primaryColor,
                onPressed: () => Navigator.pushNamed(context, '/signup'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
