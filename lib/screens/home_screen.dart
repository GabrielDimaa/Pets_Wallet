import 'package:flutter/material.dart';
import 'package:pets_wallet/screens/form_screen.dart';
import 'package:pets_wallet/tiles/item_appbar.dart';

class HomeScreen extends StatelessWidget {
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
							ItemAppBar(icon: Icons.home),
							ItemAppBar(icon: Icons.add_circle, isHigh: true, onTap: () {
								Navigator.of(context).push(
									MaterialPageRoute(builder: (context) => FormScreen())
								);
							}),
							ItemAppBar(icon: Icons.search)
						]
					)
				)
			),
			body: Stack(
				children: <Widget>[
					Container(color: Theme.of(context).scaffoldBackgroundColor),
					CustomScrollView(
						slivers: <Widget>[
							SliverAppBar(
								title: Text("Pets Wallet",
									style: TextStyle(fontSize: 23.0)
								),
								centerTitle: true,
								expandedHeight: 160.0,
								floating: false,
								flexibleSpace: FlexibleSpaceBar(
									titlePadding: EdgeInsetsDirectional.only(bottom: 0),
									title: Container(
										padding: EdgeInsets.all(0.0),
										height: 60.0,
										child: Image(image: AssetImage('images/gatoAppBar.png'))
									),
									centerTitle: true
								)
							)
						]
					)
				]
			)
		);
	}
}