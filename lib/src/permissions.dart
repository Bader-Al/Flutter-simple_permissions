part of simple_permissions;

// TODO : pass feature names instead of hardcoded strings
class SimplePermissions {
  static Future<bool> pushNotificationsPermissionWasGranted() =>
      Permission.notification.status.isGranted;
  static Future<bool> pushNotificationsPermissionIsGranted(
      BuildContext context) async {
    final PermissionStatus status = await Permission.notification.request();
    if (!status.isGranted) {
      showPermissionsDeniedDialog(
        context,
        reason: DeniedPermissionReason.pushNotifications,
      );
    }
    return status.isGranted;
  }

  static Future<bool> locationPermissionWasGranted() =>
      Permission.locationWhenInUse.status.isGranted;
  static Future<bool> galleryPermissionIsGranted(BuildContext context) async {
    PermissionStatus status = Platform.isIOS
        ? await Permission.photos.status
        : await Permission.storage.status;
    // print('was $status');
    if (status.isGranted) {
      return true;
    } else {
      final PermissionStatus regrantRequest = Platform.isIOS
          ? await Permission.photos.request()
          : await Permission.storage.request();
      // print('is $status');
      if (!regrantRequest.isGranted) {
        showPermissionsDeniedDialog(context,
            reason: Platform.isAndroid
                ? DeniedPermissionReason.storage
                : DeniedPermissionReason.photos,
            featureName: 'glance');
      }
      return regrantRequest.isGranted;
    }
  }

  static Future<bool> locationPermissionIsGranted(BuildContext context,
      {bool showName = true}) async {
    PermissionStatus status = await Permission.locationWhenInUse.status;
    // print('was $status');
    if (status.isGranted) {
      return true;
    } else {
      final PermissionStatus regrantRequest =
          await Permission.locationWhenInUse.request();
      // print('is $status');
      if (!regrantRequest.isGranted) {
        showPermissionsDeniedDialog(context,
            reason: DeniedPermissionReason.locationWhileInUse,
            featureName:
                showName ? 'scout' : null); //! temp to dev checkins quick
      }
      return regrantRequest.isGranted;
    }
  }
}
