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
        idOrdenProduccion: 'OP21',
        cantidadOrdenProduccion: 1000,
        tipoProductoOrdenProduccion: 'pechera',
        clienteOrdenProduccion: 'HTalca',
        idOCOrdenProduccion: 'C1')
  ];

  var listaClientes = [
    Clientes(
        direccionCliente: 'Norte', idCliente: 'C1', nombreCliente: 'HTalca'),
    Clientes(
        direccionCliente: 'Centro', idCliente: 'C2', nombreCliente: 'HDHHA'),
    Clientes(
        direccionCliente: 'Sur', idCliente: 'C3', nombreCliente: 'HCurico'),
  ];

  var listaContratos = [
    Contrato(
        cantidadEstimadaContrato: 10000,
        duracionContrato: 24,
        fechaInicioContrato: DateFormat.yMMMd().format(DateTime.now()),
        idContrato: 'C1Co1',
        idClienteContrato: 'C1'),
    Contrato(
        cantidadEstimadaContrato: 5000,
        duracionContrato: 12,
        fechaInicioContrato: DateFormat.yMMMd().format(DateTime.now()),
        idContrato: 'C2C01',
        idClienteContrato: 'C2'),
  ];

  void actualizar(List<Clientes> l1, List<Contrato> l2) {
    l1[0].contratosCliente.add(l2[0]);
    l1[1].contratosCliente.add(l2[1]);
  }

  void _addNewOC(
    int cantidad,
    String folio,
    String idCliente,
    String tipoProducto,
    String nombreCliente,
  ) {
    var newOC = OrdenCompra(
      cantidadOrdenCompra: cantidad,
      folioOrdenCompra: folio,
      idOrdenCompra: DateTime.now().toString(),
      idClienteOrdenCompra: idCliente,
      tipoProductoOrdenCompra: tipoProducto,
    );
    var newOP = OrdenProduccion(
      idOrdenProduccion: DateTime.now().toString(),
      cantidadOrdenProduccion: cantidad,
      tipoProductoOrdenProduccion: tipoProducto,
      clienteOrdenProduccion: nombreCliente,
      idOCOrdenProduccion: newOC.idOrdenCompra,
    );
    newOP.estadoOrdenProduccion = Estado.NoDespachada;
    newOC.ordenesProduccion.add(newOP);

    int index =
        listaClientes.indexWhere((cliente) => (cliente.idCliente == idCliente));

    listaClientes[index].ordenesCompraDirectasCliente.add(newOC);
    setState(() {
      ordenesProduccion.add(newOP);
    });
  }

  void _startAddOC(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return
              //esto no es necesario actualmente

              NewOC(_addNewOC, listaClientes);
        });
  }

  @override
  Widget build(BuildContext context) {
    actualizar(listaClientes, listaContratos);
    ordenesProduccion[0].estadoOrdenProduccion = Estado.NoDespachada;

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
