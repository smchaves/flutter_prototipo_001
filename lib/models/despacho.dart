import 'package:flutter/material.dart';
import 'enums.dart';

class Despacho {
  TipoDespacho tipoDespacho;
  final String fechaDespacho;
  final int cantidadDespacho;
  final String destinoDespacho;
  final String idOrdenProduccion;
  EstadoDespacho estadoDespacho;
  final String nombreCliente;
  int costoTotal;

  Despacho({
    @required this.cantidadDespacho,
    @required this.destinoDespacho,
    @required this.fechaDespacho,
    @required this.idOrdenProduccion,
    @required this.nombreCliente,
    this.costoTotal = 0,
    this.estadoDespacho = EstadoDespacho.NoIngresado,
  });
}
