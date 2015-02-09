<!doctype html>

<html lang="en">
<head>
  <meta charset="utf-8">

  <title>The HTML5 Herald</title>
  <meta name="description" content="The HTML5 Herald">
  <meta name="author" content="SitePoint"> 

  <!--[if lt IE 9]>
  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
</head>

<body>





<h1>Cómo: Habilitar la configuración de seguridad de Internet Explorer para la ejecución administrada</h1>


<i>Actualización: noviembre 2007</i>

<p>Puesto que Microsoft Internet Explorer puede actuar como host de controles y componentes administrados, su configuración de seguridad puede afectar a la ejecución administrada. Un control administrado puede no ejecutarse en Internet Explorer a menos que estén activados los controles ActiveX y las secuencias de comandos.
Para habilitar la configuración de seguridad de Internet Explorer</p>

<ol>
	<li>En Internet Explorer, en el menú Herramientas, haga clic en Opciones de Internet.</li>
	<li>Haga clic en la ficha Seguridad. En esta ficha puede tener acceso a la configuración de las zonas de Internet, intranet local, sitios de confianza y sitios restringidos.</li>
	<li>Seleccione la zona en que se origina el control administrado y haga clic en el botón Nivel personalizado. Las casillas Ejecutar controles ActiveX y complementos y Escribir secuencias de comandos para controles ActiveX marcados como seguros para secuencias de comandos deben estar activadas para que se ejecuten los controles ActiveX administrados.</li>
</ol>

</body>
</html>