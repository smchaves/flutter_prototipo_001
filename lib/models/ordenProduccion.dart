import 'despacho.dart';
import 'enums.dart';
import 'package:flutter/material.dart';

class OrdenProduccion {
  final String id;
  int cantidad;
  List<Despacho> despachos = [];
  Estado estado;
  final String tipoProducto;
  final String cliente;
  int cantidadCajas;
  int cantidadUnidades;

  final String idOC;

  OrdenProduccion({
    @required this.id,
    this.cantidadCajas = 0,
    this.cantidadUnidades = 0,
    @required this.cantidad,
    @required this.cliente,
    @required this.tipoProducto,
    @required this.idOC,
  });
}
