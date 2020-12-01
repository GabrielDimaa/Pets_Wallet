import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:pets_wallet/widgets/card_pets.dart';

class PetsList extends StatefulWidget {

	String teste;
	PetsList(this.teste);

	@override
	_PetsListState createState() => _PetsListState();
}

class _PetsListState extends State<PetsList> {

	List<Widget> _dividedTiles = [Text("Adicione um Pet!")];

	String _firebaseController = "todos";

	@override
	Widget build(BuildContext context) {
		return FutureBuilder(
			future: FirebaseFirestore.instance.collection('pets').get(),
			builder: (context, snapshot) {
				if(!snapshot.hasData)
					return Center(child: CircularProgressIndicator());
				else {
					if(widget.teste.isNotEmpty) {
						_firebaseController = "todos";
						_dividedTiles = ListTile.divideTiles(tiles: snapshot.data.docs.map<Widget>((doc) {
							var docData = doc.data();
							if(docData['name'].toString().toLowerCase().contains(widget.teste.toLowerCase())) {
								return CardPets(doc.data(), doc.documentID);
							} else {
								return Container();
							}
						}).toList(),
						color: Colors.transparent).toList();
					} else {
						if(_firebaseController == "todos") {
						_dividedTiles = ListTile.divideTiles(tiles: snapshot.data.docs.map<Widget>((doc) {
							return CardPets(doc.data(), doc.documentID);
						}).toList(),
						color: Colors.transparent).toList();
					} else if(_firebaseController == "dogs") {
						_dividedTiles = ListTile.divideTiles(tiles: snapshot.data.docs.map<Widget>((doc) {
							var docData = doc.data();
							if(docData['type'].toString() == "Cachorro") {
								return CardPets(doc.data(), doc.documentID);
							} else {
								return Container();
							}
						}).toList(),
						color: Colors.transparent).toList();
					} else if(_firebaseController == "cats") {
							_dividedTiles = ListTile.divideTiles(tiles: snapshot.data.docs.map<Widget>((doc) {
							var docData = doc.data();
							if(docData['type'].toString() == "Gato") {
								return CardPets(doc.data(), doc.documentID);
							} else {
								return Container();
							}
						}).toList(),
						color: Colors.transparent).toList();
					}
				}
					return Column(
						children: <Widget>[
							Padding(
								padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
								child: Row(
									mainAxisAlignment: MainAxisAlignment.center,
									children: <Widget>[
										_buttonSliver(text: "Todos", onPressed: () {
											setState(() {
												_firebaseController = "todos";
											});
										}),
										SizedBox(width: 17.0),
										_buttonSliver(text: "Dogs", icon: Elusive.guidedog, onPressed: () {
											setState(() {
												_firebaseController = "dogs";
											});
										}),
										SizedBox(width: 17.0),
										_buttonSliver(text: "Cats", icon: RpgAwesome.cat, onPressed: () {
											setState(() {
												_firebaseController = "cats";
											});
										})
									]
								)
							),
							Container(
								height: 300,
								child: ListView.builder(
									scrollDirection: Axis.horizontal,
									itemCount: _dividedTiles.length,
									shrinkWrap: true,
									itemBuilder: (context, index) {
										return _dividedTiles[index];
									}
								)
							)
						]
					);
				}
			}
		);
	}

	Widget _buttonSliver({String text, IconData icon, Function onPressed}) {
		return FlatButton(
			onPressed: onPressed,
			padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
			child: Row(
				children: <Widget>[
					icon != null ? Padding(
						padding: EdgeInsets.only(right: 6.0),
						child: Icon(
							icon,
							size: 20.0, 
							color: Colors.white
						)
					) : Container(),
					Text(text,
						style: TextStyle(
							fontSize: 18.0,
							color: Colors.white,
							fontWeight: FontWeight.w600
						)
					),
				]
			),
			color: _firebaseController == text.toLowerCase() ? Colors.deepPurple[400] : Colors.deepPurple[200],
			textColor: Colors.white
		);
	}
}