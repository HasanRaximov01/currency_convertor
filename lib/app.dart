import 'package:currency_convertor/prezentation/pages/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const HomePage() ,
      localizationsDelegates:context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

    );
  }
}