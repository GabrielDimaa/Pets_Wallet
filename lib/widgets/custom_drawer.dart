import 'package:flutter/material.dart';
import 'package:pets_wallet/widgets/pets_listview.dart';

class CustomScroll extends StatelessWidget {
  	@override
	Widget build(BuildContext context) {
		return CustomScrollView(
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
							height: 80.0,
							child: Image(image: AssetImage('images/dogAppBar.png'))
						),
						centerTitle: true
					)
				),
				SliverToBoxAdapter(
					child: Column(
						children: <Widget>[
							Padding(
								padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
								child: Row(
									mainAxisAlignment: MainAxisAlignment.center,
									children: <Widget>[
										_buttonSliver("Todos", (){}),
										SizedBox(width: 17.0),
										_buttonSliver("Dogs", (){}),
										SizedBox(width: 17.0),
										_buttonSliver("Cats", (){})
									]
								)
							),
							PetsList()
						]
					),
				)
			]
		);
	}

	Widget _buttonSliver(String text, Function onPressed) {
		return FlatButton(
			onPressed: onPressed,
			padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
			child: Text(text,
				style: TextStyle(
					fontSize: 18.0
				)
			),
			color: Colors.deepPurple[200],
			textColor: Colors.white
		);
	}
}