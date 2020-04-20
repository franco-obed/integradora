<?php
  $formatos = array('.jpg', '.png' , '.doc', '.xlsx');
  if (isset($_POST['boton'])) {
  	$nombreArchivo = $_FILES['archivo']['name'];
  	$nombreTmpArchivo = $_FILES['archivo']['tmp_name'];
  	$ext = substr($nombreArchivo, strrpos($nombreArchivo, '.'));
  	if (in_array($ext, $formatos)){
  		if (move_uploaded_file($nombreTmpArchivo, "archivos/$nombreArchivo")){
  			echo "Felicidades, archivo $nombreArchivo subido exitosamente";
  			}else{
  				echo "ocurrio un Error";

  			}


  	}else{
  		echo "Lo sentimos, no se permite este archivo";

  	}
  }

?>

<!DOCTYPE html>

<html lang="es">
<head>
	<title>sube tus archivos</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="donar.css">
</head>
<body>
	<nav class="nav">
		<img src="encabezado.png" width="350" height="85">
			<ul id="menu">
				<li><a href="INDEX.html"><h3>Inicio</h3></a></li>
				<li><a href=""><h3>Usuario</h3></a></li>
				<li><a href=""><h3>Cerrar Sesion</h3></a></li>
			</ul>
		
	</nav>
	<br><br>

	<div class="cajon1">
		<form method="post" action="" enctype="multipart/form-data">
			<center><h1 id="encabezado">¿Que quieres Donar?</h1></center>
			<br>

			<div class="cajon2">

				<input class="boton1" type="file" value="EXAMINAR..." name="archivo" />
			    <br>
			    <br>
			    <input class="boton2" type="submit" value="Subir Archivo" name="boton" />
				
			</div>
			
		</form>

	</div>

</body>

</html>