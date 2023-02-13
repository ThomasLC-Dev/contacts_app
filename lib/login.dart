import 'package:contacts_app/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>{
  String _number = "";
  String _errorMessage = "";

  _login(BuildContext context){
    if(_number.length == 10){
      _saveNumber();
      _navigateToHomePage(context);
    }
    else{
      setState(() {
        _errorMessage = "Numéro trop court !";
      });
    }
  }

  _navigateToHomePage(context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
  }

  _numberChanged(value){
    setState(() {
      _number = value;
    });
  }

  Future<bool> _saveNumber() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('number', _number);
  }

  Future<String> _getNumber() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('number') ?? "";
  }

  _checkNumberAlreadyStore(context) async{
    if(await _getNumber() != ""){
      _navigateToHomePage(context);
    }
  }

  @override
  Widget build(BuildContext context) {

    _checkNumberAlreadyStore(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Connexion",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35.0),
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text("Numéro de téléphone")),
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                        onChanged: _numberChanged,
                      ),
                      if (_errorMessage != "") Text(_errorMessage)
                    ]),
                  ),
                  Container(
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal:70, vertical: 70),
                    child: ElevatedButton(
                      onPressed: () => _login(context),
                      child: const Text(
                        "Se connecter",
                        style: TextStyle(
                          fontSize: 18
                        ),
                      )
                    ),
                  )
                ],
              ),
        ),
    );
  }
}