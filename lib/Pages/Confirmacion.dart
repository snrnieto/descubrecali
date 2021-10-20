import 'package:descubrecaliapp/Pages/Categorias.dart';
import 'package:descubrecaliapp/constantes.dart';
import 'package:flutter/material.dart';

class Confirmacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kfondoColor,
      body: Center(
        child: Container(
          color: kfondoColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '¡Muchas gracias por tu compra!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Te enviaremos tus boletas a tu correo electrónico",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Categorias(),
                    ),
                  );
                },
                child: Text("Continuar"),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  primary: Colors.white,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width * 0.6,
                    30,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
