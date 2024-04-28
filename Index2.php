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

   $date = $_POST['date_e'];

   $kg = $_POST['Kg_aceituna_e'];

   $as = $_POST['as'];

   $P_S = $_POST['P_SIGPAC'];

   $R_S = $_POST['R_SIGPAC'];

   $NIF_s = $_POST['NIF_socio_e'];

    $sentenciaSQL = "INSERT INTO entregas VALUES(null, " . $date. "," . $kg .",'" . $as ."','" . $P_S ."','" . $R_S ."','" . $NIF_s . "')";
    
    echo $sentenciaSQL;
     
    if (!$conn->query($sentenciaSQL)) {
      
        echo "Falló la inserción de datos en la tabla: (" . $conn->errno . ") " . $conn->error;
    }
    
    echo "Se ha ejecutado correctamente la inserción de datos";
  
  ?>
