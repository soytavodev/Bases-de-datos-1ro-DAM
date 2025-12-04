<table>
<?php
  $host = "localhost";$user = "Gustavo";
  $pass = "Hakaishin2.";$db   = "futbol2526";
  $conexion = new mysqli($host, $user, $pass, $db);
  $sql = "SELECT * FROM equipos";
  $resultado = $conexion->query($sql);
  while ($fila = $resultado->fetch_assoc()) {
  	echo "<tr>";
    foreach($fila as $clave=>$valor){
    	echo "<td>".$valor."</td>";
    }
    echo "</tr>";
  }
  $conexion->close();
  
?>
</table>
