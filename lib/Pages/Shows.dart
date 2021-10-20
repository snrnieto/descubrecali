import 'package:descubrecaliapp/Pages/Detalles.dart';
import 'package:descubrecaliapp/constantes.dart';
import 'package:flutter/material.dart';

class Shows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Shows'),
        ),
        body: Container(
          color: kfondoColor,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ListITem(
                      titulo: "Delirio",
                      imagen: "assets/delirio.png",
                      clickable: true,
                    ),
                    ListITem(
                      titulo: "Ensálsate",
                      imagen: "assets/ensalsate.jpg",
                      clickable: false,
                    ),
                    // ListITem(
                    //   titulo: "Mulato",
                    //   imagen: "assets/intercontinental.jpeg",
                    //   clickable: false,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class ListITem extends StatelessWidget {
  const ListITem({
    Key? key,
    required this.titulo,
    required this.imagen,
    required this.clickable,
  }) : super(key: key);

  final String titulo;
  final String imagen;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (clickable) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Detalles(),
            ),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: MediaQuery.of(context).size.height * 0.2,
        child: Row(
          children: [
            Image.asset(
              imagen,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              titulo,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
