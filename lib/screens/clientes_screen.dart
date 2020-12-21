import 'package:flutter/material.dart';
import 'package:prototipo/screens/detalle_clientes_screen.dart';
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
              leading: Text(cliente.nombre),
              title: Text(cliente.direccion),
              subtitle: Text('Cantidad de OC: ${cliente.ordenesCompra.length}'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(
                  DetalleClientesScreen.routeName,
                  arguments: cliente,
                );
              },
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
