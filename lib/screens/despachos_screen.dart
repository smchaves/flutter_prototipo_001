import 'package:flutter/material.dart';
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
          return ListTile(
            leading: Text(
              despachos[index].cantidadDespacho.toString(),
            ),
            title: Text(despachos[index].destinoDespacho),
            subtitle: Column(
              children: [
                Text(despachos[index].fechaDespacho),
              ],
            ),
          );
        },
        itemCount: despachos.length,
      ),
    );
  }
}
