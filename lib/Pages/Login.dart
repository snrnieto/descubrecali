import 'package:descubrecaliapp/Pages/Opciones.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:descubrecaliapp/Pages/Principal.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            "assets/login_header.jpg",
            fit: BoxFit.cover,
            height: screenHeight * 0.5,
            width: double.infinity,
          ),
          LoginPrincipal(screenHeight: screenHeight, screenWidth: screenWidth)
        ],
      ),
    );
  }
}

class LoginPrincipal extends StatelessWidget {
  const LoginPrincipal({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: screenHeight * 0.32,
          ),
          Container(
            width: screenWidth,
            height: screenHeight * 0.68,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50),
              ),
            ),
            child: Formulario(),
          )
        ],
      ),
    );
  }
}

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FormField(
            label: "Email",
            hint: "Tu correo electrónico",
            icono: Icons.mail_outline,
            oculto: false,
          ),
          FormField(
            label: "Contaseña",
            hint: "Tu contraseña",
            icono: Icons.lock_outline,
            oculto: true,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Opciones(),
                ),
              );
            },
            child: Text("INGRESAR"),
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: Color(0XFF248f22),
                primary: Colors.white,
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.9,
                  MediaQuery.of(context).size.height * 0.08,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.white,
                height: 2,
                width: MediaQuery.of(context).size.width * 0.15,
              ),
              Text(
                "O continua con",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Container(
                color: Colors.white,
                height: 2,
                width: MediaQuery.of(context).size.width * 0.15,
              ),
            ],
          ),
          SocialIcons(),
          Text(
            "¿Aún no tienes una cuenta? ¡Registrate!",
            // textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
    );
  }
}

class SocialIcons extends StatelessWidget {
  const SocialIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SocialIcon(
          icono: FontAwesomeIcons.facebookF,
        ),
        SocialIcon(
          icono: FontAwesomeIcons.twitter,
        ),
        SocialIcon(
          icono: FontAwesomeIcons.google,
        ),
      ],
    );
  }
}

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    Key? key,
    required this.icono,
  }) : super(key: key);

  final IconData icono;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width * 0.18,
      height: MediaQuery.of(context).size.width * 0.1,
      child: IconButton(
        onPressed: () {},
        icon: Icon(icono),
        color: Theme.of(context).accentColor,
        iconSize: 15,
      ),
    );
  }
}

class FormField extends StatelessWidget {
  const FormField({
    Key? key,
    required this.label,
    required this.hint,
    required this.icono,
    required this.oculto,
  }) : super(key: key);

  final String label;
  final String hint;
  final IconData icono;
  final bool oculto;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.09,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  obscureText: oculto ? true : false,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.08 / 2,
                      top: MediaQuery.of(context).size.height * 0.08 / 2,
                    ),
                  ),
                ),
              ),
              Icon(
                icono,
                size: 15,
                color: Colors.grey[600],
              ),
            ],
          ),
        )
      ],
    );
  }
}
