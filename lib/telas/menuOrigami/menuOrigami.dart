import 'package:dislexiamobile/telas/origami/origami.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuOrigamiPage extends StatefulWidget {
  const MenuOrigamiPage({Key? key}) : super(key: key);

  @override
  _MenuOrigamiPageState createState() => _MenuOrigamiPageState();
}

class _MenuOrigamiPageState extends State<MenuOrigamiPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: size.height * 0.1,
        backgroundColor: Colors.white,
        shadowColor: Colors.blue[300],
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
            Container(child: Image.asset('assets/images/DislexIA.png')),
          ],
        ),
      ),
      body: Container(
        height: size.height * 1,
        margin: EdgeInsetsDirectional.fromSTEB(
          MediaQuery.of(context).size.width * 0.1,
          MediaQuery.of(context).size.height * 0.05,
          MediaQuery.of(context).size.width * 0.1,
          MediaQuery.of(context).size.height * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // ignore: deprecated_member_use
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // ignore: deprecated_member_use
                RaisedButton(
                  child: Container(
                    height: size.height * 0.17,
                    width: size.width * 0.35,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color.fromRGBO(36, 199, 177, 1),
                          Color.fromRGBO(1, 84, 163, 1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(size.width * 0.02),
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Image.asset(
                      'assets/images/Borboleta.png',
                      height: size.height * 0.1,
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
                      MaterialPageRoute(builder: (_) => OrigamiPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
