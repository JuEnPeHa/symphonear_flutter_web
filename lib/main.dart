import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:symphonear_flutter_web/pages/onboarding_page.dart';
import 'package:symphonear_flutter_web/widgets/responsive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  //print(postIdAndIncrement);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Symphonear';
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        //primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: title),
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
    return const Responsive(
      mobile: OnboardingPage(),
    );
  }
}
