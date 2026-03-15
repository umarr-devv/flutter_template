import 'package:app/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future hideSplash() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  void initState() {
    super.initState();
    hideSplash();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [HomeAppBar()]);
  }
}
