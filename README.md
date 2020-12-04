# Proyecto Merida


## Acerca de la aplicación

El objetivo general de este proyecto es diseñar y prototipar un sistema de información computarizado (SIC), que permita a la empresa mantener un registro ordenado y actualizado de los datos necesarios para el cálculo del margen.

## Demo

Puedes acceder a nuestro proyecto almacenado en Github 
[haciendo click aquí](https://github.com/smchaves/flutter_prototipo_001).

## ¿Cómo instalar la aplicación?

Una vez descarguemos el archivo APK, lo siguiente que tendremos que hacer es instalarlo en nuestro smartphone. Antes de comenzar, deberemos habilitar el sistema para que acepte la instalación de aplicaciones que no vengan desde Google Play. Para ello, nos dirigiremos a Ajustes->Seguridad. En este submenú aparecerá una opción llamada Orígenes desconocidos, la cual tendremos que activar. Ahora nos dirigiremos a la carpeta de descargas de nuestro dispositivo y pulsaremos el archivo APK que queramos instalar. Al hacerlo, se nos aparecerá un menú que nos resume los permisos que requerirá la aplicación. Una vez aceptemos estos permisos, la aplicación se instalará y ya estará disponible en el sistema para ser utilizada.

_Una vez instalada la app, deberías ver algo como lo que se muestra a conitnuación_:

![alt Tag](https://i.ibb.co/09pMH1G/imagfinal.png)

## Requisitos mínimos de hardware
- Smartphone con Android 7.0 o superior

## Archivos dentro del proyecto

### Modelos
- <b>_clientes.dart_</b>: Se definen las variables que integran la clase cliente. 
-  <b>_contrato.dart_</b>: Se definen las variables que integran la clase contrato.
-  <b>_despacho.dart_</b>: Se definen las variables que integran la clase despachos.
-  <b>_enums.dart_</b>: Se definen distintas instancias que definen el comportamiento de las otras variables del proyecto.
-  <b>_OrdenCompra.dart_</b>: Se definen las variables que integran la clase orden de compra.
-  <b>_ordenProduccion.dart_</b>: Se definen las variables que integran la clase orden de producción.

### Diseño 
-  <b>_ordenes_produccion_screen.dart_</b>: Diseño de la pantalla principal, donde se muestran las ordenes de producción activas.
-  <b>_clientes_screen_</b>: Diseño de la página de clientes. Permite agregar nuevos clientes.
-  <b>_despachos_screen.dart_</b>: Diseño de la página de despachos. Permite visualizar los despachos activos.
-  <b>_detallesOP_screen.dart_</b>: Diseño de la pantalla de resumen de OP. Permite modificar el progreso de la OP y ejecutar su despacho.

### Widgets
-  <b>_add_cliente.dart_</b>: Widget que permite agregar nuevos clientes.
-  <b>_add_orden_compra.dart_</b>: Widget que permite agregar nuevas ordenes de compra.
-  <b>_chartBar.dart_</b>: Widget que muestra la barra de progreso de la OP.
-  <b>_main_drawer.dart_</b>: 


## Autores
- Sebastián Muñoz
- Lucas Oliveri

Curso: Programación Profesional, Universidad Adolfo Ibáñez



