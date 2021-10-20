import 'package:descubrecaliapp/Pages/Shows.dart';
import 'package:descubrecaliapp/constantes.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Salsa extends StatefulWidget {
  @override
  _SalsaState createState() => _SalsaState();
}

class _SalsaState extends State<Salsa> {
  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'qxFFM1QZKBw', // id youtube video
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salsa'),
      ),
      body: Center(
        child: Container(
          color: kfondoColor,
          child: Column(
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.blueAccent,
              ),
              Expanded(
                  child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 30,
                ),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.85),
                  children: [
                    ItemGrid(
                      titulo: "Clases de salsa",
                      imagen: "assets/clases_salsa.png",
                      clickable: false,
                    ),
                    ItemGrid(
                      titulo: "Shows",
                      imagen: "assets/show_salsa.png",
                      clickable: true,
                    ),
                    ItemGrid(
                      titulo: "Música en vivo",
                      imagen: "assets/festival_salsa.jpeg",
                      clickable: false,
                    ),
                    ItemGrid(
                      titulo: "Rumba caleña",
                      imagen: "assets/rumba_caleña.jpg",
                      clickable: false,
                    ),
                  ],
                ),
              )),
            ],
          ),
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
            MaterialPageRoute(builder: (context) => Shows()),
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
            ),
          ],
        ),
      ),
    );
  }
}
