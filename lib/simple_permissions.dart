library simple_permissions;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
part 'src/dialoges.dart';
part 'src/constants/ui_constants.dart';
part 'src/constants/styles.dart';
part 'src/core/actions.dart';
part 'src/core/alert.dart';
part 'src/permissions.dart';

enum DeniedPermissionReason {
  photos, // IOS
  storage, // Android
  pushNotifications,
  locationWhileInUse,
}
