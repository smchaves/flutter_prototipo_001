import 'ordenCompra.dart';
import 'package:flutter/material.dart';

class Contrato {
  final String id;
  final String fecha;
  final int cantidadEstimada;
  final int duracion;
  final String idCliente;
  List<OrdenCompra> ordenesCompraContrato = [];

  Contrato({
    @required this.cantidadEstimada,
    @required this.duracion,
    @required this.fecha,
    @required this.id,
    @required this.idCliente,
  });
}
