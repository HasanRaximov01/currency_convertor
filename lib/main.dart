 import 'package:currency_convertor/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
 await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(path: 'assets/translations',
  supportedLocales: const [Locale("uz","UZ"),Locale("ru","RU"),Locale("en","US")],
  fallbackLocale:const Locale("en","US"),

  child: const MyApp()));
 }