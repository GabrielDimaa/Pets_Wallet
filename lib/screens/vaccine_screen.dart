import 'package:flutter/material.dart';
import 'package:pets_wallet/widgets/vaccines_listview.dart';

class VaccineScreen extends StatefulWidget {
	@override
	_VaccineScreenState createState() => _VaccineScreenState();
}

class _VaccineScreenState extends State<VaccineScreen> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Theme.of(context).scaffoldBackgroundColor,
			appBar: AppBar(
				title: Text(""),
				backgroundColor: Theme.of(context).scaffoldBackgroundColor,
				elevation: 0,
				iconTheme: IconThemeData(color: Colors.black)
			),
			body: SingleChildScrollView(
				padding: const EdgeInsets.only(top: 0.0, left: 35.0, right: 35.0),
				child: Column(
					children: <Widget>[
						Container(
							height: 170.0,
							child: Stack(
								children: <Widget>[
									Positioned(
										top: 0.0, left: 5.0,
										child: Text("Datas de vacinas\ndos Pets",
											style: TextStyle(
												fontSize: 36.0, 
												fontWeight: FontWeight.bold,
												color: Theme.of(context).primaryColor
											)
										)
									),
									Positioned(
										bottom: 35.0, left: 5.0,
										child: Text("Consulte as próximas datas de\nvacinas de todos os Pets.",
											style: TextStyle(
												fontSize: 16.0, 
												fontWeight: FontWeight.bold
											)
										)
									)
								]
							)
						),
						VaccinesList()
					]
				),
			)
		);
	}
}