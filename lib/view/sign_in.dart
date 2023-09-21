import 'package:device_info_plus/device_info_plus.dart';
import 'package:device_information/view/api/api_service.dart';
import 'package:device_information/view/save_information.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  // Get the device information plugin.
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo? androidDeviceInfo;
  bool obsCureIcon = false;
  TextEditingController userNameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool isLoading = false;
  final snackBar = SnackBar(
    content: const Text('Invalid Credentials'),
    action: SnackBarAction(
      label: 'Error',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  Future<AndroidDeviceInfo> getAndroidInfo() async {
    return await deviceInfoPlugin.androidInfo;
  }

  @override
  void dispose() {
   
   setState(() {
     isLoading = false;
   });
   userNameC.dispose();
   passwordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AndroidDeviceInfo>(
        future: getAndroidInfo(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          return Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.13,
                    ),
                    const Text(
                      'Logo',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              offset: Offset(0,
                                  0), // Adjust the shadow's position for a 3D effect
                              // Adjust the blur radius for a softer or stronger shadow
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Logo',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Welcome back,',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              'login to your account',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.deepPurple)),
                              child: TextField(
                                controller: userNameC,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(5),
                                  labelText: "User Name",
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.deepPurple)),
                              child: TextField(
                                controller: passwordC,
                                obscureText: obsCureIcon,
                                decoration:   InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(5),
                                  labelText: "Password",
                                  
                                  suffixIcon: IconButton(onPressed: (){
                                    setState(() {
                                      obsCureIcon = !obsCureIcon;
                                    });
                                  }, icon:obsCureIcon? Icon( Icons.visibility_off): Icon(Icons.visibility))
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            isLoading
                                ? Center(
                                  child:   CircularProgressIndicator(
                                      strokeWidth: 1,
                                    ),
                                )
                                : GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      // ******// android device information
                                      print(data!.board);
                                      print(data.bootloader);
                                      print(data.brand);
                                      print(data.device);
                                      print(data.display);
                                      print(data.displayMetrics);
                                      print(data.fingerprint);
                                      print(data.hardware);
                                      print(data.host);
                                      print(data.id);
                                      print(data.manufacturer);
                                      print(data.model);
                                      print(data.product);
                                      print(data.serialNumber);
                                      print(data.supported32BitAbis);
                                      print(data.systemFeatures);
                                      print(data.tags);
                                      print(data.type);
                                      print(data.version);
                                      print(data.data);

                                      ApiService()
                                          .login(userNameC.text, passwordC.text)
                                          .then((value) {
                                        var status = value['login'];
                                        if (status == 1) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Information(
                                                deviceInfo: data,
                                              ),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          setState(() {
                                            isLoading = false;
                                          });
                                        }
                                        setState(() {
                                            isLoading = false;
                                          });
                                        ;
                                      });
                                    },
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Sign in',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        Icon(
                                          Icons.login_rounded,
                                        )
                                      ],
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ),
                    // const Spacer(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
