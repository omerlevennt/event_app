class Event {
  String? eventName;
  String? local;
  String? data;
  String? hour;
  String? imagePath;

  Event({this.eventName, this.local, this.data, this.hour, this.imagePath});

  Event.fromJson(Map<String, dynamic> json) {
    eventName = json['eventName'];
    local = json['local'];
    data = json['data'];
    hour = json['hour'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['eventName'] = this.eventName;
    data['local'] = this.local;
    data['data'] = this.data;
    data['hour'] = this.hour;
    data['imagePath'] = this.imagePath;
    return data;
  }

  static List<Event> eventsList = [
    Event(
        eventName: "Birthday event",
        local: "Brooklyn, NY",
        data: "24 July, 2021",
        hour: "8:00 PM",
        imagePath: "asset/png/ic_party.png"),
    Event(
        eventName: "Carnival event",
        local: "Brooklyn, NY",
        data: "24 July, 2021",
        hour: "9:00 PM",
        imagePath: "asset/png/ic_party.png"),
    Event(
        eventName: "Football Game",
        local: "Brooklyn, NY",
        data: "24 July, 2021",
        hour: "9:30 PM",
        imagePath: "asset/png/ic_party.png"),
    Event(
        eventName: "Weekend party",
        local: "Brooklyn, NY",
        data: "24 July, 2021",
        hour: "10:00 PM",
        imagePath: "asset/png/ic_party.png")
  ];
}
