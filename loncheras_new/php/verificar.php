<?php
include("conexion.php");

if (isset($_POST['btnIniciar'])) {
    $Usuario = $_POST['Usuario'];
    $Clave = $_POST['Clave'];
    $pass_encripta = md5($Clave);

    $consulta = mysqli_query($enlace, "SELECT * FROM usuario WHERE Usuario='$Usuario' AND Clave='$pass_encripta'")
        or die($enlace . "problemas en la consulta ");

    $resultado = $consulta->num_rows;
    if ($resultado != 0) {
        while ($fila = mysqli_fetch_array($consulta)) {
            $_SESSION['Id_usuario'] = $fila['Id_usuario'];
            $_SESSION['Usuario'] = $fila['Usuario'];
            $_SESSION['Clave'] = $fila['Clave'];
            $_SESSION['Rol'] = $fila['Rol'];
            $_SESSION['FotoUsuario'] = $fila['FotoUsuario'];
        }
        echo "<script>window.location='index.php?mod=inicio';</script>";
    } else {
        echo "<script>alert('El usuario o la contraseña son incorrectos');</script>";
        echo "<script>window.location='index.php?mod=login';</script>";
    }
}
