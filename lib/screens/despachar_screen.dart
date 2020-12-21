import 'package:flutter/material.dart';
import 'package:prototipo/models/ordenProduccion.dart';
import '../widgets/main_drawer.dart';

class DespacharScreen extends StatelessWidget {
  static const routeName = '/despachar-screen';

  final Function despachar;
  DespacharScreen(this.despachar);
  @override
  Widget build(BuildContext context) {
    OrdenProduccion despacho =
        ModalRoute.of(context).settings.arguments as OrdenProduccion;
    return Scaffold(
      appBar: AppBar(
        title: Text('Despachar orden'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 60,
            child: Card(
              child: Text('Tipo producto: ${despacho.tipoProducto}'),
              elevation: 5,
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: Card(
              child: Text('Cantidad a despachar: ${despacho.cantidadUnidades}'),
              elevation: 5,
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: Card(
              child: Text('Cantidad de cajas: ${despacho.cantidadCajas}'),
              elevation: 5,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.send),
          onPressed: () {
            if (despacho.cantidadUnidades == 0) {
              return;
            }
            despachar(despacho);
            Navigator.of(context).pop();
          }),
    );
  }
}
