import 'package:flutter/material.dart';
import 'package:schoolbookapp/app_theme.dart';
import 'package:schoolbookapp/models/child.dart';

class MyChildrenList extends StatelessWidget {
  final List<Child> children = [
    Child(
      firstName: 'Rutendo B',
      lastName: 'Mariza',
      imageUrl: 'https://i.pinimg.com/236x/97/96/c0/9796c0ab6caae1468715356dca09494f--hazel-eyes-afghan.jpg',
    ),
    Child(
      firstName: 'Evelyn',
      lastName: 'Mariza',
      imageUrl: 'https://i.pinimg.com/236x/45/e5/18/45e5183856b5d5e2be2b78f17565a15b.jpg',
    ),
    Child(
      firstName: 'Aretha',
      lastName: 'Mariza',
      imageUrl: 'https://i.pinimg.com/236x/3b/aa/02/3baa027a553adc703ab9b0b0e7d4fe4d--ginger-hair-red-heads.jpg',
    ),
    Child(
      firstName: 'Belinda',
      lastName: 'Kahlari',
      imageUrl: 'https://i.pinimg.com/236x/51/ee/2e/51ee2e3c4008fc8403af5027095fd723--beautiful-little-girls-beautiful-children.jpg',
    ),
    Child(
      firstName: 'Jayden',
      lastName: 'Mariza',
      imageUrl: 'https://i.pinimg.com/236x/8e/81/ab/8e81abe45e32f03ee303bcae1de3e1b5.jpg',
    ),
  ];

  MyChildrenList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'My Children',
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: 0.5,
                  color: AppTheme.lightText,
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_horiz),
                onPressed: null,
                iconSize: 30.0,
              ),
            ],
          ),
        ),
        Container(
          height: 125.0,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: children.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage:
                          NetworkImage('${children[index].imageUrl}'),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      '${children[index].firstName} ${children[index].lastName}',
                      style: AppTheme.body2,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
