import 'package:flutter/material.dart';
import 'package:prototipo/models/enums.dart';
import 'package:prototipo/screens/detalle_despacho_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/despacho.dart';

class DespachosScreen extends StatelessWidget {
  static const routeName = '/despachos-screen';
  final List<Despacho> despachos;
  DespachosScreen(this.despachos);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despachos activos'),
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            child: ListTile(
              leading: Text(
                despachos[index].cantidadDespacho.toString(),
              ),
              title: Row(
                children: [
                  Text(despachos[index].nombreCliente),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      Text(despachos[index].destinoDespacho),
                      despachos[index].estadoDespacho ==
                              EstadoDespacho.Ingresado
                          ? Text(
                              'Ingresado',
                              style: TextStyle(color: Colors.green),
                            )
                          : Text(
                              'No Ingresado',
                              style: TextStyle(color: Colors.red),
                            ),
                    ],
                  ),
                ],
              ),
              subtitle: Text(despachos[index].fechaDespacho),
              onTap: () {
                Navigator.of(context).pushNamed(
                    DetallesDespachoScreen.routeName,
                    arguments: despachos[index]);
              },
            ),
          );
        },
        itemCount: despachos.length,
      ),
    );
  }
}
