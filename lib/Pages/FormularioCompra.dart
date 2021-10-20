import 'package:descubrecaliapp/Pages/Confirmacion.dart';
import 'package:descubrecaliapp/constantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormularioCompra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kfondoColor,
        appBar: AppBar(
          title: Text('Reserva'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  Column(
                    children: [
                      Field(
                        texto: "Nombre Completo",
                      ),
                      Field(
                        texto: "Correo electrónico",
                      ),
                      FieldTarjeta(),
                      Field(
                        texto: "Dirección",
                      ),
                      Field(
                        texto: "Celular",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Confirmacion(),
                        ),
                      );
                    },
                    child: Text(
                      "Pagar",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      primary: Colors.white,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width,
                        50,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class FieldTarjeta extends StatelessWidget {
  const FieldTarjeta({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            style: TextStyle(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintText: "Número de tarjeta",
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 1,
          child: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            style: TextStyle(
              fontSize: 14,
            ),
            decoration: InputDecoration(
              hintText: "CCV",
              fillColor: Colors.white,
              filled: true,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

class Field extends StatelessWidget {
  const Field({
    Key? key,
    required this.texto,
  }) : super(key: key);

  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        style: TextStyle(
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintText: texto,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
