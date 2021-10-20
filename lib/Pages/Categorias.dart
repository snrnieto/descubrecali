import 'package:descubrecaliapp/Pages/SubCategoria.dart';
import 'package:descubrecaliapp/constantes.dart';
import 'package:flutter/material.dart';

class Categorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kprimaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              child: Text(
                "CATEGORIAS",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
            ),
            ListaCategorias(),
          ],
        ),
      ),
    );
  }
}

class ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        // color:Colors.white,
        color: kfondoColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      margin: EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              children: [
                ItemCategoria(
                  titulo: "Eventos y actividades",
                  clickable: true,
                  imagen: "assets/parejas_bailando.png",
                ),
                ItemCategoria(
                  titulo: "Lugares turisticos",
                  clickable: false,
                  imagen: "assets/gato_tejada.jpg",
                ),
                ItemCategoria(
                  titulo: "Gastronomía",
                  clickable: false,
                  imagen: "assets/chontaduro.jpg",
                ),
                ItemCategoria(
                  titulo: "Alojamiento",
                  clickable: false,
                  imagen: "assets/intercontinental.jpeg",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCategoria extends StatelessWidget {
  const ItemCategoria({
    Key? key,
    required this.titulo,
    required this.clickable,
    required this.imagen,
  }) : super(key: key);

  final String titulo;
  final bool clickable;
  final String imagen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (clickable) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubCategoria(),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  imagen,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      titulo,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
