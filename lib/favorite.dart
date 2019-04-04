import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFav = true;
  int _favCount = 41;

  void _toggleFav() {
    setState(() {
      _isFav = !_isFav;
      _favCount += _isFav ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (_isFav ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFav,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favCount'),
          ),
        )
      ],
    );
  }
}
