import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/product/product_bloc.dart';
import 'data/services/api_service.dart';
import 'ui/pages/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(ApiService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ShopEase',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const SplashPage(),
      ),
    );
  }
}
