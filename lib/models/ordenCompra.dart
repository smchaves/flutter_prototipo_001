import 'ordenProduccion.dart';
import 'package:flutter/material.dart';

class OrdenCompra {
  final String idOC;
  final String folio;
  //final DateTime fechaIngreso;
  final int cantidad;
  final String tipoProducto;
  final String idCliente;

  List<OrdenProduccion> ordenesProduccion = [];

  OrdenCompra({
    @required this.cantidad,
    //@required this.fechaIngreso,
    @required this.folio,
    @required this.idOC,
    @required this.tipoProducto,
    @required this.idCliente,
  });
}
