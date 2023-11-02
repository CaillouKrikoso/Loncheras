<?php
if (!isset($_SESSION['Id_usuario'])) {
  echo "<script>window.location='index.php?mod=inicio';</script>";
} else {
?>
    <body>
      <div class="ui container">
        <div class="login-registrar admin">
          <h1>Registrar usuario</h1>
          <form action="index.php?mod=registrarse" method="post" enctype="multipart/form-data" class="ui form">
            <div class="two fields">
              <div class="field">
                <label for="">Usuario</label>
                <input type="text" name="Usuario" id="" required>
              </div>
              <div class="field">
                <label for="">Clave</label>
                <input type="password" name="Clave" id="" required>
              </div>
            </div>
            <div class="two fields">
              <div class="field">
                <label for="">Rol</label>
                <select name="Rol" id="">
                  <option>Seleccione</option>
                  <option value="1">SuperAdmin</option>
                  <option value="2">Adminstrador</option>
                  <option value="3">Acudiente</option>
                </select>
              </div>
              <div class="field">
                <label for="">Foto</label>
                <div class="input-file">
                  <p> <i class="hand point right icon"></i> Seleccionar foto</p>
                  <input type="file" name="FotoUsuario" id="imagen" onchange="vistaPreliminar(event)" class="btn-file" required>
                </div>
                <div class="preliminar login">
                  <img src="" alt="" id="FotoUsuario">
                </div>
              </div>
            </div>
            <button class="ui button agregrar" type="submit" name="btnEnviar">Registrar usuario</button>
          </form>
        </div>
      </div>
    </body>
<?php
  }
?>