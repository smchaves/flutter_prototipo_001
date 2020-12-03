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
  int cantidadCajas;
  int cantidadUnidades;

  final String idOCOrdenProduccion;

  OrdenProduccion({
    @required this.idOrdenProduccion,
    this.cantidadCajas = 0,
    this.cantidadUnidades = 0,
    @required this.cantidadOrdenProduccion,
    @required this.clienteOrdenProduccion,
    @required this.tipoProductoOrdenProduccion,
    @required this.idOCOrdenProduccion,
  });
}
