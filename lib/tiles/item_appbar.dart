import 'package:flutter/material.dart';

class ItemAppBar extends StatelessWidget {
	final IconData icon;
	final bool isSelected;
	final bool isHigh;
	final Function onTap;

	ItemAppBar({this.icon, this.isSelected, this.isHigh, this.onTap});

	@override
	Widget build(BuildContext context) {
		return InkWell(
			child: Padding(
				padding: const EdgeInsets.all(10.0),
				child: SizedBox(
					child: Icon(
						icon, 
						color: isSelected != null ? Theme.of(context).accentColor : Colors.white,
						size: isHigh != null ? 32.0 : 23.0
					)
				)
			),
			onTap: onTap
		);
	}
}