import 'package:bizinuca/components/PrimaryInput.dart';
import 'package:bizinuca/components/SecondaryButton.dart';
import 'package:bizinuca/services/FeedBackService.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var nameController = TextEditingController();
  bool isUpdating = false;
  Dio dio = Dio();

  String capitalizeString(String string) =>
      string[0].toUpperCase() + string.substring(1);

  bool isEmailValid() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);
  }

  bool passwordMatches() {
    return passwordController.text == confirmPasswordController.text;
  }

  bool isFormValid() {
    if (!isEmailValid()) {
      FeedBackService.showAlertDialog(
          context, 'Seu email está em um formato incorreto.\nTente novamente!');
      return false;
    }
    if (!passwordMatches()) {
      FeedBackService.showAlertDialog(
          context, 'As senhas não correspondem.\nTente novamente!');
      return false;
    }
    return true;
  }

  handleSignUp() async {
    if (!isFormValid()) return;
    setState(() {
      isUpdating = true;
    });
    try {
      await dio.post(
          'https://us-central1-bizinuca.cloudfunctions.net/createUniqueUser',
          data: {
            "name": capitalizeString(nameController.text.trim()),
            "password": passwordController.text.trim(),
            "email": emailController.text.trim(),
            "points": 1000
          });
      FeedBackService.showCalbackConfimationDialog(
          context,
          "Cadastro efetuado com sucesso. Faça login!",
          () => Navigator.popAndPushNamed(context, '/login'));
    } catch (error) {
      if (error.response.statusCode == 400) {
        FeedBackService.showAlertDialog(
            context, 'Nome de usuário já existente. Tente novamente!');
      } else {
        FeedBackService.showAlertDialog(
            context, 'Houve um erro na sua requisição. Tente novamente!');
      }
      setState(() {
        isUpdating = false;
      });
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
              height: 5,
            ),
            PrimaryInput("Seu nome de Bizinuqueiro (único)", TextInputType.text,
                nameController),
            PrimaryInput(
                "Seu email", TextInputType.emailAddress, emailController),
            SizedBox(
              height: 5,
            ),
            PrimaryInput(
              "Sua Senha",
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
              height: 12,
            ),
            isUpdating
                ? FeedBackService.showSpinner(Colors.green)
                : SecondaryButton("Cadastrar-se", handleSignUp)
          ],
        ),
      ),
    );
  }
}
