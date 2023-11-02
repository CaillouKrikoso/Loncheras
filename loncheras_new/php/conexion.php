<?php
$servidor = 'localhost';
$usuario = 'root';
$clave = '';
$BaseDeDatos = 'Loncheras';

$enlace = mysqli_connect($servidor, $usuario, $clave, $BaseDeDatos);
if (!$enlace) {
  die("conexion fallida: " . mysqli_connect_error());
}
