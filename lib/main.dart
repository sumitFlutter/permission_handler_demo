import 'package:flutter/material.dart';
import 'package:permission/utils/helper/permission_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PermissionHelper.permissionHelper.checkP();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Permission Handler Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              PermissionHelper.permissionHelper.cP
                  ? const Text("Camera")
                  : ElevatedButton.icon(
                      onPressed: () async {
                        String s1 =
                            await PermissionHelper.permissionHelper.cR();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(s1),duration: const Duration(seconds: 1),));
                        setState(() {});
                      },
                      icon: const Icon(Icons.add_a_photo),
                      label: const Text("Camera"),
                    ),
              const SizedBox(
                height: 12,
              ),
              PermissionHelper.permissionHelper.lP
                  ? const Text("Location")
                  : ElevatedButton.icon(
                      onPressed: () async {
                        String s1 =
                            await PermissionHelper.permissionHelper.lR();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(s1),duration: const Duration(seconds: 1)));
                        setState(() {});
                      },
                      icon: const Icon(Icons.location_on),
                      label: const Text("Location"),
                    ),
              const SizedBox(
                height: 12,
              ),
              PermissionHelper.permissionHelper.sP
                  ? const Text("Storage")
                  : ElevatedButton.icon(
                      onPressed: () async {
                        String s1 =
                            await PermissionHelper.permissionHelper.sR();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(s1),duration: const Duration(seconds: 1)));
                        setState(() {});
                      },
                      icon: const Icon(Icons.storage),
                      label: const Text("Storage"),
                    ),
              const SizedBox(
                height: 12,
              ),
              PermissionHelper.permissionHelper.aP
                  ? const Text("Record Audio")
                  : ElevatedButton.icon(
                      onPressed: () async {
                        String s1 =
                            await PermissionHelper.permissionHelper.aR();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(s1),duration: const Duration(seconds: 1)));

                        setState(() {});
                      },
                      icon: const Icon(Icons.mic_rounded),
                      label: const Text("Record Audio"),
                    ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
