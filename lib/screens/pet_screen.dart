import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:pets_wallet/screens/home_screen.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class PetScreen extends StatefulWidget {

	Map<String, dynamic> snapshot;

	String documentID;

	PetScreen(this.snapshot, this.documentID);

	@override
	_PetScreenState createState() => _PetScreenState();
}

class _PetScreenState extends State<PetScreen> {

	bool _checkPuppy = false;
	bool _checkPolivalente70 = false;
	bool _checkPolivalente100 = false;
	bool _checkGripe = false;
	bool _checkGiardia = false;
	bool _checkRabica = false;

	final _scaffoldKey = GlobalKey<ScaffoldState>();

	@override
	void initState() { 
		super.initState();
		
		_checkPuppy = widget.snapshot['puppy'];
		_checkPolivalente70 = widget.snapshot['polivalente70'];
		_checkPolivalente100 = widget.snapshot['polivalente100'];
		_checkGripe = widget.snapshot['gripe'];
		_checkGiardia = widget.snapshot['giardia'];
		_checkRabica = widget.snapshot['rabica'];
	}

	String _dateVaccine(int days) {
		String snapshotDate = widget.snapshot['date'];

		int day = int.parse(snapshotDate.substring(0, 2));
		int month = int.parse(snapshotDate.substring(3, 5));
		int year = int.parse(snapshotDate.substring(6));

		DateTime date = DateTime(year, month, day);

		DateTime dateResult = DateTime(date.year, date.month, date.day + days);

		String formatDate(data) {
			String year = data.substring(0, 4);
			String month = data.substring(5, 7);
			String day = data.substring(8, 10);
			return "$day/$month/$year";
		}

		return formatDate(dateResult.toString());
	}

	@override
	Widget build(BuildContext context) {
		final Map<String, dynamic> snapshot = widget.snapshot;

		var _primaryColor = Theme.of(context).primaryColor;

		return Scaffold(
			key: _scaffoldKey,
			backgroundColor: Theme.of(context).scaffoldBackgroundColor,
			appBar: AppBar(
				title: Text(""),
				backgroundColor: Theme.of(context).scaffoldBackgroundColor,
				elevation: 0,
				iconTheme: IconThemeData(color: Colors.black),
				actions: <Widget>[
					FlatButton(
						child: Icon(Icons.delete, color: Colors.grey[600]),
						onPressed: () {
							_showAlertDialog(context);
						}
					)
				]
			),
			body: SingleChildScrollView(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Container(
							height: 180.0,
							width: double.infinity,
							child: Image(
								image: AssetImage('images/${snapshot['image']}')
							)
						),
						Container(
							height: 170.0,
							width: double.infinity,
							padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
							decoration: BoxDecoration(
								borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
								color: _primaryColor
							),
							child: Column(
								children: <Widget>[
									Row(
										mainAxisAlignment: MainAxisAlignment.center,
										children: [
											Padding(
												padding: EdgeInsets.only(right: 10.0),
												child: Icon(
													snapshot['type'] == "Cachorro" ? 
														Elusive.guidedog :
														RpgAwesome.cat,
													size: 32.0, 
													color: Colors.white
												)
											),
											Text(snapshot['name'],
												style: TextStyle(
													color: Colors.white,
													fontSize: 28.0,
													fontWeight: FontWeight.w500,
												)
											)
										]
									),
									SizedBox(height: 7.0),
									Text(snapshot['date'],
										style: TextStyle(
											color: Colors.white,
											fontSize: 14.0
										)
									),
									SizedBox(height: 20.0),
									Row(
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: <Widget>[
											_iconAndText(text: "${snapshot['breed']}", icon: Icons.pets),
											_iconAndText(text: "${snapshot['color']}", icon: Icons.timelapse)
										]
									),
									SizedBox(height: 15.0),
									Row(
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										children: <Widget>[
											_iconAndText(text: "${snapshot['gender']}", icon: FontAwesome.transgender),
											_iconAndText(text: "${snapshot['weight']}Kg  ", icon: FontAwesome.heartbeat)
										]
									)
								]
							)
						),
						Container(
							color: Color(0xFF493657),
							padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 50.0),
							width: double.infinity,
							child: Column(
								children: <Widget>[
									Row(
										mainAxisAlignment: MainAxisAlignment.center,
										children: [
											Padding(
												padding: EdgeInsets.only(right: 10.0),
												child: Icon(
													RpgAwesome.syringe,
													size: 32.0, 
													color: Colors.white
												)
											),
											Text("Vacinas do Pet",
												style: TextStyle(
													fontSize: 26.0,
													color: Colors.white,
													fontWeight: FontWeight.w600
												)
											)
										]
									),
									Padding(
										padding: const EdgeInsets.symmetric(horizontal: 100.0),
										child: Divider(color: Colors.white, height: 35.0)
									),
									SizedBox(height: 8.0),
									_checkBox(text: "Puppy", date: _dateVaccine(40), checkValue: _checkPuppy),
									_checkBox(text: "Polivalente 70", date: _dateVaccine(70), checkValue: _checkPolivalente70),
									_checkBox(text: "Polivalente 100", date: _dateVaccine(100), checkValue: _checkPolivalente100),
									_checkBox(text: "Gripe", date: _dateVaccine(100), checkValue: _checkGripe),
									_checkBox(text: "Giárdia", date: _dateVaccine(120), checkValue: _checkGiardia),
									_checkBox(text: "Anti Rábica", date: _dateVaccine(120), checkValue: _checkRabica),
									SizedBox(height: 25.0),
									ButtonTheme(
										minWidth: 210.0,
										height: 50.0,
										buttonColor: Colors.grey[350],
										shape: RoundedRectangleBorder(
											borderRadius: BorderRadius.circular(28.0)
										),
										child: RaisedButton(
											onPressed: () {
												snapshot['puppy'] = _checkPuppy;
												snapshot['polivalente70'] = _checkPolivalente70;
												snapshot['polivalente100'] = _checkPolivalente100;
												snapshot['gripe'] = _checkGripe;
												snapshot['giardia'] = _checkGiardia;
												snapshot['rabica'] = _checkRabica;

												try {
													FirebaseFirestore.instance.collection('pets')
														.doc(widget.documentID).set(snapshot);

													_scaffoldKey.currentState.showSnackBar(
														SnackBar(
															content: Text("Salvo com sucesso!",
																textAlign: TextAlign.center,
															),
															backgroundColor: Colors.green[300],
															duration: Duration(seconds: 3),
															padding: EdgeInsets.symmetric(vertical: 4.0)
														)
													);
												} catch(err) {
													_scaffoldKey.currentState.showSnackBar(
														SnackBar(
															content: Text("Erro ao salvar!\nVerifique conexão com a internet!"),
															backgroundColor: Colors.redAccent,
															duration: Duration(seconds: 3),
															padding: EdgeInsets.symmetric(vertical: 4.0)
														)
													);
												}
											},
											child: Wrap(
												crossAxisAlignment: WrapCrossAlignment.center,
												children: [
													Padding(
														padding: EdgeInsets.only(right: 10.0),
														child: Icon(RpgAwesome.syringe, color: Color(0xFF493657), size: 27.0)
													),
													Text('Salvar Vacinas',
														style: TextStyle(
															color: Color(0xFF493657),
															fontSize: 20.0
														)
													)
												]
											)
										)
									)
								]
							)
						)
					]
				)
			)
		);
	}

	Widget _checkBox({String text, String date, bool checkValue}) {
		return Theme(
			data: Theme.of(context).copyWith(
				unselectedWidgetColor: Colors.white
			),
			child: CheckboxListTile(
				title: Text(text,
					style: TextStyle(
						color: Colors.white,
						fontSize: 18.0,
						fontWeight: FontWeight.w500
					)
				),
				subtitle: Text(date,
					style: TextStyle(
						color: Colors.grey,
						fontSize: 14.0,
						fontWeight: FontWeight.w500
					)
				),
				activeColor: Colors.white,
				checkColor: Theme.of(context).primaryColor,
				value: checkValue,
				onChanged: (val) {
					setState(() {
						if(text == "Puppy") 
							_checkPuppy = val;
						if(text == "Polivalente 70") _checkPolivalente70 = val;
						if(text == "Polivalente 100") _checkPolivalente100 = val;
						if(text == "Gripe") _checkGripe = val;
						if(text == "Giárdia") _checkGiardia = val;
						if(text == "Anti Rábica") _checkRabica = val;
					});
				}
			)
		);
	}

	Widget _iconAndText({String text, IconData icon}) {
		return Row(
			mainAxisAlignment: MainAxisAlignment.start,
			children: [
				Padding(
					padding: EdgeInsets.only(right: 10.0),
					child: Icon(icon, size: 22.0, color: Colors.white)
				),
				Text(text,
					style: TextStyle(
						color: Colors.white,
						fontSize: 18.0
					)
				),
			]
		);
	}

	Widget _showAlertDialog(BuildContext context) {
		showDialog(
			context: context,
			builder: (BuildContext context) {
				return AlertDialog(
					title: Icon(Icons.error_outline, color: Theme.of(context).primaryColor, size: 88.0),
					content: Text(
						"Deseja excluir esse pet?",
						style: TextStyle(
							fontWeight: FontWeight.w600, 
							fontSize: 21.0
						),
						textAlign: TextAlign.center
					),
					actions: [
						FlatButton(
							child: Text("Excluir :(", style: TextStyle(
								fontSize: 15.0,
								color: Theme.of(context).primaryColor
							)),
							onPressed: () {
								FirebaseFirestore.instance.collection('pets')
									.doc(widget.documentID).delete();
								Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
									builder: (context) => HomeScreen()), (Route<dynamic> route) => false);
							}
						),
						FlatButton(
							child: Text("Cancelar", style: TextStyle(
								fontSize: 15.0,
								color: Theme.of(context).primaryColor
							)),
							onPressed: () {
								Navigator.pop(context);
							}
						)
					]
				);
			}
		);
	}
}
