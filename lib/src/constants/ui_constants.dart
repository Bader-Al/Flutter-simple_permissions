part of simple_permissions;

//? IOS: PHOTOS | ANDROID: STORAGE/MEDIA
String getPhotosPermissionsTitle(
  bool isAndroid,
) =>
    'Please enable ${isAndroid ? 'storage/media' : 'photos'} permissions.';
String kPhotosPermissionsParagraph({String? featureName}) =>
    "It seems that you have previously denied us access to your photos. Without it, ${featureName ?? 'this feature'} is unavailable.";

//? location (for scout)
const String kLocationPermissionsTitle =
    "Please enable location permissions while app in use.";
String kLocationPermissionsParagraph({String? featureName}) =>
    "It seems that you have previously denied us access to your location service. Without it, ${featureName ?? 'this feature'} is unavailable.\n\nPlease note that you may choose to disable scout within the app by clicking the 'disable' button.";

//? push notifications (for scout)
const String kPushNotificationsTitle =
    "Please enable push notifications permissions.";
String kPushNotificationsParagraph =
    "It seems that you have previously denied us the permission to notify you on important updates. Please, grant us the ability to keep you in touch.";
