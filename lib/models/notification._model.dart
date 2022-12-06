import 'package:date_time/date_time.dart';

class NotificationModel {
  final Date? time;
  final String? title;
  final String? descr;
  final String? type;

  NotificationModel(
      {required this.time,
      required this.title,
      required this.descr,
      required this.type});
}

List<NotificationModel> notifs = [
  NotificationModel(
    time: DateTime(2022, 1, 8).date,
    title: '30% Special Dsicount',
    descr: 'Special promotion only valid today',
    type: 'offer',
  ),
  NotificationModel(
    time: DateTime(2022, 3, 4).date,
    title: '30% Special Dsicount',
    descr: 'Special promotion only valid today',
    type: 'offer',
  ),
  NotificationModel(
    time: DateTime(2022, 3, 6).date,
    title: '30% Special Dsicount',
    descr: 'Special promotion only valid today',
    type: 'offer',
  ),
  NotificationModel(
    time: DateTime(2022, 3, 6).date,
    title: '30% Special Dsicount',
    descr: 'Special promotion only valid today',
    type: 'offer',
  ),
  NotificationModel(
    time: DateTime(2022, 6, 12).date,
    title: '30% Special Dsicount',
    descr: 'Special promotion only valid today',
    type: 'offer',
  ),
  NotificationModel(
    time: DateTime(2022, 6, 12).date,
    title: '30% Special Dsicount',
    descr: 'Special promotion only valid today',
    type: 'offer',
  ),
];
