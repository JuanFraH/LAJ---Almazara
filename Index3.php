<?php
   
   $nombreServidor = "localhost";
   $baseDatos = "almazara";
   $nombreUsuario = "usuario";
   $password = "usuario";
   
   // Se crea la conexión
   $conn = new mysqli($nombreServidor, $nombreUsuario, $password, $baseDatos);
   
  // Se comprueba que la conexión es correcta
   
  if (!$conn) {
    
    die("Connection failed: " . mysqli_connect_error());
  }
  
  echo "Conexión correcta";
   $date_v = $_POST['date_v'];

   $NIF_socio_v = $_POST['NIF_socio_v'];

   $T_import = $_POST['T_import'];

    $sentenciaSQL = "INSERT INTO ventas VALUES(null, '" . $NIF_socio_v ."','" . $date_v ."'," . $T_import .")";
    
    echo $sentenciaSQL;
     
    if (!$conn->query($sentenciaSQL)) {
      
        echo "Falló la inserción de datos en la tabla: (" . $conn->errno . ") " . $conn->error;
    }
    
    echo "Se ha ejecutado correctamente la inserción de datos";
  
    mysqli_close($conn);
  ?>