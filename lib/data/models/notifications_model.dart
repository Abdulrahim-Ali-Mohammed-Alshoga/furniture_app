class NotificationsModel {
  String? _image;
  String? _title;
  String? _time;

  // Constructor
  NotificationsModel({
    String? image,
    String? title,
    String? time,
  }) {
    _image = image;
    _title = title;
    _time = time;
  }

  // Factory Constructor: Convert from Map
  factory NotificationsModel.fromMap(Map<String, dynamic> map) {
    return NotificationsModel(
      image: map['image'] ,
      title: map['name'] ,
      time: map['time'] ,
    );
  }

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'image': _image,
      'name': _title,
      'time': _time,
    };
  }

  // Getters
  String? get image => _image;
  String? get title => _title;
  String? get time => _time;


}
