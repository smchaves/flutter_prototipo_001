import 'package:flutter/material.dart';
import 'enums.dart';

class Despacho {
  TipoDespacho tipoDespacho;
  final DateTime fechaDespacho;
  final int cantidadDespacho;
  final String destinoDespacho;
  final String idOrdenProduccionDespacho;

  Despacho({
    @required this.cantidadDespacho,
    @required this.destinoDespacho,
    @required this.fechaDespacho,
    @required this.idOrdenProduccionDespacho,
  });
}
