import 'package:permission_handler/permission_handler.dart';

class GetPermissions {
  Future<bool> getPermissions() async {
    bool allowed = false;
    PermissionStatus status = await Permission.storage.status;
    if (status.isDenied || status.isRestricted) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        Permission.photos,
      ].request();
      status = await Permission.storage.status;
    }

    if(status.isPermanentlyDenied) allowed = false;
    if(status.isGranted || status.isLimited) allowed = true;

    return allowed;
  }
}
