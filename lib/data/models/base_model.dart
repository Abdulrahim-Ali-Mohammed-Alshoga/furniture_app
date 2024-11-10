class BaseModel {
  final String? id; // معرف النشاط أو الخدمة
  final String name; // اسم النشاط أو الخدمة

  BaseModel({
    this.id,
    String? name,
  }) : name = name ?? ''; // تعيين قيمة افتراضية

  factory BaseModel.fromMap(Map<String, dynamic> json) {
    return BaseModel(
      id: json["value"],
      name: json["text"],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BaseModel &&
          runtimeType == other.runtimeType &&

          id == other.id &&

          name == other.name); // استخدم id للمقارنة

  @override
  int get hashCode => id.hashCode; // استخدم id كـ hashCode
}

List<BaseModel> maintenanceCycleUnitList = [
  BaseModel(id: '1', name: 'Year'),
  BaseModel(id: '2', name: 'Quarterly'),
  BaseModel(id: '3', name: 'Month'),
  BaseModel(id: '4', name: 'Week'),
];
List<BaseModel> typeItemList = [
  BaseModel(id: '1', name: 'Purchased'),
  BaseModel(id: '2', name: 'Manufactured'),
  BaseModel(id: '3', name: 'Cost'),
  BaseModel(id: '4', name: 'Service'),
];
List<BaseModel> statusList = [
  BaseModel(id: '1', name: 'Active'),
  BaseModel(id: '2', name: 'UnActive'),
];

String? findNameActivityById({
  required List<BaseModel> activities,
  required String id,
}) {
  try {
    BaseModel activity = activities.firstWhere(
      (activity) => activity.id == id,
    );

    return activity.name; // إرجاع الاسم
  } catch (e) {
    return null; // إرجاع null إذا لم يتم العثور على النشاط
  }
}

BaseModel? findActivityById({
  required List<BaseModel> activities,
  required String id,
}) {
  String normalizeName(String name) {
    return name.replaceAll('~', '-'); // استبدال ~ بـ -
  }

  try {
    print('Searching for: $id');
    print(
        'Available activities: ${activities.map((activity) => activity.id).toList()}');

    BaseModel activity =
        activities.firstWhere((activity) => activity.id == normalizeName(id));

    return activity; // إرجاع المعرف
  } catch (e) {
    // print('Activity not found: $e');
    return null; // إرجاع null إذا لم يتم العثور على النشاط
  }
}

BaseModel? findActivityByName({
  required List<BaseModel> activities,
  required String name,
}) {
  String normalizeName(String name) {
    return name.replaceAll('~', '-'); // استبدال ~ بـ -
  }

  try {
    print('Searching for: $name');
    print(
        'Available activities: ${activities.map((activity) => activity.name).toList()}');

    BaseModel activity = activities
        .firstWhere((activity) => activity.name == normalizeName(name));

    return activity; // إرجاع المعرف
  } catch (e) {
    // print('Activity not found: $e');
    return null; // إرجاع null إذا لم يتم العثور على النشاط
  }
}
