import 'dart:ui';
import 'package:dislexiamobile/telas/home/home.dart';
import 'package:dislexiamobile/model/userModel.dart';
import 'package:dislexiamobile/telas/register/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  UserModel user = UserModel();

  _loginSuccess() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  _loginError() {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        content: Text('login error'),
        backgroundColor: Color.fromRGBO(124, 0, 0, 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      /*AppBar*/
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: size.height * 0.1,
        backgroundColor: Colors.white,
        shadowColor: Colors.blue[300],
        title: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(child: Image.asset('assets/images/DislexIA.png')),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.85,
                padding: EdgeInsetsDirectional.fromSTEB(
                  MediaQuery.of(context).size.width * 0.1,
                  MediaQuery.of(context).size.height * 0.05,
                  MediaQuery.of(context).size.width * 0.1,
                  MediaQuery.of(context).size.height * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /*Textfield login*/
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'login',
                      ),
                      onSaved: (value) => user.email = value!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'campo não pode ser vasio';
                        } else if (!value.contains('@')) {
                          return 'Email não e valido';
                        }
                        return null;
                      },
                    ),

                    /*Textfield senha*/
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Senha',
                      ),
                      onSaved: (value) => user.senha = value!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'campo não pode ser vasio';
                        }
                        return null;
                      },
                    ),

                    /*Button login*/
                    // ignore: deprecated_member_use
                    RaisedButton(
                      child: Container(
                        width: size.width * 1,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color.fromRGBO(20, 146, 208, 1),
                              Color.fromRGBO(10, 84, 167, 1),
                            ],
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text('Logar',
                              style: TextStyle(fontSize: size.height * 0.025)),
                        ),
                      ),
                      padding: const EdgeInsets.all(0.0),
                      textColor: Colors.white,
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        _formKey.currentState!.save();
                        if (await user.doLogin(user)) {
                          _loginSuccess();
                        } else {
                          _loginError();
                        }
                      },
                    ),

                    /*Button Registrar*/
                    // ignore: deprecated_member_use
                    RaisedButton(
                      child: Container(
                        width: size.width * 1,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color.fromRGBO(36, 199, 177, 1),
                              Color.fromRGBO(0, 171, 148, 1),
                            ],
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            'Registrar',
                            style: TextStyle(
                              fontSize: size.height * 0.025,
                            ),
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.width * 0.02),
                      ),
                      padding: const EdgeInsets.all(0.0),
                      textColor: Colors.white,
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => RegisterPage()),
                        );
                      },
                    ),

                    /*logar com*/
                    Text(
                      'logar com',
                      style: TextStyle(
                        fontFamily: 'tserrat',
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),

                    /*Apple*/
                    Container(
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          width: size.width * 1,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/icon/Apple.png',
                                width: size.height * 0.02,
                              ),
                              SizedBox(width: size.width * 0.02),
                              Center(
                                child: Text(
                                  'Faça login com Apple',
                                  style:
                                      TextStyle(fontSize: size.height * 0.025),
                                ),
                              ),
                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.02),
                          side: BorderSide(
                              color: Colors.black, width: size.width * 0.005),
                        ),
                        padding: const EdgeInsets.all(0.0),
                        textColor: Colors.black,
                        onPressed: () {},
                      ),
                    ),

                    /*Google*/
                    Container(
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          width: size.width * 1,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(width: size.width * 0.02),
                              Center(
                                child: Text(
                                  'Faça login com Google',
                                  style: TextStyle(
                                    fontSize: size.height * 0.025,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            size.width * 0.02,
                          ),
                          side: BorderSide(
                            color: Colors.black,
                            width: size.width * 0.005,
                          ),
                        ),
                        padding: const EdgeInsets.all(0.0),
                        textColor: Colors.black,
                        onPressed: () {},
                      ),
                    ),

                    /*Facebook*/
                    Container(
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          width: size.width * 1,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // Image.asset(
                              //   'assets/icon/Apple.png',
                              //   width: size.height * 0.02,
                              // ),
                              SizedBox(width: size.width * 0.02),
                              Center(
                                child: Text(
                                  'Faça login com Facebook',
                                  style:
                                      TextStyle(fontSize: size.height * 0.025),
                                ),
                              ),
                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.02),
                          side: BorderSide(
                              color: Colors.black, width: size.width * 0.005),
                        ),
                        padding: const EdgeInsets.all(0.0),
                        textColor: Colors.black,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
