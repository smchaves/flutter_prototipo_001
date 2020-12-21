# Proyecto Merida
## Acerca de la aplicación
El objetivo general de este proyecto es diseñar y prototipar un sistema de información computarizado (SIC), que permita a la empresa mantener un registro ordenado y actualizado de los datos necesarios para el cálculo del margen.
## Demo
Puedes acceder a nuestro proyecto almacenado en Github [haciendo click aquí](https://github.com/smchaves/flutter_prototipo_001).
## ¿Cómo instalar la aplicación?
Una vez descarguemos el archivo APK, lo siguiente que tendremos que hacer es instalarlo en nuestro smartphone. Antes de comenzar, deberemos habilitar el sistema para que acepte la instalación de aplicaciones que no vengan desde Google Play. Para ello, nos dirigiremos a Ajustes->Seguridad. En este submenú aparecerá una opción llamada Orígenes desconocidos, la cual tendremos que activar. Ahora nos dirigiremos a la carpeta de descargas de nuestro dispositivo y pulsaremos el archivo APK que queramos instalar. Al hacerlo, se nos aparecerá un menú que nos resume los permisos que requerirá la aplicación. Una vez aceptemos estos permisos, la aplicación se instalará y ya estará disponible en el sistema para ser utilizada.


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
-  <b>_despachar_screen.dart_</b>: Diseño de la pantalla de resumen de despacho. Permite visualizar los datos finales del despacho para su confirmación.
-  <b>_detalle_despacho_screen.dart_</b>: Diseño de la pantalla de detalle de despacho. Permite ingresar el costo total del despacho para su actualización y cambio de estado a 'Ingresado'.
-  <b>_detalle_clientes_screen.dart_</b>: Diseño de la pantalla de detalle de cliente. Permite visualizar el historial de órdenes de compra del cliente seleccionado, para revisar si están completadas o aun están activas.

### Widgets
-  <b>_add_cliente.dart_</b>: Widget que permite agregar nuevos clientes.
-  <b>_add_orden_compra.dart_</b>: Widget que permite agregar nuevas ordenes de compra.
-  <b>_chartBar.dart_</b>: Widget que muestra la barra de progreso de la OP.
-  <b>_main_drawer.dart_</b>: 


## Manual de usuario
| Imagen | Comentarios |
| ------------- | ------------- |
| ![alt Tag](https://i.ibb.co/35x6LPZ/1.png)  | Una vez instalada la app, deberías ver algo como lo que se muestra a continuación; pantalla principal de la aplicación. Aquí se despliegan las órdenes de producción vigentes. Para añadir una orden nueva hay que pulsar el botón “+”.  |
| ![alt Tag](https://i.ibb.co/SQD71dV/2.png)  | Al crear una nueva orden de producción, se despliega un menú de opciones en donde se pide seleccionar al cliente, determinar el producto y la cantidad a fabricar. Además tiene la opción de agregar el folio de la orden.  |
| ![alt Tag](https://i.ibb.co/VjgR0b1/3.png)  | Cuando se crea la OP, el sistema regresa a la página principal y muestra la nueva orden creada con su respectivo nombre de identificación y una barra de progreso que indica la cantidad de producto elaborada hasta el momento. Si se presiona la orden de producción se accede a sus detalles.  |
| ![alt Tag](https://i.ibb.co/vQXFM9g/4.png)  | La aplicación permite actualizar la cantidad de producto fabricado, para así llevar una contabilidad del total producido. Las cantidades se ingresan por número de cajas producidas.  |
| ![alt Tag](https://i.ibb.co/m5FfV16/5.png)  | En esta pantalla se crearon dos órdenes de producción más para dos clientes diferentes, y se actualizó su progreso. Se puede observar que una de ellas esta al 100% mientras que la otra solo esta listo un 80%. Abas se pueden despachar, generando así dos despachos activos, solo que la que no esta completa genera una nueva orden de producción por el saldo restante.  |
| ![alt Tag](https://i.ibb.co/NTTVgm8/6.png)  | Por el momento, la pantalla de despacho no esta terminada, por lo que este se realiza presionando el botón inferior de esta pantalla. Se realiza esta acción para las dos OP creadas anteriormente. Se ve que la que estaba al 100% se elimina completamente, mientras que la otra queda un saldo de 200 unidades.|
| ![alt Tag](https://i.ibb.co/frRdshh/7.png)  | Acá se observa lo mencionado anteriormente.  |
| ![alt Tag](https://i.ibb.co/Vq5QGFk/8.png)  | Si se navega a la pestaña despachos activos, se observan las dos órdenes de producción despachadas anteriormente. A estos despachos falta incorporar el costo respectivo, lo que se realizará en una pantalla de detalle de despacho a la que se accede presionando cada elemento de la lista.  |
| ![alt Tag](https://i.ibb.co/hypfd5r/9.png)  | La opción de “clientes” muestra el histórico de clientes que han trabajado con la empresa. Aquí es posible editar, agregar y ver la información de cada cliente.   |
| ![alt Tag](https://i.ibb.co/bQDJ6vZ/10.png)  | Al agregar un nuevo cliente se despliega un menú en donde se pide el nombre y la dirección de éste.  |
| ![alt Tag](https://i.ibb.co/3NxPkZw/11.png)  | En esta pantalla se observa el menú desplegable lateral, que se utiliza para navegar entre pantallas de la app. |


## Autores
- Sebastián Muñoz
- Lucas Oliveri

Curso: Programación Profesional, Universidad Adolfo Ibáñez
