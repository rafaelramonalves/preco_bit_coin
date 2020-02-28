import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String resultadoPreco="0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset("imagem/bitcoin.png"),
              Divider(
                color: Colors.white,
              ),
              Text("R\$ $resultadoPreco",style: TextStyle(
                fontSize: 50
              ),),
              Divider(
                color: Colors.white,
              ),
              RaisedButton(
                child: Text("Atualizar"),
                color: Colors.amber,
                onPressed: requestApi,
              )
            ],
          ),
        ),
    );
  }
  requestApi() async{
    http.Response response;
    response = await http.get("https://blockchain.info/ticker");
    Map<String,dynamic> resultado;
    resultado = json.decode(response.body);
    setState(() {
       resultadoPreco = resultado["BRL"]["sell"].toString();
    });
  }
}
