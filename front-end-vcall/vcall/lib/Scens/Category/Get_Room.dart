import 'package:flutter/material.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:vcall/Models/Category_Model.dart';
import 'package:vcall/Models/Room.dart';

class Get_Rooms extends StatefulWidget {
  Get_Rooms({Key? key, this.animationController, this.category})
      : super(key: key);

  final AnimationController? animationController;
  final Category? category;

  @override
  State<Get_Rooms> createState() => Get_RoomsState();
}

class Get_RoomsState extends State<Get_Rooms> {
  List<Room> rooms = [
    Room("Macanique", "Mohamed Rayen", "beginner", "9:30", "26/5/2022"),
    Room("Coding", "Hamdi", "senior", "20:40", "06/5/2022"),
    Room("Coding", "Mohamed Rayen", "beginner", "9:30", "26/5/2022"),
    Room("Macanique", "Hamdi", "senior", "20:40", "06/5/2022"),
    Room("Batiment", "Mohamed Rayen", "beginner", "9:30", "26/5/2022"),
    Room("Batiment", "Hamdi", "senior", "20:40", "06/5/2022"),
    Room("Electronique", "Mohamed Rayen", "beginner", "9:30", "26/5/2022"),
    Room("Agriculture", "Hamdi", "senior", "20:40", "06/5/2022"),
  ];

  List<Room> room_filtered = <Room>[];

  void filter_rooms(String categ) {
    for (var i in rooms) {
      if (i.categoty.toString() == categ) {
        room_filtered.add(i);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    filter_rooms(widget.category!.cathegory.toString());
  }

  Widget Card_Room(Room r) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      padding: EdgeInsets.only(
        left: 10.0,
        top: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Color(0xff132137),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.65),
            spreadRadius: 8,
            blurRadius: 8,
          ),
        ],
      ),
      child: InkWell(
          onTap: () {
            setState(() {});
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage(widget.category!.path_iamge.toString()),
                maxRadius: 25,
                minRadius: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text("Name : ",
                          style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).scale(13),
                            color: Color.fromARGB(255, 149, 190, 255),
                          )),
                      Text(r.name.toString(),
                          style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).scale(13),
                            color: Color(0xFFFFFFFF),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Created By : ",
                          style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).scale(13),
                            color: Color.fromARGB(255, 149, 190, 255),
                          )),
                      Text(r.created_by.toString(),
                          style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).scale(13),
                            color: Color(0xFFFFFFFF),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Date : ",
                          style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).scale(13),
                            color: Color.fromARGB(255, 149, 190, 255),
                          )),
                      Text(r.date.toString(),
                          style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).scale(13),
                            color: Color(0xFFFFFFFF),
                          )),
                      Text(" At ",
                          style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).scale(13),
                            color: Color.fromARGB(255, 149, 190, 255),
                          )),
                      Text(r.time.toString(),
                          style: TextStyle(
                            fontSize: ResponsiveFlutter.of(context).scale(13),
                            color: Color(0xFFFFFFFF),
                          )),
                    ],
                  ),
                ],
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        ListView.builder(
          itemCount: room_filtered.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 16),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card_Room(room_filtered[index]),
                SizedBox(
                  height: 50,
                )
              ],
            );
          },
        ),
      ]),
    );
  }
}
