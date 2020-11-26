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

	bool puppy = false;
	bool polivalente70 = false;
	bool polivalente100 = false;
	bool gripe = false;
	bool giardia = false;
	bool rabica = false;
	

	Pet.fromMap(Map<String, dynamic> data) {
		name = data['name'];
		type = data['type'];
		gender = data['gender'];
		weight = data['weight'];
		color = data['color'];
		date = data['date'];
		breed = data['breed'];
		image = data['image'];
		puppy = data['puppy'];
		polivalente70 = data['polivalente70'];
		polivalente100 = data['polivalente100'];
		gripe = data['gripe'];
		giardia = data['giardia'];
		rabica = data['rabica'];
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
			'image': image,
			'puppy': puppy,
			'polivalente70': polivalente70,
			'polivalente100': polivalente100,
			'gripe': gripe,
			'giardia': giardia,
			'rabica': rabica
		};
	}
}