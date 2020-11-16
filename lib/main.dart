import 'package:flutter/material.dart';
import 'package:pets_wallet/screens/home_screen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Pets Wallet',
			theme: ThemeData(
				primaryColor: Color(0xFF4464AD),
				primaryColorDark: Color(0xFF883955),
				primaryColorLight: Color(0xFFF4AFB4),
				accentColor: Color(0xFFF5E960),
				visualDensity: VisualDensity.adaptivePlatformDensity,
			),
			debugShowCheckedModeBanner: false,
			home: HomeScreen()
		);
	}
}