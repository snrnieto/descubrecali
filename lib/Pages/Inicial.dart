import 'package:descubrecaliapp/Pages/Login.dart';
import 'package:descubrecaliapp/constantes.dart';
import 'package:flutter/material.dart';

class Inicial extends StatelessWidget {
  const Inicial({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kfondoColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Texto(),
              Imagen(),
              Botones(),
            ],
          ),
        ));
  }
}

class Imagen extends StatelessWidget {
  const Imagen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Image(
        image: AssetImage("assets/imagen_inicial.png"),
      ),
    );
  }
}

class Botones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
          child: Text("INICIAR SESIÓN"),
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            primary: Colors.white,
            fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 35),
          ),
        ),
        Container(
          width: double.infinity,
          height: 10,
        ),
        TextButton(
          onPressed: () {},
          child: Text("REGISTRARSE"),
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).accentColor,
            primary: Colors.white,
            fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 35),
          ),
        )
      ],
    );
  }
}

class Texto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "DESCUBRE",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 35,
            letterSpacing: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "CALI",
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 30,
            letterSpacing: 35,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
