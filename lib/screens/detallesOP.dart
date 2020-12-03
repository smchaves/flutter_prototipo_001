import 'package:flutter/material.dart';
import '../models/ordenProduccion.dart';
import '../widgets/main_drawer.dart';

class Despacho extends StatefulWidget {
  final Function addCajas;
  static const routeName = '/despachos';
  Despacho(this.addCajas);
  @override
  _DespachoState createState() => _DespachoState();
}

class _DespachoState extends State<Despacho> {
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
        title: Text('OP Cliente: ${ordenSeleccionada.clienteOrdenProduccion}'),
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
    );
  }
}
