// ignore_for_file: file_names

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonUtils {
  static double adaptHeight(double height) {
    return height.h;
  }

  /* static TUIOfflinePushInfo convertTUIOfflinePushInfo(
      OfflinePushInfo offlinePush) {
    TUIOfflinePushInfo tuiOfflinePushInfo = TUIOfflinePushInfo();
    tuiOfflinePushInfo.title = offlinePush.title;
    tuiOfflinePushInfo.desc = offlinePush.desc;
    tuiOfflinePushInfo.ignoreIOSBadge = offlinePush.ignoreIOSBadge;
    tuiOfflinePushInfo.iOSSound = offlinePush.iOSSound;
    tuiOfflinePushInfo.androidSound = offlinePush.androidSound;
    tuiOfflinePushInfo.androidOPPOChannelID = offlinePush.androidOPPOChannelID;
    return tuiOfflinePushInfo;
  } */

  static double adaptWidth(double width) {
    return width.h;
  }

  static double adaptFontSize(double fontSize) {
    return fontSize.sp;
  }
}
