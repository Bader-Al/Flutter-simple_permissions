part of simple_permissions;

showPermissionsDeniedDialog(BuildContext context,
    {required DeniedPermissionReason reason, String? featureName}) async {
  switch (reason) {
    // TODO : MERGE THESE TWO CASES
    case DeniedPermissionReason.photos: //? IOS ONLY
      showDialog(
          context: context,
          builder: (context) => PhotosPermissionsAlertDialog(
                featureName: featureName,
              ));
      break;
    case DeniedPermissionReason.storage: //? ANDROID ONLY
      showDialog(
          context: context,
          builder: (context) => PhotosPermissionsAlertDialog(
                featureName: featureName,
              ));
      break;
    case DeniedPermissionReason.locationWhileInUse:
      showDialog(
          context: context,
          builder: (context) => LocationPermissionsAlertDialog(
                featureName: featureName,
              ));
      break;
    case DeniedPermissionReason.pushNotifications:
      showDialog(
          context: context,
          builder: (context) => PushNotificationsPermissionsAlertDialog(
                featureName: featureName,
              ));
      break;
    default:
      break; // hihi
  }
}

class PhotosPermissionsAlertDialog extends StatelessWidget {
  final String? featureName;
  const PhotosPermissionsAlertDialog({
    Key? key,
    this.featureName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PermissionsRequiredAlertDialog(
        title: getPhotosPermissionsTitle(Platform.isAndroid),
        content: kPhotosPermissionsParagraph(featureName: featureName));
  }
}

class LocationPermissionsAlertDialog extends StatelessWidget {
  final String? featureName;
  const LocationPermissionsAlertDialog({this.featureName, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PermissionsRequiredAlertDialog(
        title: kLocationPermissionsTitle,
        content: kLocationPermissionsParagraph(featureName: featureName));
  }
}

class PushNotificationsPermissionsAlertDialog extends StatelessWidget {
  final String? featureName;
  const PushNotificationsPermissionsAlertDialog({this.featureName, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PermissionsRequiredAlertDialog(
        title: kPushNotificationsTitle, content: kPushNotificationsParagraph);
  }
}
