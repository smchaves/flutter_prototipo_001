//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prototipo/screens/despachos_screen.dart';
//import '../models/ordenProduccion.dart';
import '../widgets/main_drawer.dart';
//import './despachar_screen.dart';
import '../models/despacho.dart';
//import 'package:firebase_core/firebase_core.dart';

class DetallesDespachoScreen extends StatefulWidget {
  final Function ingresarCosto;

  static const routeName = '/detalles-despacho';
  DetallesDespachoScreen(this.ingresarCosto);
  @override
  _DetallesDespachoScreenState createState() => _DetallesDespachoScreenState();
}

class _DetallesDespachoScreenState extends State<DetallesDespachoScreen> {
  final _costoController = TextEditingController();

  void _submitDataDes(Despacho despacho) {
    final enteredCostoCajas = int.parse(_costoController.text);

    widget.ingresarCosto(despacho, enteredCostoCajas);
    Navigator.of(context).pushReplacementNamed(DespachosScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    Despacho despachoSeleccionado =
        ModalRoute.of(context).settings.arguments as Despacho;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cliente: ${despachoSeleccionado.nombreCliente}'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            controller: _costoController,
            decoration: InputDecoration(
              labelText: 'Costo total',
            ),
            onSubmitted: (_) {
              return _submitDataDes(despachoSeleccionado);
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _submitDataDes(despachoSeleccionado);
        },
        child: Icon(Icons.traffic_rounded),
      ),
    );
  }
}
