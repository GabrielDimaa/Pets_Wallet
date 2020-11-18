import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class FormScreen extends StatelessWidget {

	Color _color;

	final _formKey = GlobalKey<FormState>();

	final _nameController = TextEditingController();
	final _dateController = TextEditingController();
	final _breedController = TextEditingController();
	final _genderController = TextEditingController();
	final _weightController = TextEditingController();
	final _colorController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		_color =  Theme.of(context).primaryColor;
		return Scaffold(
			appBar: AppBar(
				title: Text(""),
				backgroundColor: Theme.of(context).scaffoldBackgroundColor,
				elevation: 0,
				iconTheme: IconThemeData(color: Colors.black),
			),
			body: SingleChildScrollView(
				padding: EdgeInsets.all(35.0),
				child: Column(
					children: <Widget>[
						Container(
							height: 170.0,
							child: Stack(
								children: <Widget>[
									Positioned(
										top: 0.0, left: 5.0,
										child: Text("Adicione seu\nnovo Pet",
											style: TextStyle(
												fontSize: 36.0, 
												fontWeight: FontWeight.bold,
												color: _color
											)
										)
									),
									Positioned(
										bottom: 35.0, left: 5.0,
										child: Text("Preencha os campos abaixo,\ncom os dados do seu bixinho",
											style: TextStyle(
												fontSize: 16.0, 
												fontWeight: FontWeight.bold
											)
										)
									)
								]
							)
						),
						Form(
							key: _formKey,
							child: Column(
								children: <Widget>[
									textFormField(
										label: "Nome",
										controller: _nameController,
										icon: Icons.pets,
										error: "Nome não Informado!"
									),
									SizedBox(height: 20.0),
									textFormField(
										label: "Sexo",
										controller: _nameController,
										icon: FontAwesome.transgender,
										error: "Sexo não Informado!"
									),
									SizedBox(height: 20.0),
									textFormField(
										label: "Raça",
										controller: _breedController,
										icon: Icons.pets,
										error: "Raça não Informado!"
									),
									SizedBox(height: 20.0),
									textFormField(
										label: "Peso",
										controller: _nameController,
										icon: FontAwesome.heartbeat,
										keyboard: true,
										error: "Peso não Informado!"
									),
									SizedBox(height: 20.0),
									textFormField(
										label: "Coloração",
										controller: _colorController,
										icon: Icons.timelapse,
										error: "Cor não Informado!"
									),
									SizedBox(height: 20.0),
									textFormField(
										label: "Data de Nascimento",
										controller: _colorController,
										error: "Data não Informado!"
									)
								]
							)
						)
					]
				)
			)
		);
	}

	Widget textFormField({String label, TextEditingController controller, 
		String error, IconData icon, bool keyboard}) {

		return TextFormField(
			keyboardType: keyboard != null ? TextInputType.number : TextInputType.text,
			style: TextStyle(color: _color, fontSize: 17),
			textAlign: TextAlign.center,
			decoration: InputDecoration(
				prefixIcon: Icon(icon, color: _color),
				contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
				labelText: label,
				labelStyle: TextStyle(
					color: _color.withOpacity(0.8),
					fontSize: 18.0,
				),
				border: OutlineInputBorder(
					borderSide: BorderSide(color: _color, width: 3.0),
					borderRadius: BorderRadius.all(Radius.circular(15.0)),
				),
				enabledBorder: OutlineInputBorder(
					borderSide: BorderSide(color: Colors.grey[600], width: 3.0),
					borderRadius: BorderRadius.all(Radius.circular(15.0))
				),
				focusedBorder: OutlineInputBorder(
					borderSide: BorderSide(color: _color, width: 3.0),
					borderRadius: BorderRadius.all(Radius.circular(15.0))
				),
			),
			validator: (text) {
				return text.isEmpty ? error : null;
			},
			controller: controller
		);
	}
}