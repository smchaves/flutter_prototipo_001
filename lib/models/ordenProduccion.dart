import 'despacho.dart';
import 'enums.dart';
import 'package:flutter/material.dart';

class OrdenProduccion {
  final String id;
  int cantidad;
  List<Despacho> despachos = [];
  Estado estado;
  final String tipoProducto;
  //final DateTime fecha;
  final String cliente;
  final String idOC;

  OrdenProduccion({
    @required this.id,
    @required this.cantidad,
    //@required this.fecha,
    @required this.cliente,
    @required this.tipoProducto,
    @required this.idOC,
  });
}
