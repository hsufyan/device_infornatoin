import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  var deviceInfo;
  Information({super.key, required this.deviceInfo});
 
  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
   final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo? androidDeviceInfo;
  Future<AndroidDeviceInfo> getAndroidInfo()async{
  return await deviceInfoPlugin.androidInfo;
}
var data;
@override
  void initState() {
    data = getAndroidInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AndroidDeviceInfo>(
      future: getAndroidInfo(),
      builder: (context,snapshot) {
        final data = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Device Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          body: Column(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(data!.device),
                    Text(data.model),
                  ],),
                   Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(data.serialNumber),
                    Text(data.systemFeatures[0]),
                  ],),
                ],
              ),
            )
          ],),
        );
      }
    );
  }
}
