import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thriftedbookstore/common/tabs.dart';
import 'package:thriftedbookstore/constants/constants.dart';
import 'package:thriftedbookstore/features/seller/screens/seller_screen.dart';
import 'package:thriftedbookstore/features/auth/screens/auth_screen_01.dart';
import 'package:thriftedbookstore/features/auth/services/user_services/auth_user_services.dart';
import 'package:thriftedbookstore/provider/user_provider.dart';
import 'package:thriftedbookstore/router.dart';

// /// TEST -01
// void main(List<String> args) {
//   runApp(MultiProvider(
//     providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
//     builder: (context, child) =>  MyApp(),
//   ));
// }

// class MyApp extends StatefulWidget {
//   final _messangerKey = GlobalKey<ScaffoldMessengerState>();
//   MyApp({super.key});

//   @override
//   State<MyApp> createState() {
//     return _MyAppState();
//   }
// }

// class _MyAppState extends State<MyApp> {
//   final kColorScheme = ColorScheme.fromSeed(seedColor: primaryColor);

//   AuthUserServices authUserServices = AuthUserServices();

//   @override
//   void initState() {
//     super.initState();
//     // Future.delayed(const Duration(seconds: 1)).then((value) {
//     //   authUserServices.getUserData(context);
//     // });
//     // authUserServices.getUserData(context);
//     // Future.delayed(Duration.zero).then((value) {
//     //   authUserServices.getUserData(context);
//     // });
//     authUserServices.getUserData(context);
//   }

//   // @override
//   // void didChangeDependencies() {
//   //   super.didChangeDependencies();
//   //   // Future.delayed(Duration.zero).then((value) {
//   //   //   authUserServices.getUserData(context);
//   //   // });
//   //   authUserServices.getUserData(context);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         scaffoldMessengerKey: widget._messangerKey,
//         debugShowCheckedModeBanner: false,
//         onGenerateRoute: (settings) => generateRoute(settings),
//         home: Scaffold(
//           body: Provider.of<UserProvider>(context).user.token.isNotEmpty
//               ? Provider.of<UserProvider>(context).user.type == "seller"
//                   ? const SellerScreen()
//                   : const TabsScreen()
//               : const AuthScreenUserOrSerller(),
//         ),
//         theme: ThemeData().copyWith(
//           navigationBarTheme: const NavigationBarThemeData().copyWith(
//             surfaceTintColor: primaryColor,
//             indicatorColor: primaryColor.withOpacity(0.23),
//           ),
//         ));
//   }
// }

// Test-2

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: GlobalTheme.theme,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const MyApp(),
    ),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final AuthUserServices authUserServices = AuthUserServices();
  @override
  void initState() {
    authUserServices.getUserData(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == "seller"
              ? const SellerScreen()
              : const TabsScreen()
          : const AuthScreenUserOrSerller(),
    );
  }
}
