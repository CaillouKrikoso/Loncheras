<?php
include("conexion.php");

if (isset($_POST['btnEnviar'])) {
  $Usuario = $_POST['Usuario'];
  $Clave = $_POST['Clave'];
  $rol = $_POST['Rol'];
  $pass_encripta = md5($Clave);

  $imagen = $_FILES['FotoUsuario']["name"];

  if (isset($imagen) && $imagen != "") {
    $tipo = $_FILES['FotoUsuario']['type'];
    $temp = $_FILES['FotoUsuario']['tmp_name'];

    if (!(strpos($tipo, 'gif') || strpos($tipo, 'jpeg') || strpos($tipo, 'webp') || strpos($tipo, 'png'))) {
      echo "<script>alert('solo se permite archivos jpeg, png, gif, webp');</script>";
      header('index.php?mod=login');
    } else {
      $query = "INSERT INTO `usuario`(`Id_usuario`, `Usuario`, `Clave`, `FotoUsuario`, `Rol`) 
      VALUES (NULL,'$Usuario','$pass_encripta','$imagen','$rol');";
      $execute = mysqli_query($enlace, $query);
      if ($execute) {
        move_uploaded_file($temp, 'img/' . $imagen);
        echo "<script>alert('registro de usuario exitoso');</script>";
        if (!$_SESSION['Id_usuario']) {
          echo "<script>window. location='index.php?mod=login';</script>";
        } else {
          echo "<script>window. location='index.php?mod=registrarUsuario';</script>";
        }
      } else {
        echo "error en la linea sql";
      }
    }
  }
}
