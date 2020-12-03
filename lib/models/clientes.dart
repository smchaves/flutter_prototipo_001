import 'contrato.dart';
import 'ordenCompra.dart';
import 'package:flutter/material.dart';

class Clientes {
  final String nombreCliente;
  final String direccionCliente;
  final String idCliente;
  List<Contrato> contratosCliente = [];
  List<OrdenCompra> ordenesCompraDirectasCliente = [];

  Clientes({
    @required this.nombreCliente,
    @required this.direccionCliente,
    @required this.idCliente,
  });
}
