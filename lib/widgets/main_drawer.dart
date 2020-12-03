import 'package:flutter/material.dart';
import 'package:prototipo/screens/clientes_screen.dart';
import 'package:prototipo/screens/despachos_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          //fontFamily: 'RobotoCondensed',
          fontSize: 24,
          //fontWeight: FontWeight.w700,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Menu',
              style: TextStyle(
                  //fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Órdenes Producción',
            Icons.format_strikethrough_rounded,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Despachos activos',
            Icons.settings,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(DespachosScreen.routeName);
            },
          ),
          buildListTile(
            'Clientes',
            Icons.accessibility,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(ClientesScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
