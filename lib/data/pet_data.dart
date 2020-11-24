class Pet {

	Pet();

	String name;
	String type;
	String gender;
	String weight;
	String color;
	String date;
	String breed;
	String image;
	

	Pet.fromMap(Map<String, dynamic> data) {
		name = data['name'];
		type = data['type'];
		gender = data['gender'];
		weight = data['weight'];
		color = data['color'];
		date = data['date'];
		breed = data['breed'];
		image = data['image'];
	}

	Map<String, dynamic> toMap() {
		return {
			'name': name,
			'type': type,
			'gender': gender,
			'weight': weight,
			'color': color,
			'date': date,
			'breed': breed,
			'image': image
		};
	}
}