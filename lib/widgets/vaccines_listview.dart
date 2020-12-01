import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pets_wallet/tiles/item_listvacinnes.dart';

class VaccinesList extends StatelessWidget {

	List listPets = [];
	List<Map<String, dynamic>> listVacinnes = [];
	List<Map<String, dynamic>> listOrder = [];

	void _getVaccines() {
		listPets.forEach((snapshot) {
			if(!snapshot['puppy']) {
				String date = _dateVaccine(snapshot['date'], 40);
				Map<String, dynamic> aux = {
					'name': snapshot['name'],
					'vacinne': "Puppy",
					'date': date,
					'image': snapshot['image']
				};
				listVacinnes.add(aux);
			}
			if(!snapshot['polivalente70']) {
				String date = _dateVaccine(snapshot['date'], 70);
				Map<String, dynamic> aux = {
					'name': snapshot['name'],
					'vacinne': "Polivalente",
					'date': date,
					'image': snapshot['image']
				};
				listVacinnes.add(aux);
			}
			if(!snapshot['polivalente100']) {
				String date = _dateVaccine(snapshot['date'], 100);
				Map<String, dynamic> aux = {
					'name': snapshot['name'],
					'vacinne': "Polivalente",
					'date': date,
					'image': snapshot['image']
				};
				listVacinnes.add(aux);
			}
			if(!snapshot['gripe']) {
				String date = _dateVaccine(snapshot['date'], 100);
				Map<String, dynamic> aux = {
					'name': snapshot['name'],
					'vacinne': "Gripe",
					'date': date,
					'image': snapshot['image']
				};
				listVacinnes.add(aux);
			}
			if(!snapshot['giardia']) {
				String date = _dateVaccine(snapshot['date'], 120);
				Map<String, dynamic> aux = {
					'name': snapshot['name'],
          			'vacinne': "Giárdia",
					'date': date,
					'image': snapshot['image']
				};
				listVacinnes.add(aux);
			}
			if(!snapshot['rabica']) {
				String date = _dateVaccine(snapshot['date'], 120);
				Map<String, dynamic> aux = {
					'name': snapshot['name'],
					'vacinne': "Anti Rábica",
					'date': date,
					'image': snapshot['image']
				};
				listVacinnes.add(aux);
			}
		});

		_orderByDate();

		for(var i = 0; i < listVacinnes.length; i++) {
			String date = _formatDate(listVacinnes[i]['date']);
			listVacinnes[i]['date'] = date;
		}
	}

	String _dateVaccine(String snapshotDate, int days) {
		int day = int.parse(snapshotDate.substring(0, 2));
		int month = int.parse(snapshotDate.substring(3, 5));
		int year = int.parse(snapshotDate.substring(6));

		DateTime date = DateTime(year, month, day);

		DateTime dateResult = DateTime(date.year, date.month, date.day + days);

		return dateResult.toString().substring(0, 10);
	}

	String _formatDate(data) {
		String year = data.substring(0, 4);
		String month = data.substring(5, 7);
		String day = data.substring(8, 10);
		return "$day/$month/$year";
	}

    void _orderByDate() {
		listVacinnes.sort((a, b) => a['date'].compareTo(b['date']));
	}

	@override
    Widget build(BuildContext context) {
      return FutureBuilder(
			future: FirebaseFirestore.instance.collection('pets').get(),
			builder: (context, snapshot) {
				if(!snapshot.hasData)
					return Center(child: CircularProgressIndicator());
				else {
					listPets.clear();
					snapshot.data.docs.forEach((doc) {
						listPets.add(doc.data());
					});
				}
				listVacinnes.clear();
				_getVaccines();
				
				return ListView.builder(
					scrollDirection: Axis.vertical,
					physics: ScrollPhysics(),
					itemCount: listVacinnes.length,
					shrinkWrap: true,
					itemBuilder: (context, index) {
						return ItemList(listVacinnes[index], index);
					}
				);
			}
		);
    }
}