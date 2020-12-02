import 'package:flutter/material.dart';
import 'enums.dart';

class Despacho {
  TipoDespacho tipoDespacho;
  final DateTime fechaDespacho;
  final int cantidad;
  final String destino;
  final String idOrdenProduccion;

  Despacho({
    @required this.cantidad,
    @required this.destino,
    @required this.fechaDespacho,
    @required this.idOrdenProduccion,
  });
}
