<?php
include("conexion.php");

if (isset($_POST['btnEnviar'])) {
    $Nombres = $_POST['Nombres'];
    $Apellidos = $_POST['Apellidos'];
    $Fecha_nacimiento = $_POST['Fecha_nacimiento'];
    $Edad = $_POST['Edad'];

    $imagen = $_FILES['FotoEstudiante']["name"];

    if (isset($imagen) && $imagen != "") {
        $tipo = $_FILES['FotoEstudiante']['type'];
        $temp = $_FILES['FotoEstudiante']['tmp_name'];

        if (!(strpos($tipo, 'gif') || strpos($tipo, 'jpeg') || strpos($tipo, 'webp') || strpos($tipo, 'png'))) {
            echo "<script>alert('solo se permite archivos jpeg, png, gif, webp');</script>";
            header('index.php?mod=login');
        } else {
            $query = "INSERT INTO `estudiante`(`Nombres`, `Apellidos`, `Fecha_nacimiento`, 
            `Edad`, `FotoEstudiante`) 
            VALUES ('$Nombres','$Apellidos','$Fecha_nacimiento','$Edad',
            '$imagen');";
            $execute = mysqli_query($enlace, $query);
            if ($execute) {
                move_uploaded_file($temp, 'img/' . $imagen);
                echo "<script>alert('registro de usuario exitoso');</script>";
                if (!$_SESSION['Id_usuario']) {
                    echo "<script>window. location='index.php?mod=login';</script>";
                } else {
                    echo "<script>window. location='index.php?mod=registrarEstudiante';</script>";
                }
            } else {
                echo "error en la linea sql";
            }
        }
    }
}
