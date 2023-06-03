class Room {
  String? created_by;
  String? categoty;
  String? name;
  String? date;
  String? time;

  Room(String cat, String by, String name, String time, String date)
      : this.categoty = cat,
        this.created_by = by,
        this.name = name,
        this.time = time,
        this.date = date;
}
