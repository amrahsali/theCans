import 'package:flutter/material.dart';

enum AppUiModes { dark, light }


ValueNotifier<bool> userLoggedIn = ValueNotifier(false);
ValueNotifier<bool> isFirstLaunch = ValueNotifier(true);
ValueNotifier<AppUiModes> uiMode = ValueNotifier(AppUiModes.light);
// ValueNotifier<List<AppNotification>> notifications = ValueNotifier([]);
