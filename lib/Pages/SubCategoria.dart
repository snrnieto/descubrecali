import 'package:descubrecaliapp/Pages/Salsa.dart';
import 'package:descubrecaliapp/constantes.dart';
import 'package:flutter/material.dart';

class SubCategoria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Eventos y actividades',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Container(
        color: kfondoColor,
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
                child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.85),
              children: [
                ItemGrid(
                  titulo: "Festivales y ferias",
                  imagen: "assets/festival_salsa.jpeg",
                  clickable: false,
                ),
                ItemGrid(
                  titulo: "Conciertos",
                  imagen: "assets/concierto.jpg",
                  clickable: false,
                ),
                ItemGrid(
                  titulo: "Culturales",
                  imagen: "assets/petronio.jpg",
                  clickable: false,
                ),
                ItemGrid(
                  titulo: "Salsa",
                  imagen: "assets/bailando_salsa.png",
                  clickable: true,
                ),
                ItemGrid(
                  titulo: "Deportivos",
                  imagen: "assets/estadio.jpeg",
                  clickable: false,
                ),
                ItemGrid(
                  titulo: "Cali nocturna",
                  imagen: "assets/cali_noche.png",
                  clickable: false,
                ),
                ItemGrid(
                  titulo: "Talleres y conferencias",
                  imagen: "assets/festival_salsa.jpeg",
                  clickable: false,
                ),
                ItemGrid(
                  titulo: "Mascotas",
                  imagen: "assets/festival_salsa.jpeg",
                  clickable: false,
                ),
                ItemGrid(
                  titulo: "Voluntariado",
                  imagen: "assets/festival_salsa.jpeg",
                  clickable: false,
                ),
                ItemGrid(
                  titulo: "Bienestar",
                  imagen: "assets/festival_salsa.jpeg",
                  clickable: false,
                ),
                ItemGrid(
                  titulo: "Cali de compras",
                  imagen: "assets/festival_salsa.jpeg",
                  clickable: false,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class ItemGrid extends StatelessWidget {
  const ItemGrid({
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
            MaterialPageRoute(builder: (context) => Salsa()),
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
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                imagen,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ),
            Expanded(
              child: Text(
                titulo,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
