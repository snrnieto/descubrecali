import 'package:descubrecaliapp/constantes.dart';
import 'package:flutter/material.dart';

class Filtrar extends StatefulWidget {
  @override
  _FiltrarState createState() => _FiltrarState();
}

class _FiltrarState extends State<Filtrar> {
  double rating = 10000;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Filtros'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.cancel,
            size: 25,
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.only(
                right: 20,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Borrar filtros",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  Text(
                    "Ordenar por",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      roundedButton("Precio", true),
                      roundedButton("Distancia", false),
                      roundedButton("Estrellas", false),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListaDesplegable(),
                  Text("Costo"),
                  Slider(
                    value: rating,
                    onChanged: (newRating) {
                      setState(() {
                        rating = newRating;
                        print(rating);
                      });
                    },
                    min: 1,
                    max: 1000000,
                    label: 'Hola',
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              fixedSize: Size(screenWidth, screenHeight * 0.08),
              backgroundColor: kaccentColor,
              primary: Colors.white,
            ),
            onPressed: () {},
            child: Text(
              "Filtrar",
            ),
          )
        ],
      ),
    );
  }

  Widget roundedButton(String texto, bool isActive) {
    return TextButton(
      onPressed: () {},
      child: Text(
        texto,
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        elevation: 0.5,
        primary: isActive ? kaccentColor : Colors.grey,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: isActive ? kaccentColor : Colors.grey,
          ),
        ),
      ),
    );
  }
}

class ListaDesplegable extends StatefulWidget {
  @override
  _ListaDesplegableState createState() => _ListaDesplegableState();
}

class _ListaDesplegableState extends State<ListaDesplegable> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          expanded = !expanded;
        });
      },
      children: [
        panelDesplegable(expanded),
        panelDesplegable(expanded),
      ],
    );
  }

  ExpansionPanel panelDesplegable(bool expanded) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text('Categorias'),
        );
      },
      body: Column(
        children: [
          ListTile(
            title: Text('Turismo'),
            trailing: Checkbox(
              value: false,
              onChanged: (c) {},
            ),
          ),
          ListTile(
            title: Text('Deporte'),
            trailing: Checkbox(
              value: true,
              onChanged: (c) {},
            ),
          ),
          ListTile(
            title: Text('Gastronomia'),
            trailing: Checkbox(
              value: true,
              onChanged: (c) {},
            ),
          ),
          ListTile(
            title: Text('Arte y cultura'),
            trailing: Checkbox(
              value: false,
              onChanged: (c) {},
            ),
          ),
          ListTile(
            title: Text('Mascotas'),
            trailing: Checkbox(
              value: true,
              onChanged: (c) {},
            ),
          ),
        ],
      ),
      isExpanded: expanded,
    );
  }
}
