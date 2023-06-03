import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Update_Room extends StatefulWidget {
  Update_Room({Key? key}) : super(key: key);

  @override
  State<Update_Room> createState() => _Update_RoomState();
}

class _Update_RoomState extends State<Update_Room>
    with TickerProviderStateMixin {
  String meeting_name = "";
  List<String> emails = [];
  String category_hold = "category";
  String dropdownvalue = 'general';
  late DateTime _mydatetime;
  String day = DateFormat('dd-MM-yyyy').format(DateTime.now());
  TimeOfDay time = TimeOfDay.now();
  late String code = "Xa9bt";

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..forward();

  late final Animation<Offset> _name_animation = Tween<Offset>(
    begin: const Offset(10, 0.0),
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Interval(
      0.0,
      1.0,
      curve: Curves.fastOutSlowIn,
    ),
  ));

  late final Animation<Offset> _date_animation = Tween<Offset>(
    begin: const Offset(10, 0.0),
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Interval(
      0.2,
      1.0,
      curve: Curves.fastOutSlowIn,
    ),
  ));

  late final Animation<Offset> _time_animation = Tween<Offset>(
    begin: const Offset(10, 0.0),
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Interval(
      0.4,
      1.0,
      curve: Curves.fastOutSlowIn,
    ),
  ));

  late final Animation<Offset> _category_animation = Tween<Offset>(
    begin: const Offset(10, 0.0),
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Interval(
      0.6,
      1.0,
      curve: Curves.fastOutSlowIn,
    ),
  ));

  late final Animation<Offset> _gests_animation = Tween<Offset>(
    begin: const Offset(10, 0.0),
    end: const Offset(0.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Interval(
      0.8,
      1.0,
      curve: Curves.fastOutSlowIn,
    ),
  ));

  late final Animation<double> _button_animation = CurvedAnimation(
    parent: _controller,
    curve: Interval(
      0.0,
      1.0,
      curve: Curves.fastOutSlowIn,
    ),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void return_to_home() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Update Room"),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 50,
              width: 200,
            ),
            SlideTransition(
              position: _name_animation,
              child: Text(
                "Meeting's Name",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF132137),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SlideTransition(
              position: _name_animation,
              child: Container(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: MediaQuery.of(context).padding.bottom + 16,
                ),
                height: 58,
                width: 50 +
                    MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width * 0.25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: TextField(
                  onChanged: (text) {
                    meeting_name = text;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter the Meeting's name please",
                    /*label: Text('Reunion Name')*/
                    hintStyle: TextStyle(fontSize: 20),
                    border: InputBorder.none,
                    icon: Icon(Icons.format_color_text),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SlideTransition(
              position: _date_animation,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Meeting's Date ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF132137),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.event),
                      color: Color(0xFF132137),
                      onPressed: () async {
                        _mydatetime = (await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2022),
                          lastDate: DateTime(2050),
                        ))!;
                        setState(() {
                          //time= _mydatetime.toString() ;
                          day = DateFormat('dd-MM-yyyy').format(_mydatetime);
                        });
                      },
                    ),
                    Text(day),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            SlideTransition(
              position: _time_animation,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Meeting's Time",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF132137),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.access_time),
                      color: Color(0xFF132137),
                      onPressed: () async {
                        TimeOfDay? newtime = await showTimePicker(
                          context: context,
                          initialTime: time,
                        );
                        setState(() {
                          time = time;
                        });
                      },
                    ),
                    Text('${time.hour} : ${time.minute}'),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            SlideTransition(
              position: _category_animation,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Category :",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF132137),
                      ),
                    ),
                    DropdownButton<String>(
                      value: dropdownvalue,
                      icon: Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: TextStyle(color: Color(0xFF132137), fontSize: 25),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                          category_hold = newValue;
                        });
                      },
                      items: <String>[
                        'general',
                        'mecanics ',
                        'electricity',
                        'industry',
                        'education'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ]),
            ),
            SizedBox(
              height: 30,
            ),
            SlideTransition(
              position: _gests_animation,
              child: Text(
                'Guests',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF132137),
                ),
              ),
            ),
            SlideTransition(
                position: _gests_animation,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: MediaQuery.of(context).padding.bottom + 16,
                  ),
                  height: 58,
                  width: 50 +
                      MediaQuery.of(context).size.width -
                      (MediaQuery.of(context).size.width * 0.25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: TextFormField(
                    onChanged: (text) {
                      emails = text.split(" ");
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter the Emails of the guests please',
                      /*label: Text('Guests')*/
                      hintStyle: TextStyle(fontSize: 20),
                      border: InputBorder.none,
                      icon: Icon(Icons.account_circle_rounded),
                    ),
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            ScaleTransition(
              scale: _button_animation,
              child: Container(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: MediaQuery.of(context).padding.bottom + 16,
                ),
                height: 58,
                width: 50 +
                    MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width * 0.8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38.0),
                  color: Color(0xFF132137),
                ),
                child: InkWell(
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Center(
                          child: Row(children: [
                            const Text("Room Updated"),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.add_task,
                              color: Colors.green,
                            )
                          ]),
                        ),
                        content: Text(code),
                        actions: <Widget>[
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                return_to_home();
                              },
                              child: Center(
                                child: const Text('OK'),
                              )),
                        ],
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Update',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(Icons.create, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ]),
        ));
  }
}
