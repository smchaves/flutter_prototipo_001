import 'package:flutter/material.dart';

import '../models/ordenProduccion.dart';
import '../models/enums.dart';
import 'detallesOP_screen.dart';
import '../widgets/main_drawer.dart';
import '../widgets/chartBar.dart';
//import 'package:intl/intl.dart';

class OrdenesProduccionScreen extends StatefulWidget {
  final List<OrdenProduccion> ordenesProduccion;
  final Function _startAddOC;
  final Function remove;

  OrdenesProduccionScreen(
      this.ordenesProduccion, this._startAddOC, this.remove);

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
          widget.ordenesProduccion.isEmpty
              ? Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'No tienes órdenes de producción!',
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      ),
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
                            DetallesOrdenProduccionScreen.routeName,
                            arguments: orden,
                          ),
                          leading: Container(
                              width: 100,
                              child: ChartBar(
                                  orden.cantidadUnidades,
                                  orden.cantidadUnidades /
                                      orden.cantidadOrdenProduccion,
                                  orden.cantidadOrdenProduccion)),
                          title: Text(
                            '${orden.tipoProductoOrdenProduccion}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          subtitle: Text(
                            orden.clienteOrdenProduccion,
                            style: TextStyle(fontSize: 18),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () => widget.remove(
                                ordenesProduccionNoDespachadas, orden),
                          ),
                        ),
                      );
                    }).toList(),
                    onReorder: reorderData,
                  ),
                ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget._startAddOC(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
