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

   $NIF = $_POST['NIF'];

   $Nombre = $_POST['Nombre'];

   $apellido1 = $_POST['apellido1'];

   $apellido2 = $_POST['apellido2'];

   $direccion = $_POST['direccion'];

   $cod_postal = $_POST['cod_postal'];

   $provincia = $_POST['provincia'];

   $municipio = $_POST['municipio'];

   $Telf = $_POST['Telf'];

   $Correo_electronico = $_POST['Correo_electronico'];

    $sentenciaSQL = "INSERT INTO socio VALUES('". $NIF ."','" . $Nombre ."','" . $apellido1 ."','" . $apellido2 ."','" . $direccion . "','" . $cod_postal . "','" . $provincia . "','" . $municipio . "','" . $Telf . "','" . $Correo_electronico . "')";
    
    echo $sentenciaSQL;
     
    if (!$conn->query($sentenciaSQL)) {
      
        echo "Falló la inserción de datos en la tabla: (" . $conn->errno . ") " . $conn->error;
    }
    
    echo "Se ha ejecutado correctamente la inserción de datos";
  
    mysqli_close($conn);
  ?>