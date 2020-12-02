import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class ProduccionScreen extends StatelessWidget {
  static const routeName = '/produccion';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producción'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Produccion'),
      ),
    );
  }
}
