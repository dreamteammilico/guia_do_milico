import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get_storage/get_storage.dart';
import '../models/permission.dart';

class PermissionController extends GetxController {
  late Rx<PermissionStatusCheck> locationPermission;
  late Rx<PermissionStatusCheck> cameraPermission;
  late Rx<PermissionStatusCheck> storagePermission;
  final storage = GetStorage();

  @override
  void onInit() {
    locationPermission = Rx<PermissionStatusCheck>(PermissionStatusCheck(AppPermission.location, false));
    cameraPermission = Rx<PermissionStatusCheck>(PermissionStatusCheck(AppPermission.camera, false));
    storagePermission = Rx<PermissionStatusCheck>(PermissionStatusCheck(AppPermission.storage, false));

    locationPermission.value = PermissionStatusCheck(AppPermission.location, storage.read('locationPermission') ?? false);
    cameraPermission.value = PermissionStatusCheck(AppPermission.camera, storage.read('cameraPermission') ?? false);
    storagePermission.value == PermissionStatusCheck(AppPermission.storage, storage.read('storagePermission') ?? false);

    super.onInit();
  }

  Future<void> requestLocationPermission() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      var result = await Permission.location.request();
      locationPermission.value = PermissionStatusCheck(AppPermission.location, result.isGranted);
      storage.write('locationPermission', result.isGranted);
    }
  }

  Future<void> requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      var result = await Permission.camera.request();
      cameraPermission.value = PermissionStatusCheck(AppPermission.camera, result.isGranted);
      storage.write('cameraPermission', result.isGranted);
    }
  }

  Future<void> requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      var result = await Permission.storage.request();
      storagePermission.value = PermissionStatusCheck(AppPermission.storage, result.isGranted);
      storage.write('storagePermission', result.isGranted);
    }
  }
}
