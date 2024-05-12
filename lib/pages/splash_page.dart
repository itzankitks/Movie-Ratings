// ignore_for_file: no_leading_underscores_for_local_identifiers, unnecessary_brace_in_string_interps, avoid_print

import "dart:async";
import "dart:convert";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get_it/get_it.dart";
import "package:movie_ratings/services/http_service.dart";
import "package:movie_ratings/services/movie_service.dart";
import "../model/app_config.dart";

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
    });
  }

  @override
  void initState() {
    super.initState();
    statrTimer();
  }

  Future<void> _setup(BuildContext _context) async {
    final getIt = GetIt.instance;

    final configFile = await rootBundle.loadString('assets/config/main.json');
    final configData = jsonDecode(configFile);
    print("-->CD ${configData}");

    getIt.registerSingleton<AppConfig>(
      AppConfig(
        BASE_API_URL: configData['BASE_API_URL'],
        BASE_IMAGE_API_URL: configData['BASE_IMAGE_API_URL'],
        API_KEY: configData['API_KEY'],
      ),
    );

    getIt.registerSingleton<HTTPService>(
      HTTPService(),
    );

    getIt.registerSingleton<MovieService>(
      MovieService(),
    );
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
