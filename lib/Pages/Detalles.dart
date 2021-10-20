import 'package:descubrecaliapp/Pages/FormularioCompra.dart';
import 'package:descubrecaliapp/constantes.dart';
import 'package:flutter/material.dart';

class Detalles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kfondoColor,
      appBar: AppBar(
        title: Text('Delirio'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: screenHeight * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/delirio.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Image.asset(
                    //   "assets/delirio.png",
                    //   fit: BoxFit.contain,
                    //   height: screenHeight * 0.3,
                    // ),
                    Descripcion(),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormularioCompra(),
                  ),
                );
              },
              child: Text("Reservar"),
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                backgroundColor: Colors.red,
                primary: Colors.white,
                fixedSize: Size(
                  screenWidth,
                  screenHeight * 0.1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Descripcion extends StatelessWidget {
  const Descripcion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      color: kfondoColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Delirio",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Delirio Salsa + Circo + Orquesta \n\nShow de Salsa en Cali Delirio, para Colombia y para el mundo, fundamenta su producción en la cultura popular caleña para el disfrute de todos. En estos años ha presentado, con su ecuación exitosa de Baile, Circo, Orquesta y Público. \n\nDirección: Eventos Valle del Pacífico, Cra. 26 # 12 - 328 Centro de, Cali, Valle del Cauca\n\nHorario: \nSábado 13:00 a 20:00\nDomingo 13:00 a 20:00",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
