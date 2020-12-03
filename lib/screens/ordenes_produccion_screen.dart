import 'package:flutter/material.dart';

import '../models/ordenProduccion.dart';
import '../models/enums.dart';
import './detallesOP.dart';
import '../widgets/main_drawer.dart';
import '../widgets/chartBar.dart';
//import 'package:intl/intl.dart';

class OrdenesProduccionScreen extends StatefulWidget {
  final List<OrdenProduccion> ordenesProduccion;
  final Function _startAddOC;

  OrdenesProduccionScreen(this.ordenesProduccion, this._startAddOC);

  @override
  _OrdenesProduccionScreenState createState() =>
      _OrdenesProduccionScreenState();
}

class _OrdenesProduccionScreenState extends State<OrdenesProduccionScreen> {
  void reorderData(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final items = widget.ordenesProduccion.removeAt(oldIndex);
      widget.ordenesProduccion.insert(newIndex, items);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<OrdenProduccion> ordenesProduccionNoDespachadas = widget
        .ordenesProduccion
        .where((orden) => orden.estadoOrdenProduccion == Estado.NoDespachada)
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
                  child: ReorderableListView(
                    children: ordenesProduccionNoDespachadas.map((orden) {
                      return Card(
                        elevation: 5,
                        key: Key(orden.idOrdenProduccion),
                        margin: EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 5,
                        ),
                        child: ListTile(
                          onTap: () => Navigator.of(context).pushNamed(
                            Despacho.routeName,
                            arguments: orden,
                          ),
                          leading: Container(
                              width: 100,
                              child: ChartBar(
                                  orden.cantidadUnidades,
                                  orden.cantidadUnidades /
                                      orden.cantidadOrdenProduccion)),
                          title: Text(
                            '${orden.tipoProductoOrdenProduccion} - ${orden.cantidadUnidades} unidades terminadas',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          subtitle: Text(
                            orden.clienteOrdenProduccion,
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () => null,
                          ),
                        ),
                      );
                    }).toList(),
                    onReorder: reorderData,
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                child: Icon(Icons.add),
                color: Theme.of(context).primaryColorDark,
                onPressed: () => widget._startAddOC(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
