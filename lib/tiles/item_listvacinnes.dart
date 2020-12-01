import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
	Map<String, dynamic> pet;
	int parImpar;

	ItemList(this.pet, this.parImpar);

    @override
    Widget build(BuildContext context) {
		Color _primaryColor = Theme.of(context).primaryColor;
		Color white = Theme.of(context).scaffoldBackgroundColor;
		return Padding(
			padding: const EdgeInsets.symmetric(vertical: 5.0),
			child: SizedBox(
				height: 80.0,
				child: Card(
					elevation: 4.0,
					color: parImpar % 2 == 0 ? white : _primaryColor,
					child: Row(
						mainAxisAlignment: MainAxisAlignment.spaceAround,
						children: <Widget>[
							Container(
								padding: EdgeInsets.all(7.0),
								width: 100.0,
								child: Column(
									children: <Widget>[
										Expanded(child:Image(image: AssetImage('images/${pet['image']}'))),
										Text(pet['name'],
											style: TextStyle(
												fontSize: 14.0,
												fontWeight: FontWeight.w700,
												color: parImpar % 2 == 0 ? Colors.grey[600] : Colors.grey[300]
											)
										)
									]
								)
							),
							Padding(
								padding: const EdgeInsets.all(10.0),
								child: Column(
									mainAxisAlignment: MainAxisAlignment.spaceEvenly,
									children: <Widget>[
										Text(pet['date'],
											style: TextStyle(
												fontSize: 17.0,
												fontWeight: FontWeight.w900,
												color: parImpar % 2 == 0 ? _primaryColor : white
											)
										),
										Text(pet['vacinne'],
											style: TextStyle(
												fontSize: 14.0,
												fontWeight: FontWeight.w700,
												color: parImpar % 2 == 0 ? _primaryColor : white
											)
										),
									]
								)
							)
						]
					)
				)
			)
		);
    }
}