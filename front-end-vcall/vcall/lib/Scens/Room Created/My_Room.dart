import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:vcall/Models/Category_Model.dart';
import 'package:vcall/Models/Room.dart';

class My_Room extends StatefulWidget {
  My_Room({Key? key, this.animationController, this.my_id}) : super(key: key);

  final AnimationController? animationController;
  final String? my_id;

  @override
  State<My_Room> createState() => My_RoomState();
}

class My_RoomState extends State<My_Room> {
  List<Room> my_room = <Room>[
    Room("Batiment", "Hamdi", "senior", "20:40", "06/5/2022"),
    Room("Electronique", "Mohamed Rayen", "beginner", "9:30", "26/5/2022"),
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget Card_Room(Room r) {
    return Slidable(
        endActionPane: ActionPane(
          motion: DrawerMotion(),
          //dismissible: DismissiblePane(onDismissed: () {}),
          children: [
            SlidableAction(
              onPressed: (context) {
                /*ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Update'),
                        ),
                      );*/
              },
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.play_arrow,
              label: 'Start',
            ),
            SlidableAction(
              onPressed: (context) {
                /*ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Update'),
                        ),
                      );*/
              },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              icon: Icons.build,
              label: 'Update',
            ),
            SlidableAction(
              onPressed: (context) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${r.name} Deleted'),
                  ),
                );
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          padding: EdgeInsets.only(
            left: 10.0,
            // top: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Color(0xFFFFFFFF),
          ),
          child: InkWell(
            onTap: () {
              setState(() {});
            },
            child: Column(children: [
              Row(
                children: [
                  Text("Name : ",
                      style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).scale(14),
                        color: Color.fromARGB(255, 149, 190, 255),
                      )),
                  Text(r.name.toString(),
                      style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).scale(14),
                      )),
                ],
              ),
              Row(
                children: [
                  Text("Category : ",
                      style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).scale(14),
                        color: Color.fromARGB(255, 149, 190, 255),
                      )),
                  Text(r.categoty.toString(),
                      style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).scale(14),
                      )),
                ],
              ),
              Row(
                children: [
                  Text("Date & Time: ",
                      style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).scale(14),
                        color: Color.fromARGB(255, 149, 190, 255),
                      )),
                  Text(r.date.toString(),
                      style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).scale(14),
                      )),
                  Text(r.time.toString(),
                      style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).scale(14),
                      )),
                ],
              ),
            ]),
          ),
        )
        /*Card(
          child: Center(
        child: ListTile(
          title: Text(r.name.toString()),
          subtitle: Text(
            r.categoty.toString(),
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ),
      )),*/
        );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        ListView.builder(
          itemCount: my_room.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 16),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Card_Room(my_room[index]),
                SizedBox(
                  height: 10,
                )
              ],
            );
          },
        ),
      ]),
    );
  }
}
