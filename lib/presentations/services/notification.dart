import 'package:date_time/date_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funica/models/notification._model.dart';
import 'package:funica/provider/notification_provider.dart';
import 'package:funica/utils/text_resourses/app_textstyle.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class NoficationPage extends StatelessWidget {
  const NoficationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final ThemeData color = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: color.focusColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_back_ios),
                      SizedBox(
                        width: 20.w,
                      ),
                    ],
                  ),
                  const Icon(Icons.more_rounded),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              ChangeNotifierProvider(
                create: (BuildContext context) =>
                    NotificationProvider()..getDates(),
                child: Consumer<NotificationProvider>(
                  builder: (
                    BuildContext context,
                    NotificationProvider special,
                    Widget? child,
                  ) {
                    final List<Date?> dates = special.dates.reversed.toList();
                    return special.dates.isEmpty
                        ? const CircularProgressIndicator()
                        : SizedBox(
                            height: height * .7,
                            width: width,
                            child: ListView.builder(
                                itemCount: notifs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  print(dates[index]);
                                  return Column(
                                    children: [
                                      Text(
                                        timeago
                                            .format(dates[index]!.asDateTime),
                                        style: bodySmallText(context).copyWith(
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Consumer<NotificationProvider>(builder: (
                                        BuildContext context,
                                        NotificationProvider notifs,
                                        Widget? child,
                                      ) {
                                        List<NotificationModel> notes = notifs
                                            .getLIstOfNotifs(dates[index]!);
                                        print(notes[0].descr);

                                        ;
                                        return special.dates.isEmpty
                                            ? const CircularProgressIndicator()
                                            : Container(
                                                height: 100.h,
                                                width: width,
                                                decoration: BoxDecoration(
                                                  color: color.backgroundColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    20.r,
                                                  ),
                                                ),
                                                child: Container(
                                                  height: 100.h,
                                                  width: width,
                                                  child: ListView.builder(
                                                    itemCount: notes.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      return Text(
                                                          notes[index].descr!);
                                                    },
                                                  ),
                                                ),
                                              );
                                      }),
                                    ],
                                  );
                                }),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
