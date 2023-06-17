// import 'package:clima/get_weather.dart';
// import 'package:flutter/material.dart';
// import 'package:clima/get_location.dart';
// import 'constants.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'screen2.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Clima App',
//       // debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: const ColorScheme.dark(),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//   @override
//   void initState() async {
//     super.initState();
//     GetLocationData location = GetLocationData();
//     GetWeatherData weatherData = GetWeatherData(url: 'https://api.openweathermap.org/data/2.5/weather?lat=${location.getLat()}&lon=${location.getLong()}&appid=$kApiKey');
//     weatherData.getWeatherData();
//     Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen2()));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: SafeArea(
//           child: Container(
//             color: Colors.black12,
//             child: const Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 SpinKitPouringHourGlassRefined(
//                   color: Colors.white,
//                   size: 50.0,
//                 )
//               ],
//             )
//           ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const LoadingScreen(),
    );
  }
}

