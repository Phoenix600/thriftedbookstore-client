import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thriftedbookstore/common/tabs.dart';
import 'package:thriftedbookstore/features/auth/screens/auth_screen_01.dart';
import 'package:thriftedbookstore/features/auth/services/user_services/auth_user_services.dart';
import 'package:thriftedbookstore/provider/user_provider.dart';
import 'package:thriftedbookstore/router.dart';

void main(List<String> args) {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  AuthUserServices authUserServices = AuthUserServices();

  @override
  void initState() {
    super.initState();
    authUserServices.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Scaffold(
        body: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? Provider.of<UserProvider>(context).user.type == "seller"
                ? const TabsScreen()
                : const TabsScreen()
            : const AuthScreenUserOrSerller(),
      ),
    );
  }
}
