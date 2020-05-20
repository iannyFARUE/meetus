class HomeWorkList {
  HomeWorkList({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.status,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String> meals;
  String status;

  static List<HomeWorkList> tabIconsList = <HomeWorkList>[
    HomeWorkList(
      imagePath: 'assets/images/breakfast.png',
      titleTxt: '10 Apr 20',
      status: 'pending',
      meals: <String>['Mathematics,', 'Reading,', 'Shona'],
      startColor: '#FA7D82',
      endColor: '#FFB295',
    ),
    HomeWorkList(
      imagePath: 'assets/images/lunch.png',
      titleTxt: '08 Apr 20',
      status: 'partially-done',
      meals: <String>['English,', 'Book Reading,', 'Content'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    HomeWorkList(
      imagePath: 'assets/images/snack.png',
      titleTxt: '07 Apr 20',
      status: 'done',
      meals: <String>['Mathematics', 'Reading'],
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    HomeWorkList(
      imagePath: 'assets/images/dinner.png',
      titleTxt: '06 Mar 20',
      status: 'done',
      meals: <String>['Agriculture', 'Reading'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
  ];
}
