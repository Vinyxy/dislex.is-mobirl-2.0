import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrigamiPage extends StatefulWidget {
  const OrigamiPage({Key? key}) : super(key: key);

  @override
  _OrigamiPageState createState() => _OrigamiPageState();
}

class _OrigamiPageState extends State<OrigamiPage> {
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  height: size.height * 1,
                  margin: EdgeInsetsDirectional.fromSTEB(
                    MediaQuery.of(context).size.width * 0.085,
                    MediaQuery.of(context).size.height * 0.03,
                    MediaQuery.of(context).size.width * 0.085,
                    MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // ignore: deprecated_member_use
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // ignore: deprecated_member_use
                          Container(
                            child: Image.asset(
                              'assets/images/origami1.png',
                            ),
                            width: size.width * 0.83,
                            height: size.height,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
