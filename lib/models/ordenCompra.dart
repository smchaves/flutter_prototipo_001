import 'ordenProduccion.dart';
import 'package:flutter/material.dart';

class OrdenCompra {
  final String idOrdenCompra;
  final String folioOrdenCompra;
  //final DateTime fechaIngreso;
  final int cantidadOrdenCompra;
  final String tipoProductoOrdenCompra;
  final String idClienteOrdenCompra;

  List<OrdenProduccion> ordenesProduccion = [];

  OrdenCompra({
    @required this.cantidadOrdenCompra,
    //@required this.fechaIngreso,
    @required this.folioOrdenCompra,
    @required this.idOrdenCompra,
    @required this.tipoProductoOrdenCompra,
    @required this.idClienteOrdenCompra,
  });
}
