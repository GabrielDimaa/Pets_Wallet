import 'package:flutter/material.dart';
import 'package:pets_wallet/widgets/pets_listview.dart';

class CustomScroll extends StatefulWidget {
	@override
	_CustomScrollState createState() => _CustomScrollState();
}

class _CustomScrollState extends State<CustomScroll> {

	Widget _appBarTitle = Text("Pets Wallet",
		style: TextStyle(fontSize: 23.0)
	);

	Icon _icon = Icon(
		Icons.search,
		color: Colors.white,
	);

	final TextEditingController _controllerSearch = new TextEditingController();

	bool _isSearching = false;
	String _searchText = "";

	@override
	Widget build(BuildContext context) {
		return CustomScrollView(
			slivers: <Widget>[
				SliverAppBar(
					title: _appBarTitle,
					centerTitle: true,
					expandedHeight: 160.0,
					floating: false,
					flexibleSpace: FlexibleSpaceBar(
						titlePadding: EdgeInsetsDirectional.only(bottom: 0),
						title: Container(
							padding: EdgeInsets.all(0.0),
							height: 80.0,
							child: Image(image: AssetImage('images/dogAppBar.png'))
						),
						centerTitle: true
					),
					actions: <Widget>[
						IconButton(
							icon: _icon,
							onPressed: () {
								setState(() {
									if(_icon.icon == Icons.search) {
										_icon = Icon(
											Icons.close,
											color: Colors.white,
										);
										_appBarTitle = TextField(
											controller: _controllerSearch,
											style: TextStyle(color: Colors.white),
											decoration: InputDecoration(
												enabledBorder: OutlineInputBorder(
													borderSide: BorderSide(color: Colors.transparent),
												),
												filled: true,
												prefixIcon: Icon(Icons.search, color: Colors.white),
												hintText: "Pesquise seu Pet",
												hintStyle: TextStyle(color: Colors.grey[100])
											),
											onChanged: (value) {
												_searchText = value;
												setState((){});
											}
										);
										_handleSearchStart();
									} else {
										_handleSearchReset();
									}
								});
							}
						)
					]
				),
				SliverToBoxAdapter(
					child: PetsList(_searchText)
				)
			]
		);
	}

	void _handleSearchStart() {
		setState(() {
			_isSearching = true;
		});
	}

	void _handleSearchReset() {
		setState(() {
			_appBarTitle = Text("Pets Wallet",
				style: TextStyle(fontSize: 23.0)
			);

			_icon = Icon(
				Icons.search,
				color: Colors.white,
			);

			_isSearching = false;
			_controllerSearch.clear();
			_searchText = "";
		});
	}
}