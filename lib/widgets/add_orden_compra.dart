import 'package:flutter/material.dart';

//import './find_client.dart';
import '../models/clientes.dart';

class NewOC extends StatefulWidget {
  final Function addOC;

  final List<Clientes> listaClientes;

  NewOC(this.addOC, this.listaClientes);

  @override
  _NewOCState createState() => _NewOCState();
}

class _NewOCState extends State<NewOC> {
  String holder = '';
  String _vista = 'Seleccione cliente';
  final _cantidadController = TextEditingController();

  final _tipoProductoController = TextEditingController();
  final _folioController = TextEditingController();

  String getDropDownItem() {
    setState(() {
      holder = _vista;
    });
    return holder;
  }

  void _submitData(String enteredIdCliente) {
    if (_cantidadController.text.isEmpty) {
      return;
    }

    final enteredCantidad = int.parse(_cantidadController.text);
    final enteredTipoProducto = _tipoProductoController.text;
    final enteredFolio = _folioController.text;
    if (enteredCantidad <= 0 ||
        enteredIdCliente.isEmpty ||
        enteredTipoProducto.isEmpty ||
        enteredFolio.isEmpty) {
      return;
    }

    widget.addOC(
      enteredCantidad,
      enteredFolio,
      enteredIdCliente,
      enteredTipoProducto,
    );

    Navigator.of(context).pop();
  }

  String findClientId(String nombre) {
    String id;
    if (nombre == 'Seleccione cliente') {
      id = 'Ingrese cliente';
    } else {
      int index = widget.listaClientes
          .indexWhere((cliente) => (cliente.nombre == nombre));
      id = widget.listaClientes[index].id;
    }

    return id;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //FindClient(widget.listaClientes),
          Container(
            width: 200,
            child: DropdownButton(
              hint: Text(_vista),
              onChanged: (_value) {
                setState(() {
                  _vista = _value;
                });
              },
              items: widget.listaClientes.map((cliente) {
                return DropdownMenuItem(
                  value: cliente.nombre,
                  child: Text(cliente.nombre),
                );
              }).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('ID Cliente:'),
              Text(findClientId(getDropDownItem())),
            ],
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _cantidadController,
            decoration: InputDecoration(
              labelText: 'Cantidad',
            ),
            onSubmitted: (_) => _submitData(findClientId(getDropDownItem())),
          ),
          TextField(
            controller: _tipoProductoController,
            decoration: InputDecoration(
              labelText: 'Tipo Producto',
            ),
            onSubmitted: (_) => _submitData(findClientId(getDropDownItem())),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _folioController,
            decoration: InputDecoration(
              labelText: 'Folio',
            ),
            onSubmitted: (_) => _submitData(findClientId(getDropDownItem())),
          ),
          RaisedButton(
            onPressed: () => _submitData(findClientId(getDropDownItem())),
            child: Text('Add OC'),
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button.color,
          )
        ],
      ),
    );
  }
}
