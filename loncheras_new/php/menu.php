<?php

if (!isset($_SESSION['Id_usuario'])) {
} else {
  require_once("conexion.php");
}

if (!isset($_SESSION['Id_usuario'])) {
?>
  <div class="ui segment">
    <div class="ui inverted secondary menu">
      <div class="item img">
        <img src="img/logo-loncheras.png">
        <span>LONCHERAS</span>
      </div>
      <div class="right menu">
        <a href="index.php?mod=inicio" class="item">Inicio</a>
        <a href="index.php?mod=login" class="item">Iniciar sesion</a>
        <a href="index.php?mod=registrarUsuario" class="item">Registrarse</a>

      </div>
    </div>
  </div>
<?php
} else 
  if ($_SESSION['Rol'] == 1) {
?>
  <div class="ui segment">
    <div class="ui inverted secondary menu">
      <div class="item img">
        <img src="img/logo-loncheras.png">
        <span>LONCHERAS</span>
      </div>
      <div class="right menu">
        <a href="index.php?mod=inicio" class="item">Inicio</a>
        <a href="index.php?mod=estudiante" class="item">Estudiante</a>
        <div class="ui pointing dropdown link item">
          <span class="text">Sesion</span>
          <i class="dropdown icon"></i>
          <div class="menu">
            <a href="index.php?mod=perfil" class="item">Perfil</a>
            <a href="index.php?mod=registrarUsuario" class="item">Registrar usuario</a>
            <a href="index.php?mod=registrarEstudiante" class="item">Registrar estudiante</a>
            <a href="index.php?mod=salir" class="item">Cerrar sesion</a>
          </div>
        </div>
      </div>
    </div>
  </div>
<?php
} else
  if ($_SESSION['Rol'] == 2) {
?>
  <div class="ui segment">
    <div class="ui inverted secondary menu">
      <div class="item img">
        <img src="img/logo-loncheras.png">
        <span>LONCHERAS</span>
      </div>
      <div class="right menu">
        <a href="index.php?mod=inicio" class="item">Inicio</a>
        <div class="ui pointing dropdown link item">
          <span class="text">Sesion</span>
          <i class="dropdown icon"></i>
          <div class="menu">
            <a href="index.php?mod=perfil" class="item">Perfil</a>
            <a href="index.php?mod=salir" class="item">Cerrar sesion</a>
          </div>
        </div>
      </div>
    </div>
  </div>
<?php
} else
if ($_SESSION['Rol'] == 3) {
?>
<div class="ui segment">
  <div class="ui inverted secondary menu">
    <div class="item img">
      <img src="img/logo-loncheras.png">
      <span>LONCHERAS</span>
    </div>
    <div class="right menu">
      <a href="index.php?mod=inicio" class="item">Inicio</a>
      <div class="ui pointing dropdown link item">
        <span class="text">Sesion</span>
        <i class="dropdown icon"></i>
        <div class="menu">
          <a href="index.php?mod=perfil" class="item">Perfil</a>
          <a href="index.php?mod=registrarEstudiante" class="item">Registrar estudiante</a>
          <a href="index.php?mod=salir" class="item">Cerrar sesion</a>
        </div>
      </div>
    </div>
  </div>
</div>
<?php
} 
?> 