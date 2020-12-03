import 'ordenCompra.dart';
import 'package:flutter/material.dart';

class Contrato {
  final String idContrato;
  final String fechaInicioContrato;
  final int cantidadEstimadaContrato;
  final int duracionContrato;
  final String idClienteContrato;
  List<OrdenCompra> ordenesCompraContrato = [];

  Contrato({
    @required this.cantidadEstimadaContrato,
    @required this.duracionContrato,
    @required this.fechaInicioContrato,
    @required this.idContrato,
    @required this.idClienteContrato,
  });
}
