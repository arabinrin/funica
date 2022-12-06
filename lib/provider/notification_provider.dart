import 'package:date_time/date_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:funica/models/notification._model.dart';

class NotificationProvider with ChangeNotifier {
  List<NotificationModel> notifications = <NotificationModel>[];
  List<Date?> dates = [];
  List<List<NotificationModel>> notifsClass = [];

  getDates() {
    for (int i = 0; i < notifs.length; i++) {
      dates.add(notifs[i].time);
    }
  }

  List<NotificationModel> getLIstOfNotifs(Date date) {
    final List<NotificationModel> dateNotif = [];
    for (int i = 0; i < notifications.length; i++) {
      if (notifications[i].time == date) {
        dateNotif.add(notifications[i]);
      }
    }
    notifsClass.add(dateNotif);
    return dateNotif;
  }
}
