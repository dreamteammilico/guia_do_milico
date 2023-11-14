enum AppPermission { location, camera, storage }

class PermissionStatusCheck {
  final AppPermission permission;
  final bool isGranted;

  PermissionStatusCheck(this.permission, this.isGranted);
}
