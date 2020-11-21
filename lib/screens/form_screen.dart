import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:pets_wallet/data/pet_data.dart';
import 'package:pets_wallet/screens/home_screen.dart';

class FormScreen extends StatefulWidget {
	@override
	_FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

	Color _primaryColor;

	final _formKey = GlobalKey<FormState>();

	int _radioValueGender = 0;
	String _radioGender = "Macho";	

	int _radioValueType = 0;
	String _radioType = "Cachorro";

	final _nameController = TextEditingController();
	var _dateController = TextEditingController();
	final _breedController = TextEditingController();
	final _weightController = TextEditingController();
	final _colorController = TextEditingController();

	void _insertPet() async {
		Pet pet = Pet();
		pet.name = _nameController.text;
		pet.type = _radioType;
		pet.gender = _radioGender;
		pet.weight = _weightController.text;
		pet.color = _colorController.text;
		pet.date = _dateController.text;
		pet.breed = _breedController.text;

		await Firebase.initializeApp();
		await FirebaseFirestore.instance.collection('pets').add(pet.toMap());

		Navigator.of(context).pop();
	}

	void _handleRadioGender(int value) {
		setState(() {
			_radioValueGender = value;

			switch (_radioValueGender) {
				case 0:
					_radioGender = "Macho";
				break;
				case 1:
					_radioGender = "Fêmea";
				break;
			}
		});
	}

	void _handleRadioType(int value) {
		setState(() {
			_radioValueType = value;

			switch (_radioValueType) {
				case 0:
					_radioType = "Cachorro";
				break;
				case 1:
					_radioType = "Gato";
				break;
			}
		});
	}

	@override
	Widget build(BuildContext context) {
		_primaryColor =  Theme.of(context).primaryColor;
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
												color: _primaryColor
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
									Row(
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: <Widget>[
											_radioButton(
												textGender: "Cachorro",
												value: 0,
												radioValue: _radioValueType,
												icon: Elusive.guidedog,
												function: _handleRadioType
											),
											_radioButton(
												textGender: "Gato",
												value: 1,
												radioValue: _radioValueType,
												icon: RpgAwesome.cat,
												function: _handleRadioType
											)
										]
									),
									Row(
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: <Widget>[
											_radioButton(
												textGender: "Macho",
												value: 0,
												radioValue: _radioValueGender,
												icon: Elusive.male,
												function: _handleRadioGender
											),
											_radioButton(
												textGender: "Fêmea",
												value: 1,
												radioValue: _radioValueGender,
												icon: Elusive.female,
												function: _handleRadioGender
											)
										]
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
										label: "Peso (Kg)",
										controller: _weightController,
										icon: FontAwesome.heartbeat,
										keyboard: true,
										error: "Peso não Informado!"
									),
									SizedBox(height: 20.0),
									textFormField(
										label: "Coloração do Pelo",
										controller: _colorController,
										icon: Icons.timelapse,
										error: "Cor não Informado!"
									),
									SizedBox(height: 20.0),
									Container(
										width: double.infinity,
										child: Row(
											mainAxisAlignment: MainAxisAlignment.spaceBetween,
											children: <Widget>[
												Expanded(
													child:textFormField(
														label: "Nascimento",
														controller: _dateController,
														icon: Icons.date_range,
														error: "Data não Informado!",
														enabled: false
													),
												),
												Padding(
													padding: EdgeInsets.only(left: 15.0),
													child: RaisedButton(
														onPressed: () => _dateCalender(context), // Refer step 3
														child: Text("data",
															style:
																TextStyle(
																	color: Colors.white, 
																	fontWeight: FontWeight.bold,
																	fontSize: 17.0
																),
														),
														color: _primaryColor,
													),
												)
											]
										)
									)
								]
							)
						),
						SizedBox(height: 40.0),
						ButtonTheme(
							minWidth: 200.0,
							height: 50.0,
							buttonColor: _primaryColor,
							child: RaisedButton(
								onPressed: () {
									if (_formKey.currentState.validate()) {
										_insertPet();
									}
								},
								child: Wrap(
									crossAxisAlignment: WrapCrossAlignment.center,
									children: [
										Padding(
											padding: EdgeInsets.only(right: 10.0),
											child: Icon(Icons.save, color: Colors.white)
										),
										Text('Adicionar',
											style: TextStyle(
												color: Colors.white,
												fontSize: 20.0
											)
										),
									]
								)
							)
						)
					]
				)
			)
		);
	}

	Widget textFormField({String label, TextEditingController controller, 
		String error, IconData icon, bool keyboard, bool enabled}) {

		return TextFormField(
			keyboardType: keyboard != null ? TextInputType.number : TextInputType.text,
			enabled: enabled != null ? enabled : true,
			style: TextStyle(color: _primaryColor, fontSize: 17),
			textAlign: TextAlign.start,
			decoration: InputDecoration(
				prefixIcon: Icon(icon, color: _primaryColor),
				contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
				labelText: label,
				labelStyle: TextStyle(
					color: _primaryColor.withOpacity(0.8),
					fontSize: 18.0,
				),
				border: OutlineInputBorder(
					borderSide: BorderSide(color: _primaryColor, width: 3.0),
					borderRadius: BorderRadius.all(Radius.circular(15.0)),
				),
				enabledBorder: OutlineInputBorder(
					borderSide: BorderSide(color: Colors.grey[600], width: 3.0),
					borderRadius: BorderRadius.all(Radius.circular(15.0))
				),
				focusedBorder: OutlineInputBorder(
					borderSide: BorderSide(color: _primaryColor, width: 3.0),
					borderRadius: BorderRadius.all(Radius.circular(15.0))
				),
			),
			validator: (text) {
				return text.isEmpty ? error : null;
			},
			controller: controller
		);
	}

	Widget _radioButton({String textGender, int value, Function function, IconData icon, int radioValue}) {
		return Row(
			children: <Widget>[
				Radio(
					value: value,
					groupValue: radioValue,
					onChanged: function,
					activeColor: _primaryColor,
				),
				Padding(
					padding: EdgeInsets.only(right: 10.0),
					child: Icon(icon, color: _primaryColor, size: 18.0)
				),
				Text(textGender,
					style: TextStyle(
						fontSize: 18.0,
						color: _primaryColor.withOpacity(0.8)
					),
				),
			]
		);
	}

	void _dateCalender(BuildContext context) async {
		final DateTime _selectedDate = DateTime.now();

		final DateTime picked = await showDatePicker(
			context: context,
			initialDate: _selectedDate, // Refer step 1
			firstDate: DateTime(2000),
			lastDate: _selectedDate,
		);
		if (picked != null && picked != _selectedDate) {
			setState(() {
				_formatDate(picked.toString().substring(0, 10));
			});
		}
	}

	void _formatDate(String data) {
		String year = data.substring(0, 4);
		String month = data.substring(5, 7);
		String day = data.substring(8, 10);
		String dataFormated = "${day}/${month}/${year}";
		_dateController.text = dataFormated;
		_dateController.value = TextEditingValue(
			text: dataFormated,
			selection: TextSelection.fromPosition(
				TextPosition(offset: dataFormated.length),
			),
		);
	}
}