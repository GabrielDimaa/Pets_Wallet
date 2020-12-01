import 'package:flutter/material.dart';
import 'package:pets_wallet/screens/form_screen.dart';
import 'package:pets_wallet/screens/vaccine_screen.dart';
import 'package:pets_wallet/tiles/item_appbar.dart';
import 'package:pets_wallet/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
	@override
	_HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
	int _pageSelected = 0;

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			bottomNavigationBar: BottomAppBar(
				elevation: 0,
				child: Container(
					decoration: BoxDecoration(
						color: Theme.of(context).primaryColor,
						borderRadius: BorderRadius.circular(60)
					),
					margin: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 11.0),
					child: Row(
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						children: <Widget>[
							ItemAppBar(icon: Icons.home, onTap: () {
								setState(() => _pageSelected = 0);
							}),
							ItemAppBar(icon: Icons.add_circle, isHigh: true, onTap: () async {
								await Navigator.of(context).push(
									MaterialPageRoute(builder: (context) => FormScreen())
								);
								setState((){});
							}),
							ItemAppBar(icon: Icons.date_range, onTap: () {
								setState(() => _pageSelected = 1);
							})
						]
					)
				)
			),
			body: IndexedStack(
				index: _pageSelected,
				children: <Widget>[
					Container(
						color: Theme.of(context).scaffoldBackgroundColor,
						child: CustomScroll()
					),
					VaccineScreen()
				]
			)
		);
	}
}