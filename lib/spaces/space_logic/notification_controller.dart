import 'package:http/http.dart' as http;
import 'package:lander/shared/shared_functions/shared_data.dart';
import 'dart:convert';
import 'package:lander/spaces/space_logic/notification_model.dart';


class NotiController {

  List<NotiModel> _notifications = [];
  List<NotiModel> get allNotifications => _notifications;


  void getNotifications() async {
    http.Response res = await http.get(Uri.parse('$url/notifications.json'));
    Map data = json.decode(res.body);
    data.forEach((key, value) {
      _notifications.add(NotiModel.fromMap(value, key));
    });
  }


  void markAsRead(NotiModel noti) {
    noti.isRead = true;
    for (int i = 0; i < _notifications.length; i++) {
      if (_notifications[i].id == noti.id) {
        _notifications.removeAt(i);
        break;
      }
    }
  }
}