import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  Profil({Key? key, this.animationController}) : super(key: key);
  final AnimationController? animationController;

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  late String _pwd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(padding: EdgeInsets.all(10), children: [
      SizedBox(
        height: 50,
      ),
      Material(
        color: Colors.black,
        elevation: 8,
        shape: CircleBorder(),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          splashColor: Colors.black26,
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Color.fromARGB(0, 0, 0, 0), width: 2),
              shape: BoxShape.circle,
            ),
            child: Ink.image(
              image: AssetImage("assets/hamdi.jpg"),
              height: 120,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 15,
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Full name :",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF17262A),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "azerty",
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Email :",
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF17262A),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "azerty@azerty",
          style: TextStyle(fontSize: 15, color: Colors.black),
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: ElevatedButton.icon(
              onPressed: () {
                _showDialog(context);
              },
              icon: Text(
                "Change Password",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              label: Icon(Icons.settings)),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton.icon(
              onPressed: () {},
              icon: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              label: Icon(Icons.logout_outlined)),
        ),
      ]),
    ])));
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: Text(
              'Password',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF17262A),
              ),
            ),
            content: TextField(
              onChanged: (text) {
                _pwd = text;
              },
              decoration: InputDecoration(
                hintText: "Enter new password",
                /*label: Text('Reunion Name')*/
                hintStyle: TextStyle(fontSize: 20),
                border: InputBorder.none,
                icon: Icon(Icons.format_color_text),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _SetPassword(context);
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: Color(0xFF17262A),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _SetPassword(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: Text(
              'New Password',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFF17262A),
              ),
            ),
            content: TextField(
              onChanged: (text) {
                _pwd = text;
              },
              decoration: InputDecoration(
                hintText: "Enter new password",
                /*label: Text('Reunion Name')*/
                hintStyle: TextStyle(fontSize: 20),
                border: InputBorder.none,
                icon: Icon(Icons.format_color_text),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Color(0xFF17262A),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
