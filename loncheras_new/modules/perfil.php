<?php
require_once("php/conexion.php");
$resultadoUsuario = mysqli_query($enlace, "SELECT * FROM usuario ");
if (!isset($_SESSION['Id_usuario'])) {
  echo "<script>window.location='index.php?mod=inicio';</script>";
} else {
?>

  <body>
    <div class="ui container">
      <div class="perfil">
        <?php
        while ($row = mysqli_fetch_array($resultadoUsuario)) {
          if ($row['Id_usuario'] == $_SESSION['Id_usuario']) {
        ?>
            <div class="foto">
              <img class="imagen-perfil" src="img/<?php echo $row['FotoUsuario']; ?>">
            </div>
            <div class="infoPerfil">
              <form action="" class="ui form">
                <div class="two fields">
                  <div class="field">
                    <label for="">Usuario</label>
                    <input type="text" value="<?php echo $row['Usuario'] ?>" readonly>
                  </div>
                  <div class="field">
                    <label for="">Clave</label>
                    <input type="password" value="<?php echo $row['Clave'] ?>" readonly>
                  </div>
                </div>
                <div class="field">
                  <?php
                  if ($row['Rol'] == 1) {
                  ?>
                    <label for="">Rol</label>
                    <input type="text" value="SuperAdmin" readonly>
                  <?php
                  } else
                          if ($row['Rol'] == 2) {
                  ?>
                    <label for="">Rol</label>
                    <input type="text" value="Administrador" readonly>
                  <?php
                  } else
                          if ($row['Rol'] == 3) {
                  ?>
                    <label for="">Rol</label>
                    <input type="text" value="Acudiente" readonly>
                  <?php
                  }
                  ?>
                </div>
              </form>
            </div>
        <?php
          }
        }
        ?>
      </div>
    </div>
  </body>
<?php
}
?>