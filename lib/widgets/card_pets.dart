import 'package:flutter/material.dart';
import 'package:pets_wallet/screens/pet_screen.dart';

class CardPets extends StatefulWidget {
	Map<String, dynamic> snapshot;

	CardPets(this.snapshot);

	@override
	_CardPetsState createState() => _CardPetsState();
}

class _CardPetsState extends State<CardPets> {

	String _difference;

	@override
	void initState() {
		super.initState();
		String dateSnapshot = widget.snapshot['date'].toString();

		int day = int.parse(dateSnapshot.substring(0, 2));
		int month = int.parse(dateSnapshot.substring(3, 5));
		int year = int.parse(dateSnapshot.substring(6));

		final birthday = DateTime(year, month, day);
		final now = DateTime.now();
		final days = now.difference(birthday).inDays;

		if(days < 365) {
			if(days < 30)
				_difference = "$days dias";
			else
				_difference = (days / 30).toStringAsFixed(0) + " meses";
		} else
			_difference = (days / 365).toStringAsFixed(0) + " ano(s)";
	}

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () {
				Navigator.of(context).push(
					MaterialPageRoute(builder: (context) => PetScreen(widget.snapshot))
				);
			},
			child: Container(
				margin: EdgeInsets.all(20.0),
				decoration: BoxDecoration(
					borderRadius: BorderRadius.all(Radius.circular(15)),
					color: Theme.of(context).primaryColor,
					boxShadow: [
						BoxShadow(
							color: Colors.grey.withOpacity(0.8),
							spreadRadius: 5.0,
							blurRadius: 7.0,
							offset: Offset(0, 0), // changes position of shadow
						)
					]
				),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: <Widget>[
						Container(
							width: 200.0,
							height: 160.0,
							child: Image(image: AssetImage('images/${widget.snapshot['image']}')),
							decoration: BoxDecoration(
								borderRadius: BorderRadius.all(Radius.circular(15)),
								color: Theme.of(context).scaffoldBackgroundColor
							)
						),
						SizedBox(height: 12.0),
						Row(
							mainAxisAlignment: MainAxisAlignment.start,
							children: [
								Padding(
									padding: EdgeInsets.only(left: 22.0, right: 10.0),
									child: Icon(Icons.pets, size: 25.0, color: Colors.white)
								),
								Text(widget.snapshot['name'],
									style: TextStyle(
										color: Colors.white,
										fontSize: 18.0
									)
								),
							]
						),
						SizedBox(height: 20.0),
						Row(
							mainAxisAlignment: MainAxisAlignment.start,
							children: [
								Padding(
									padding: EdgeInsets.only(left: 22.0, right: 10.0),
									child: Icon(Icons.cake, size: 25.0, color: Colors.white)
								),
								Text(_difference,
									style: TextStyle(
										color: Colors.white,
										fontSize: 18.0
									)
								)
							]
						)
					]
				)
			)
		);
	}
}