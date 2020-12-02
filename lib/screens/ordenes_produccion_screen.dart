import 'package:flutter/material.dart';
import 'package:prototipo/screens/produccion_screen.dart';
import '../models/ordenProduccion.dart';
import '../models/enums.dart';
import './detallesOP.dart';
import '../widgets/main_drawer.dart';
//import 'package:intl/intl.dart';

class OrdenesProduccionScreen extends StatelessWidget {
  final List<OrdenProduccion> ordenesProduccion;
  final Function _startAddOC;

  OrdenesProduccionScreen(this.ordenesProduccion, this._startAddOC);

  @override
  Widget build(BuildContext context) {
    List<OrdenProduccion> ordenesProduccionNoDespachadas = ordenesProduccion
        .where((orden) => orden.estado == Estado.NoDespachada)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Órdenes de producción.',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          ordenesProduccionNoDespachadas.isEmpty
              ? Column(
                  children: [
                    Text(
                      'No tienes órdenes de producción!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 200,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                )
              : Container(
                  height: 500,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 5,
                        ),
                        child: ListTile(
                          onTap: () => Navigator.of(context).pushNamed(
                            Despacho.routeName,
                            arguments: ordenesProduccionNoDespachadas[index],
                          ),
                          leading: CircleAvatar(
                            radius: 30,
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: FittedBox(
                                child: Text(
                                    '\$${ordenesProduccionNoDespachadas[index].cantidad}'),
                              ),
                            ),
                          ),
                          title: Text(
                            '${ordenesProduccionNoDespachadas[index].tipoProducto} - ${ordenesProduccionNoDespachadas[index].idOC}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          subtitle: Text(
                            ordenesProduccionNoDespachadas[index].cliente,
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () => null,
                          ),
                        ),
                      );
                    },
                    itemCount: ordenesProduccionNoDespachadas.length,
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                child: Icon(Icons.add),
                color: Theme.of(context).primaryColorDark,
                onPressed: () => _startAddOC(context),
              ),
              RaisedButton(
                child: Text('Producción'),
                color: Theme.of(context).primaryColorDark,
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed(ProduccionScreen.routeName),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
