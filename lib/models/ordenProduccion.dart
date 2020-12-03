import 'despacho.dart';
import 'enums.dart';
import 'package:flutter/material.dart';

class OrdenProduccion {
  final String idOrdenProduccion;
  int cantidadOrdenProduccion;
  List<Despacho> despachos = [];
  Estado estadoOrdenProduccion;
  final String tipoProductoOrdenProduccion;
  final String clienteOrdenProduccion;

  final String idOCOrdenProduccion;

  OrdenProduccion({
    @required this.idOrdenProduccion,
    @required this.cantidadOrdenProduccion,
    @required this.clienteOrdenProduccion,
    @required this.tipoProductoOrdenProduccion,
    @required this.idOCOrdenProduccion,
  });
}
