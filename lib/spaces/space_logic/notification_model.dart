
class NotiModel {

  final String id;
  final String notiDate;
  final String notiDesc;
  final String notiName;
  bool isRead;

  NotiModel(this.id, this.notiDate, this.notiDesc, this.notiName, this.isRead);

  factory NotiModel.fromMap(Map<String, dynamic> data, String id) {
    return NotiModel(
      id,
      data['notiDate'],
      data['notiDescription'],
      data['notiName'],
      false
    );
  }
}