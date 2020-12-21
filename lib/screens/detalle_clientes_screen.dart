import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../models/clientes.dart';
import '../models/enums.dart';

class DetalleClientesScreen extends StatelessWidget {
  static const routeName = '/detalle-clientes-screen';

  String estadoOrdenCompra(EstadoOrdenCompra status) {
    if (status == EstadoOrdenCompra.Activa) {
      return 'Activa';
    } else {
      return 'Completada';
    }
  }

  @override
  Widget build(BuildContext context) {
    Clientes cliente = ModalRoute.of(context).settings.arguments as Clientes;
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial órdenes de compra'),
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            child: ListTile(
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Folio:'),
                  Text(
                    cliente.ordenesCompra[index].folio.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              title: Row(
                children: [
                  Text(
                    'Cantidad: ${cliente.ordenesCompra[index].cantidad.toString()}',
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    estadoOrdenCompra(cliente.ordenesCompra[index].estado),
                  ),
                  Container(
                    child: estadoOrdenCompra(
                                cliente.ordenesCompra[index].estado) ==
                            'Completada'
                        ? Icon(Icons.check, color: Colors.green)
                        : null,
                  )
                ],
              ),
            ),
          );
        },
        itemCount: cliente.ordenesCompra.length,
      ),
    );
  }
}
