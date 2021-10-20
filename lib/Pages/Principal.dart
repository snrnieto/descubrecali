import 'package:descubrecaliapp/Pages/Filtrar.dart';
import 'package:flutter/material.dart';
import 'package:descubrecaliapp/constantes.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Eventos(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: kprimaryColor,
      fixedColor: Colors.white,
      iconSize: 20,
      unselectedFontSize: 12,
      selectedFontSize: 13,
      items: [
        BottomNavigationBarItem(
          label: "Descubre",
          icon: Icon(
            Icons.explore,
          ),
        ),
        BottomNavigationBarItem(
          label: "Mis eventos",
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
    );
  }
}

class Eventos extends StatelessWidget {
  const Eventos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40),
          ),
        ),
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Proximos eventos",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Theme.of(context).accentColor,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: Text("Filtrar"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Filtrar()),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 15,
                  children: List.generate(20, (index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(105, 0, 175, 0.08),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                "https://cdn.colombia.com/images/v2/turismo/sitios-turisticos/cali/ciudad-cali-800.jpg",
                                fit: BoxFit.cover,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Titulo $index',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  'Categoria X',
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 10,
        right: 5,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(
                left: 10,
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "¿Qué te gustaria\ndescubrir hoy?",
                    maxLines: 2,
                    textScaleFactor: 0.8,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      minHeight: 25,
                      maxHeight: 30,
                    ),
                    height: MediaQuery.of(context).size.height * 0.07,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.search,
                          size: 20,
                        ),
                        Expanded(
                          child: SizedBox(
                            child: TextField(
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: "Buscar",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: CircleAvatar(
              child: FlutterLogo(),
              backgroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
