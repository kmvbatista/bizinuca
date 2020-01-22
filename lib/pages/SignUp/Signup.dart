import 'package:bizinuca/components/PrimaryInput.dart';
import 'package:bizinuca/components/SecondaryButton.dart';
import 'package:bizinuca/models/User.dart';
import 'package:bizinuca/services/FeedBackService.dart';
import 'package:bizinuca/services/authentication_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
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

  handleSignUp() async {
    setState(() {
      isUpdating = true;
    });
    try {
      await dio.post(
          'https://us-central1-bizinuca.cloudfunctions.net/createUniqueUser',
          data: {
            "name": nameController.text,
            "password": passwordController.text,
            "email": emailController.text,
            "points": 1000
          });
      FeedBackService.showAlertDialog(
          context, "Cadastro efetuado com sucesso. Faça login!");
      Navigator.popAndPushNamed(context, '/login');
    } catch (e) {
      FeedBackService.showAlertDialog(
          context, 'Houve um erro na sua requisição');
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
