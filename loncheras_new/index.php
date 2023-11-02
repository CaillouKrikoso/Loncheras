<?php
session_start();
?>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/semantic.css">
  <link rel="stylesheet" href="css/estilo1.css">
  <script src="js/jquery-3.1.1.min.js"></script>
  <script src="js/semantic.js"></script>
  <title>Loncheras</title>
</head>

<body>

  <?php
  require_once("php/menu.php");
  ?>

  <div class="modulos">
    <?php
    if (@$_GET['mod'] == "") {
      require_once("modules/inicio.php");
    } else
      if (@$_GET['mod'] == "inicio") {
      require_once("modules/inicio.php");
    } else
      if (@$_GET['mod'] == "estudiante") {
      require_once("modules/estudiante.php");
    } else
      if (@$_GET['mod'] == "login") {
      require_once("modules/login.php");
    } else
      if (@$_GET['mod'] == "perfil") {
      require_once("modules/perfil.php");
    } else
      if (@$_GET['mod'] == "registrarUsuario") {
      require_once("modules/registrarUsuario.php");
    } else
      if (@$_GET['mod'] == "registrarEstudiante") {
      require_once("modules/registrarEstudiante.php");
    } else
      if (@$_GET['mod'] == "salir") {
      require_once("php/salir.php");
    } else
      if (@$_GET['mod'] == "registrarse") {
      require_once("php/registrarse.php");
    } else
      if (@$_GET['mod'] == "registrarEstu") {
      require_once("php/registrarEstu.php");
    } else
      if (@$_GET['mod'] == "verificar") {
      require_once("php/verificar.php");
    }


    ?>
  </div>
  <script>
    $('.ui.dropdown').dropdown();
    $('#realizarPedido').click(function() {
      $('#modalInfoPago').modal('show');
    })
  </script>
  <script src="js/vistaPreliminar.js"></script>
</body>

</html>