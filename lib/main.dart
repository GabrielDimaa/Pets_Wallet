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
				primaryColor: Color(0xFF9381FF),
				primaryColorDark: Color(0xFF1E1A1D),
				accentColor: Color(0xFFEF767A),
				scaffoldBackgroundColor: Color(0xFFFCFCFC),
				visualDensity: VisualDensity.adaptivePlatformDensity
			),
			debugShowCheckedModeBanner: false,
			home: HomeScreen()
		);
	}
}