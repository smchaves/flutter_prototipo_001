import 'package:flutter/material.dart';
import '../models/ordenProduccion.dart';
import '../widgets/main_drawer.dart';

class Despacho extends StatelessWidget {
  static const routeName = '/despachos';
  @override
  Widget build(BuildContext context) {
    OrdenProduccion orden =
        ModalRoute.of(context).settings.arguments as OrdenProduccion;
    return Scaffold(
      appBar: AppBar(
        title: Text('OP Id: ${orden.id}'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('Aqui se despacha, el producto es ${orden.tipoProducto}'),
      ),
    );
  }
}
