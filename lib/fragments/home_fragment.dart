import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lm_flutter/fragments/hotels/hotels_fragment.dart';
import 'package:lm_flutter/ui/lm_colors.dart';

import 'drawer_item.dart';
import 'package:lm_flutter/pages/empty_page.dart';

class HomeFragment extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Hotels", Icons.format_list_bulleted),
    new DrawerItem("Account", FontAwesomeIcons.userAstronaut),
    new DrawerItem("Favorite", Icons.favorite),
    new DrawerItem("Contact Us", Icons.mail),
  ];

  final String title;

  HomeFragment({Key key, this.title}) : super(key: key);

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  var assetsImage = new AssetImage('assets/andrea.png');

  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HotelsFragment();
        break;
      default:
        return new EmptyPage();
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          widget.drawerItems[_selectedDrawerIndex].title,
          style: new TextStyle(color: LmColors.BASE_ACCENT),
        ),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: LmColors.BASE_ACCENT),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Jane Roe"),
              accountEmail: Text("j.roe@lm.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.white
                        : Colors.white,
                child: new Container(
                  height: 120.0,
                  width: 120.0,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                      image: new AssetImage("assets/images/personal.png"),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}
