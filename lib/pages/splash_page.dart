import "dart:async";
import "dart:convert";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get_it/get_it.dart";
import "../model/app_config.dart";

// class SplashPage extends StatefulWidget {
//   // final VoidCallback onInitializationComplete;

//   const SplashPage({super.key}); //, required this.onInitializationComplete});

//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   statrTimer() {
//     Timer(const Duration(seconds: 2), () async {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const HomePage(),
//         ),
//       );
//     });
//   }

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashPage({required Key key, required this.onInitializationComplete})
      : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  statrTimer() {
    Timer(const Duration(seconds: 1), () async {
      _setup(context).then((_) => widget.onInitializationComplete());
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const HomePage(),
      //   ),
      // );
    });
  }

  @override
  void initState() {
    super.initState();
    statrTimer();
  }

  Future<void> _setup(BuildContext _context) async {
    final getit = GetIt.instance;

    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);

    getit.registerSingleton<AppConfig>(AppConfig(
        BASE_API_URL: configData['BASE_API_URL'],
        BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL'],
        API_KEY: configData['API_KEY']));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Image.asset(
          "assets/images/MR.jpg",
        ),
      ),
    );
  }
}
