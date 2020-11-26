import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pets_wallet/widgets/card_pets.dart';

class PetsList extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return FutureBuilder(
			future: FirebaseFirestore.instance.collection('pets').get(),
			builder: (context, snapshot) {
				if(!snapshot.hasData)
					return Center(child: CircularProgressIndicator());
				else {
					var dividedTiles = ListTile.divideTiles(tiles: snapshot.data.docs.map<Widget>((doc) {
							return CardPets(doc.data(), doc.documentID);
						}).toList(),
						color: Colors.transparent).toList();
						
					return Container(
						height: 300.0,
						child: ListView(
							scrollDirection: Axis.horizontal,
							children: dividedTiles
						),
					);
				}
			}
		);
	}
}