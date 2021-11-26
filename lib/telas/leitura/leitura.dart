import 'package:dislexiamobile/telas/home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeituraPage extends StatefulWidget {
  const LeituraPage({Key? key}) : super(key: key);

  @override
  _LeituraPageState createState() => _LeituraPageState();
}

class _LeituraPageState extends State<LeituraPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        backgroundColor: Colors.white,
        shadowColor: Colors.blue[300],
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.dehaze_rounded),
          color: Color.fromRGBO(29, 133, 140, 1),
          onPressed: () {},
        ),
        title: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              child: Image.asset('assets/images/DislexIA.png'),
            ),
          ],
        ),
      ),
      body: Container(
        height: size.height * 1,
        margin: EdgeInsetsDirectional.fromSTEB(
          MediaQuery.of(context).size.width * 0,
          MediaQuery.of(context).size.height * 0,
          MediaQuery.of(context).size.width * 0,
          MediaQuery.of(context).size.height * 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsetsDirectional.fromSTEB(
                MediaQuery.of(context).size.width * 0,
                MediaQuery.of(context).size.height * 0,
                MediaQuery.of(context).size.width * 0,
                MediaQuery.of(context).size.height * 0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Container(
                        padding: EdgeInsetsDirectional.fromSTEB(
                          MediaQuery.of(context).size.width * 0,
                          MediaQuery.of(context).size.height * 0.02,
                          MediaQuery.of(context).size.width * 0,
                          MediaQuery.of(context).size.height * 0,
                        ),
                        width: size.width * 0.6,
                        child: Image.asset('assets/images/livro.png'),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.shade100,
                          offset: Offset(0, 3),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    height: size.height * 0.37,
                  ),
                  Container(
                    height: size.height * 0.33,
                    margin: EdgeInsetsDirectional.fromSTEB(
                      MediaQuery.of(context).size.width * 0.04,
                      MediaQuery.of(context).size.height * 0.02,
                      MediaQuery.of(context).size.width * 0.04,
                      MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              'Abúlssola de ouro',
                              style: TextStyle(
                                fontFamily: 'tserrat',
                                fontSize: size.height * 0.025,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Aultor: phillip pullmam',
                              style: TextStyle(
                                fontFamily: 'tserrat',
                                fontSize: size.height * 0.025,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'data de indicação 01/04/2021',
                              style: TextStyle(
                                fontFamily: 'tserrat',
                                fontSize: size.height * 0.025,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'data de finalização: lendo',
                              style: TextStyle(
                                fontFamily: 'tserrat',
                                fontSize: size.height * 0.025,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Link pra compra do livro',
                                  style: TextStyle(
                                    fontFamily: 'tserrat',
                                    fontSize: size.height * 0.025,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'https://www.amazon.com.br/b%C3%BAssola-ouro-Philip-Pullman/dp/8556510426',
                              style: TextStyle(
                                fontFamily: 'tserrat',
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size.height * 0.05),
                  bottomRight: Radius.circular(size.height * 0.05),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.shade100,
                    offset: Offset(0, 3),
                    blurRadius: 3,
                  ),
                ],
              ),
              height: size.height * 0.75,
            ),
            Container(
              margin: EdgeInsetsDirectional.fromSTEB(
                MediaQuery.of(context).size.width * 0.12,
                MediaQuery.of(context).size.height * 0.027,
                MediaQuery.of(context).size.width * 0.12,
                MediaQuery.of(context).size.height * 0,
              ),
              // ignore: deprecated_member_use
              child: RaisedButton(
                child: Container(
                  width: size.width * 1,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color.fromRGBO(20, 146, 208, 1),
                        Color.fromRGBO(10, 84, 167, 1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(size.width * 0.02),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      'Leitura finalizada',
                      style: TextStyle(fontSize: size.height * 0.025),
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.02),
                ),
                padding: const EdgeInsets.all(0.0),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
