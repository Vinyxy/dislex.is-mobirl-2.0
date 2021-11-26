import 'package:dislexiamobile/model/userModel.dart';
import 'package:dislexiamobile/telas/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  UserModel user = UserModel();

  _registrationSuccess() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginPage()),
    );
  }

  _registrationError() {
    // ignore: deprecated_member_use
    _scaffoldkey.currentState!.showSnackBar(
      SnackBar(
        content: Text('registration error'),
        backgroundColor: Color.fromRGBO(124, 0, 0, 1),
      ),
    );
  }

  // ignore: unused_field
  late AnimationController _controller;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromRGBO(29, 133, 140, 1)),
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
                child: Container(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nome',
                        ),
                        onSaved: (value) => user.nome = value!,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo não pode ser vasio';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.015),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                        ),
                        onSaved: (value) => user.email = value!,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo não pode ser vasio';
                          } else if (!value.contains('@')) {
                            return 'Email não e valido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.015),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Telefone',
                        ),
                        onSaved: (value) => user.telefone = value!,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo não pode ser vasio';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.015),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Senha',
                        ),
                        onSaved: (value) => user.senha = value!,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo não pode ser vasio';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.07),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        child: Container(
                          width: size.width * 1,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color.fromRGBO(20, 146, 208, 1),
                                Color.fromRGBO(10, 84, 167, 1),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.circular(size.width * 0.02),
                          ),
                          padding: EdgeInsets.all(size.height * 0.012),
                          child: Center(
                            child: Text(
                              'Registar',
                              style: TextStyle(fontSize: size.height * 0.025),
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.02),
                        ),
                        padding: const EdgeInsets.all(0.0),
                        textColor: Colors.white,
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          _formKey.currentState!.save();

                          if (await user.doRegister(user)) {
                            _registrationSuccess();
                          } else {
                            _registrationError();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
