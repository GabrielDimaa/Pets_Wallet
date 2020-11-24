import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pets_wallet/screens/home_screen.dart';

void main() async {
	WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp();
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
				accentColor: Color(0xFFDE6C83),
				scaffoldBackgroundColor: Color(0xFFFCFCFC),
				visualDensity: VisualDensity.adaptivePlatformDensity
			),
			localizationsDelegates: [
				GlobalMaterialLocalizations.delegate,
				GlobalWidgetsLocalizations.delegate
			],
			supportedLocales: [const Locale('pt', 'BR')],
			debugShowCheckedModeBanner: false,
			home: HomeScreen()
		);
	}
}