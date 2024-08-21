import 'package:permission_handler/permission_handler.dart';

class PermissionHelper{
  static PermissionHelper permissionHelper=PermissionHelper._();
  PermissionHelper._();
  bool cP=false,lP=false,sP=false,aP=false;

  Future<void> checkP()
  async {
    var camera=await Permission.camera.status;
    cP=camera.isGranted;
    var loc =await Permission.location.status;
    lP=loc.isGranted;
    var storage =await Permission.storage.status;
    sP=storage.isGranted;
    var audio =await Permission.audio.status;
    aP=audio.isGranted;
  }
  Future<String> cR()
  async {
    if(await Permission.camera.request().isGranted)
      {
        var camera=await Permission.camera.status;
        cP=camera.isGranted;
        return "Granted";
      }
    else{
      var camera=await Permission.camera.status;
      cP=camera.isGranted;
      return "Denied";
    }
  }
  Future<String> lR()
  async {
    if(await Permission.location.request().isGranted)
    {
      var camera=await Permission.location.status;
      lP=camera.isGranted;
      return "Granted";
    }
    else{
      var camera=await Permission.location.status;
      lP=camera.isGranted;
      return "Denied";
    }
  }
  Future<String> sR()
  async {
    if(await Permission.storage.request().isGranted)
    {
      var camera=await Permission.storage.status;
      sP=camera.isGranted;
      return "Granted";
    }
    else{
      var camera=await Permission.storage.status;
      sP=camera.isGranted;
      return "Denied";
    }
  }
  Future<String> aR()
  async {
    if(await Permission.audio.request().isGranted)
    {
      var camera=await Permission.audio.status;
      aP=camera.isGranted;
      return "Granted";
    }
    else{
      var camera=await Permission.audio.status;
      aP=camera.isGranted;
      return "Denied";
    }
  }
}