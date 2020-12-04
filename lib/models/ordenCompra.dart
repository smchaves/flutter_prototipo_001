import 'package:prototipo/models/enums.dart';

import 'ordenProduccion.dart';
import 'package:flutter/material.dart';

class OrdenCompra {
  final String id;
  final String folio;
  //final DateTime fechaIngreso;
  final int cantidad;
  final String tipoProducto;
  final String idCliente;
  EstadoOrdenCompra estado;

  List<OrdenProduccion> ordenesProduccion = [];

  OrdenCompra({
    @required this.cantidad,
    //@required this.fechaIngreso,
    @required this.folio,
    @required this.id,
    @required this.tipoProducto,
    @required this.idCliente,
  });
}
