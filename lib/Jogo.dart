import 'package:flutter/material.dart';
import 'dart:math';


class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("imagens/padrao.png");

  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada (String escolhaUsuario) {
    var opcoes = ["zard", "blast", "bulba"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do Usuário: " + escolhaUsuario);

    switch (escolhaApp) {
      case "zard" :
        setState(() {
          this._imagemApp = AssetImage("imagens/zard.png");
        });
        break;

      case "blast" :
        setState(() {
          this._imagemApp = AssetImage("imagens/blast.png");
        });
        break;

      case "bulba" :
        setState(() {
          this._imagemApp = AssetImage("imagens/bulba.png");
        });
        break;
    }

    //Validação ganhador

    if (
      (escolhaUsuario == "zard" && escolhaApp == "bulba") ||
      (escolhaUsuario == "bulba" && escolhaApp == "blast") ||
      (escolhaUsuario == "blast" && escolhaApp == "zard")
    ) {
      //App Ganhador
      setState(() {
        this._mensagem = "Parabéns!!! Você GANHOU :)";
      });
    } else if (
      (escolhaApp == "zard" && escolhaUsuario == "bulba") ||
      (escolhaApp == "bulba" && escolhaUsuario == "blast") ||
      (escolhaApp == "blast" && escolhaUsuario == "zard")
    ) {
      setState(() {
        this._mensagem = "Que pena! Você PERDEU :(";
      });
    } else {
      setState(() {
        this._mensagem = "Pouts, deu EMPATE :|";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo kemon"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //1) text
          //2) imagem
          //3) text resultado
          //4) Linha 3 imagens
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 20),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image(image: this._imagemApp, height: 200,),
          Padding(
            padding: EdgeInsets.only(top: 32 , bottom: 40),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("zard"),
                child: Image.asset("imagens/zard.png", height: 100,) ,
              ),
              GestureDetector(
                  onTap: () => _opcaoSelecionada("blast"),
                  child: Image.asset("imagens/blast.png", height: 100,)),
              GestureDetector(
                  onTap: () => _opcaoSelecionada("bulba"),
                  child: Image.asset("imagens/bulba.png", height: 100,),

              ),
            ]
          ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 50 , bottom: 40),
                      child: Image.asset("imagens/logic.png", height: 200,)
                  ),
                ],
             ),
        ],
      ),
    );
  }
}
