import 'package:flutter/material.dart';

class AddClient extends StatefulWidget {
  final Function addClient;

  AddClient(this.addClient);

  @override
  _AddClientState createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  final direccionController = TextEditingController();
  final nombreController = TextEditingController();

  void _submitDataClient() {
    final enteredDireccion = direccionController.text;
    final enteredNombre = nombreController.text;
    if (enteredNombre.isEmpty || enteredDireccion.isEmpty) {
      return;
    }

    widget.addClient(enteredNombre, enteredDireccion);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //FindClient(widget.listaClientes),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre Cliente',
                ),
                onSubmitted: (_) => _submitDataClient(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: direccionController,
                decoration: InputDecoration(
                  labelText: 'Direccion Cliente',
                ),
                onSubmitted: (_) => _submitDataClient(),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: RaisedButton(
                onPressed: () => _submitDataClient(),
                child: Text('Add Client'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
