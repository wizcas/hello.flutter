import 'package:flutter/material.dart';
import './anim-logo.dart';
import './favorite.dart';

class DetailRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color btnColor = Theme.of(context).primaryColor;
    Widget titleSection = Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('风景如画 四季如春',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Text('Kandersteg, Switzerland',
                    style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          FavoriteWidget(),
        ],
      ),
    );
    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildButtonColumn(btnColor, Icons.call, 'CALL'),
          _buildButtonColumn(btnColor, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(btnColor, Icons.share, 'SHARE'),
        ],
      ),
    );
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.'
            ''
            'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.'
            ''
            'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Layout Demo Home'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                'images/lake.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              LogoWidget(),
            ],
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ))
      ],
    );
  }
}
