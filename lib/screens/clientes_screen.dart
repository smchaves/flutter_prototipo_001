import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../models/clientes.dart';

class ClientesScreen extends StatefulWidget {
  static const routeName = '/clientes';
  final Function add;
  final List<Clientes> clientes;
  ClientesScreen(this.clientes, this.add);

  @override
  _ClientesScreenState createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clientes'),
      ),
      drawer: MainDrawer(),
      body: ListView(
        children: widget.clientes.map((cliente) {
          return Card(
            elevation: 5,
            child: ListTile(
              leading: Text(cliente.nombreCliente),
              title: Text(cliente.direccionCliente),
              subtitle: Text(
                  'Cantidad de OC: ${cliente.ordenesCompraDirectasCliente.length}'),
            ),
          );
        }).toList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.admin_panel_settings),
        onPressed: () => widget.add(context),
      ),
    );
  }
}
