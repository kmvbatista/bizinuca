import 'package:bizinuca/components/PrimaryInput.dart';
import 'package:bizinuca/services/authentication_service.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var nameController = TextEditingController();

  handleSignUp() async {
    var result = await AuthenticationService.signUpWithEmail(
        email: emailController.text, password: passwordController.text);
    if (result) {
      Navigator.popAndPushNamed(context, '/login');
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
              child: Image.asset("images/billiard3.png"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Cadastre-se!",
              style: TextStyle(
                  color: Colors.green,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            PrimaryInput("Digite seu nome Bizinuqueiro(único)",
                TextInputType.text, nameController),
            PrimaryInput("Digite seu email", TextInputType.emailAddress,
                emailController),
            SizedBox(
              height: 20,
            ),
            PrimaryInput(
              "Digite sua Senha",
              TextInputType.text,
              passwordController,
              obscureText: true,
            ),
            SizedBox(
              height: 5,
            ),
            PrimaryInput(
              "Confirme sua Senha",
              TextInputType.text,
              confirmPasswordController,
              obscureText: true,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 40,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF66BB6A),
                      Color(0xFF388E3C),
                      Color(0xFF1B5E20),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Text(
                    "Cadastrar-se",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: handleSignUp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
