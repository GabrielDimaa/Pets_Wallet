import 'package:cloud_firestore/cloud_firestore.dart';

class Pet {
	Pet();

	String id;
	String name;
	String type;
	String gender;
	String weight;
	String color;
	String date;
	String breed;
	

	Pet.fromDocument(DocumentSnapshot snapshot) {
		id = snapshot.id;
		name = snapshot.data()['name'];
		type = snapshot.data()['type'];
		gender = snapshot.data()['gender'];
		weight = snapshot.data()['weight'];
		color = snapshot.data()['color'];
		date = snapshot.data()['date'];
		breed = snapshot.data()['breed'];
	}

	Map<String, dynamic> toMap() {
		return {
			'id': id,
			'name': name,
			'type': type,
			'gender': gender,
			'weight': weight,
			'color': color,
			'date': date,
			'breed': breed
		};
	}
}