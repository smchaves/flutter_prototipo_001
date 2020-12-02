import 'contrato.dart';
import 'ordenCompra.dart';
import 'package:flutter/material.dart';

class Clientes {
  final String nombre;
  final String direccion;
  final String id;
  List<Contrato> contratos = [];
  List<OrdenCompra> ordenesCompraDirectas = [];

  Clientes({
    @required this.nombre,
    @required this.direccion,
    @required this.id,
  });
}
