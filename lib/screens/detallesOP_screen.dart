import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/ordenProduccion.dart';
import '../widgets/main_drawer.dart';
//import 'package:firebase_core/firebase_core.dart';

class DetallesOrdenProduccionScreen extends StatefulWidget {
  final Function addCajas;
  final Function despachar;
  static const routeName = '/detalles-op';
  DetallesOrdenProduccionScreen(this.addCajas, this.despachar);
  @override
  _DetallesOrdenProduccionScreenState createState() =>
      _DetallesOrdenProduccionScreenState();
}

class _DetallesOrdenProduccionScreenState
    extends State<DetallesOrdenProduccionScreen> {
  final _cantidadCajasController = TextEditingController();
  final _cantidadUnidadesController = TextEditingController();
  void _submitDataProd(OrdenProduccion orden) {
    final enteredCantidadCajas = int.parse(_cantidadCajasController.text);
    final enteredCantidadUnidades = int.parse(_cantidadUnidadesController.text);
    widget.addCajas(orden, enteredCantidadCajas, enteredCantidadUnidades);
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    OrdenProduccion ordenSeleccionada =
        ModalRoute.of(context).settings.arguments as OrdenProduccion;
    return Scaffold(
      appBar: AppBar(
        title: Text('OP Cliente: ${ordenSeleccionada.cliente}'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            controller: _cantidadCajasController,
            decoration: InputDecoration(
              labelText: 'Cantidad Cajas',
            ),
            onSubmitted: (_) {
              return _submitDataProd(ordenSeleccionada);
            },
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _cantidadUnidadesController,
            decoration: InputDecoration(
              labelText: 'Cantidad Unidades por Caja',
            ),
            onSubmitted: (_) {
              return _submitDataProd(ordenSeleccionada);
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.despachar(ordenSeleccionada);
          FirebaseFirestore.instance
              .collection('Cliente')
              .snapshots()
              .listen((data) {
            print(data.docs[0].id);
          });
          Navigator.of(context).pop();
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
