import 'package:flutter/material.dart';
import './screens/despachos_screen.dart';
import './models/enums.dart';
import './screens/clientes_screen.dart';
import './widgets/add_cliente.dart';
import './screens/ordenes_produccion_screen.dart';
import './models/ordenCompra.dart';
import './widgets/add_orden_compra.dart';
import './models/despacho.dart';
import './models/clientes.dart';
import './models/contrato.dart';
import 'package:intl/intl.dart';
import './models/ordenProduccion.dart';
import './screens/detallesOP_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<OrdenProduccion> ordenesProduccion = [];

  var listaClientes = [
    Clientes(direccion: 'Los Acacios 1997', id: 'C1', nombre: 'HTalca'),
    Clientes(direccion: 'Av. Alvarez 1802', id: 'C2', nombre: 'HDHHA'),
    Clientes(direccion: 'Calle Uno 2345', id: 'C3', nombre: 'HCurico'),
  ];

  List<Despacho> despachosNoIngresados = [];

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
    l1[0].contratos.add(l2[0]);
    l1[1].contratos.add(l2[1]);
  }

  void _addNewOC(
    int cantidad,
    String folio,
    String idCliente,
    String tipoProducto,
    String nombreCliente,
  ) {
    var newOC = OrdenCompra(
      cantidad: cantidad,
      folio: folio,
      id: DateTime.now().toString(),
      idCliente: idCliente,
      tipoProducto: tipoProducto,
    );
    var newOP = OrdenProduccion(
      id: DateTime.now().toString(),
      cantidad: cantidad,
      tipoProducto: tipoProducto,
      cliente: nombreCliente,
      idOC: newOC.id,
    );
    newOP.estado = Estado.NoDespachada;
    newOC.ordenesProduccion.add(newOP);
    newOC.estado = EstadoOrdenCompra.Activa;

    int index =
        listaClientes.indexWhere((cliente) => (cliente.id == idCliente));

    listaClientes[index].ordenesCompra.add(newOC);
    setState(() {
      ordenesProduccion.add(newOP);
    });
  }

  void _startAddOC(BuildContext ctx) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        isScrollControlled: true,
        context: ctx,
        builder: (bCtx) {
          return
              //esto no es necesario actualmente

              NewOC(_addNewOC, listaClientes);
        });
  }

  void _addNewClient(
    String nombre,
    String direccion,
  ) {
    var newClient = Clientes(
      direccion: direccion,
      nombre: nombre,
      id: DateTime.now().toString(),
    );

    setState(() {
      listaClientes.add(newClient);
    });
  }

  void _startAddClient(BuildContext ctx) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
          ),
        ),
        isScrollControlled: true,
        context: ctx,
        builder: (bCtx) {
          return
              //esto no es necesario actualmente

              AddClient(_addNewClient);
        });
  }

  void addCajas(
      OrdenProduccion ordenProd, int cantidadCajas, int cantidadUnidades) {
    setState(() {
      ordenProd.cantidadCajas += cantidadCajas;
      ordenProd.cantidadUnidades =
          ordenProd.cantidadUnidades + cantidadCajas * cantidadUnidades;
    });
  }

  void despachar(OrdenProduccion ordenProduccion) {
    if (ordenProduccion.cantidad != ordenProduccion.cantidadUnidades) {
      Clientes clienteOrden = listaClientes
          .firstWhere((cliente) => ordenProduccion.cliente == cliente.nombre);

      OrdenCompra ordenCompra = clienteOrden.ordenesCompra
          .firstWhere((ordenCom) => ordenCom.id == ordenProduccion.idOC);
      print(ordenCompra.tipoProducto);
      setState(() {
        ordenProduccion.estado = Estado.Despachada;

        var newOP = OrdenProduccion(
          id: DateTime.now().toString(),
          cantidad: ordenProduccion.cantidad - ordenProduccion.cantidadUnidades,
          tipoProducto: ordenProduccion.tipoProducto,
          cliente: ordenProduccion.cliente,
          idOC: ordenProduccion.idOC,
        );
        newOP.estado = Estado.NoDespachada;

        ordenCompra.ordenesProduccion.add(newOP);
        ordenesProduccion.add(newOP);
        ordenesProduccion.remove(ordenProduccion);

        var nuevoDespacho = Despacho(
            cantidadDespacho: ordenProduccion.cantidadUnidades,
            destinoDespacho: clienteOrden.direccion,
            fechaDespacho: DateFormat.yMd().format(DateTime.now()),
            idOrdenProduccion: ordenProduccion.id,
            nombreCliente: clienteOrden.nombre);
        nuevoDespacho.estadoDespacho = EstadoDespacho.NoIngresado;
        ordenProduccion.despachos.add(nuevoDespacho);
        despachosNoIngresados.add(nuevoDespacho);
      });
      return;
    } else if (ordenProduccion.cantidad == ordenProduccion.cantidadUnidades) {
      Clientes clienteOrden = listaClientes
          .firstWhere((cliente) => ordenProduccion.cliente == cliente.nombre);

      OrdenCompra ordenCompra = clienteOrden.ordenesCompra
          .firstWhere((ordenCom) => ordenCom.id == ordenProduccion.idOC);
      print(ordenCompra.tipoProducto);
      setState(() {
        ordenProduccion.estado = Estado.Despachada;
        ordenCompra.estado = EstadoOrdenCompra.Completada;

        ordenesProduccion.remove(ordenProduccion);

        var nuevoDespacho = Despacho(
            cantidadDespacho: ordenProduccion.cantidadUnidades,
            destinoDespacho: clienteOrden.direccion,
            fechaDespacho: DateFormat.yMd().format(DateTime.now()),
            idOrdenProduccion: ordenProduccion.id,
            nombreCliente: clienteOrden.nombre);
        nuevoDespacho.estadoDespacho = EstadoDespacho.NoIngresado;
        ordenProduccion.despachos.add(nuevoDespacho);
        despachosNoIngresados.add(nuevoDespacho);
      });
      return;
    }
    return;
  }

  void removeOrdenProduccion(List<OrdenProduccion> listaOrdenesProduccion,
      OrdenProduccion ordenProduccion) {
    int index = listaOrdenesProduccion
        .indexWhere((item) => item.id == ordenProduccion.id);
    int index2 = listaClientes
        .indexWhere((item) => item.nombre == ordenProduccion.cliente);
    int index3 = listaClientes[index2]
        .ordenesCompra
        .indexWhere((item) => item.id == ordenProduccion.idOC);
    setState(() {
      ordenesProduccion.removeAt(index);
      listaClientes[index2].ordenesCompra.removeAt(index3);
    });
  }

  @override
  Widget build(BuildContext context) {
    actualizar(listaClientes, listaContratos);
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
        future: _initialization,
        builder: (context, appSnapshot) {
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
              '/': (ctx) => OrdenesProduccionScreen(
                  ordenesProduccion, _startAddOC, removeOrdenProduccion),
              DetallesOrdenProduccionScreen.routeName: (ctx) =>
                  DetallesOrdenProduccionScreen(addCajas, despachar),
              ClientesScreen.routeName: (ctx) =>
                  ClientesScreen(listaClientes, _startAddClient),
              DespachosScreen.routeName: (ctx) =>
                  DespachosScreen(despachosNoIngresados),
            },
          );
        });
  }
}
