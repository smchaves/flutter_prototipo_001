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
    Clientes(
        direccionCliente: 'Los Acacios 1997',
        idCliente: 'C1',
        nombreCliente: 'HTalca'),
    Clientes(
        direccionCliente: 'Av. Alvarez 1802',
        idCliente: 'C2',
        nombreCliente: 'HDHHA'),
    Clientes(
        direccionCliente: 'Calle Uno 2345',
        idCliente: 'C3',
        nombreCliente: 'HCurico'),
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
    newOC.estadoOrdenCompra = EstadoOrdenCompra.Activa;

    int index =
        listaClientes.indexWhere((cliente) => (cliente.idCliente == idCliente));

    listaClientes[index].ordenesCompraDirectasCliente.add(newOC);
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
      direccionCliente: direccion,
      nombreCliente: nombre,
      idCliente: DateTime.now().toString(),
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
    if (ordenProduccion.cantidadOrdenProduccion !=
        ordenProduccion.cantidadUnidades) {
      Clientes clienteOrden = listaClientes.firstWhere((cliente) =>
          ordenProduccion.clienteOrdenProduccion == cliente.nombreCliente);

      OrdenCompra ordenCompra = clienteOrden.ordenesCompraDirectasCliente
          .firstWhere((ordenCom) =>
              ordenCom.idOrdenCompra == ordenProduccion.idOCOrdenProduccion);
      print(ordenCompra.tipoProductoOrdenCompra);
      setState(() {
        ordenProduccion.estadoOrdenProduccion = Estado.Despachada;

        var newOP = OrdenProduccion(
          idOrdenProduccion: DateTime.now().toString(),
          cantidadOrdenProduccion: ordenProduccion.cantidadOrdenProduccion -
              ordenProduccion.cantidadUnidades,
          tipoProductoOrdenProduccion:
              ordenProduccion.tipoProductoOrdenProduccion,
          clienteOrdenProduccion: ordenProduccion.clienteOrdenProduccion,
          idOCOrdenProduccion: ordenProduccion.idOCOrdenProduccion,
        );
        newOP.estadoOrdenProduccion = Estado.NoDespachada;

        ordenCompra.ordenesProduccion.add(newOP);
        ordenesProduccion.add(newOP);
        ordenesProduccion.remove(ordenProduccion);

        var nuevoDespacho = Despacho(
            cantidadDespacho: ordenProduccion.cantidadUnidades,
            destinoDespacho: clienteOrden.direccionCliente,
            fechaDespacho: DateFormat.yMd().format(DateTime.now()),
            idOrdenProduccionDespacho: ordenProduccion.idOrdenProduccion,
            nombreCliente: clienteOrden.nombreCliente);
        nuevoDespacho.estadoDespacho = EstadoDespacho.NoIngresado;
        ordenProduccion.despachos.add(nuevoDespacho);
        despachosNoIngresados.add(nuevoDespacho);
      });
      return;
    } else if (ordenProduccion.cantidadOrdenProduccion ==
        ordenProduccion.cantidadUnidades) {
      Clientes clienteOrden = listaClientes.firstWhere((cliente) =>
          ordenProduccion.clienteOrdenProduccion == cliente.nombreCliente);

      OrdenCompra ordenCompra = clienteOrden.ordenesCompraDirectasCliente
          .firstWhere((ordenCom) =>
              ordenCom.idOrdenCompra == ordenProduccion.idOCOrdenProduccion);
      print(ordenCompra.tipoProductoOrdenCompra);
      setState(() {
        ordenProduccion.estadoOrdenProduccion = Estado.Despachada;
        ordenCompra.estadoOrdenCompra = EstadoOrdenCompra.Completada;

        ordenesProduccion.remove(ordenProduccion);

        var nuevoDespacho = Despacho(
            cantidadDespacho: ordenProduccion.cantidadUnidades,
            destinoDespacho: clienteOrden.direccionCliente,
            fechaDespacho: DateFormat.yMd().format(DateTime.now()),
            idOrdenProduccionDespacho: ordenProduccion.idOrdenProduccion,
            nombreCliente: clienteOrden.nombreCliente);
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
    int index = listaOrdenesProduccion.indexWhere(
        (item) => item.idOrdenProduccion == ordenProduccion.idOrdenProduccion);
    int index2 = listaClientes.indexWhere(
        (item) => item.nombreCliente == ordenProduccion.clienteOrdenProduccion);
    int index3 = listaClientes[index2].ordenesCompraDirectasCliente.indexWhere(
        (item) => item.idOrdenCompra == ordenProduccion.idOCOrdenProduccion);
    setState(() {
      ordenesProduccion.removeAt(index);
      listaClientes[index2].ordenesCompraDirectasCliente.removeAt(index3);
    });
  }

  @override
  Widget build(BuildContext context) {
    actualizar(listaClientes, listaContratos);

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
  }
}
