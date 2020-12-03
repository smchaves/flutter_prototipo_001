import 'package:flutter/material.dart';
import 'enums.dart';

class Despacho {
  TipoDespacho tipoDespacho;
  final String fechaDespacho;
  final int cantidadDespacho;
  final String destinoDespacho;
  final String idOrdenProduccionDespacho;
  EstadoDespacho estadoDespacho;

  Despacho({
    @required this.cantidadDespacho,
    @required this.destinoDespacho,
    @required this.fechaDespacho,
    @required this.idOrdenProduccionDespacho,
  });
}
