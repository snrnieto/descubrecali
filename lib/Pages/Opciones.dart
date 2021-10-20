import 'package:descubrecaliapp/Pages/Calendario.dart';
import 'package:descubrecaliapp/Pages/Categorias.dart';
import 'package:descubrecaliapp/Pages/Perfil.dart';
import 'package:descubrecaliapp/constantes.dart';
import 'package:flutter/material.dart';

class Opciones extends StatefulWidget {
  @override
  _OpcionesState createState() => _OpcionesState();
}

class _OpcionesState extends State<Opciones> {
  int _paginaActual = 0;

  List<Widget> _paginas = [
    Categorias(),
    Calendario(),
    Perfil(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: _paginas[_paginaActual],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (opcion) {
            setState(() {
              _paginaActual = opcion;
            });
          },
          currentIndex: _paginaActual,
          backgroundColor: kprimaryColor,
          fixedColor: Colors.white,
          iconSize: 20,
          unselectedFontSize: 12,
          selectedFontSize: 13,
          unselectedItemColor: Colors.white38,
          items: [
            BottomNavigationBarItem(
              label: "Categorias",
              icon: Icon(
                Icons.explore,
              ),
            ),
            BottomNavigationBarItem(
              label: "Mi calendario",
              icon: Icon(
                Icons.calendar_today,
              ),
            ),
            BottomNavigationBarItem(
              label: "Perfil",
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
