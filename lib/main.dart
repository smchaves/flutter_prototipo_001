import 'package:flutter/material.dart';
import 'package:prototipo/models/enums.dart';
import './screens/ordenes_produccion_screen.dart';
import './screens/produccion_screen.dart';
import './models/ordenCompra.dart';
import './widgets/add_orden_compra.dart';

import './models/clientes.dart';
import './models/contrato.dart';
import 'package:intl/intl.dart';
import './models/ordenProduccion.dart';
import './screens/detallesOP.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<OrdenProduccion> ordenesProduccion = [
    OrdenProduccion(
        id: 'OP21',
        cantidad: 1000,
        cliente: 'C1',
        tipoProducto: 'pechera',
        idOC: '14')
  ];

  var listaClientes = [
    Clientes(direccion: 'Norte', id: 'C1', nombre: 'HTalca'),
    Clientes(direccion: 'Centro', id: 'C2', nombre: 'HDHHA'),
    Clientes(direccion: 'Centro', id: 'C3', nombre: 'HCurico'),
  ];

  var listaContratos = [
    Contrato(
        cantidadEstimada: 10000,
        duracion: 24,
        fecha: DateFormat.yMMMd().format(DateTime.now()),
        id: 'C1Co1',
        idCliente: 'C1'),
    Contrato(
        cantidadEstimada: 5000,
        duracion: 12,
        fecha: DateFormat.yMMMd().format(DateTime.now()),
        id: 'C2C01',
        idCliente: 'C2'),
  ];

  void actualizar(List<Clientes> l1, List<Contrato> l2) {
    l1[0].contratos.add(l2[0]);
    l1[1].contratos.add(l2[1]);
  }

  void _addNewOC(
    int cantidad,
    String folio,
    String idCliente,
    String tipoProducto,
  ) {
    var newOC = OrdenCompra(
      cantidad: cantidad,
      folio: folio,
      idOC: DateTime.now().toString(),
      idCliente: idCliente,
      tipoProducto: tipoProducto,
    );
    var newOP = OrdenProduccion(
      id: DateTime.now().toString(),
      cantidad: cantidad,
      cliente: idCliente,
      tipoProducto: tipoProducto,
      idOC: newOC.idOC,
    );
    newOP.estado = Estado.NoDespachada;
    newOC.ordenesProduccion.add(newOP);

    int index =
        listaClientes.indexWhere((cliente) => (cliente.id == idCliente));

    listaClientes[index].ordenesCompraDirectas.add(newOC);
    setState(() {
      ordenesProduccion.add(newOP);
    });
  }

  void _startAddOC(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return Container(
          //esto no es necesario actualmente

          child: NewOC(_addNewOC, listaClientes),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    actualizar(listaClientes, listaContratos);
    ordenesProduccion[0].estado = Estado.NoDespachada;

    return MaterialApp(
      title: 'Merida',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.amber[100],
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => OrdenesProduccionScreen(ordenesProduccion, _startAddOC),
        Despacho.routeName: (ctx) => Despacho(),
        ProduccionScreen.routeName: (ctx) => ProduccionScreen(),
      },
    );
  }
}
