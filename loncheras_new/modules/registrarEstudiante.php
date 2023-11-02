<?php
if (!isset($_SESSION['Id_usuario'])) {
    echo "<script>window.location='index.php?mod=inicio';</script>";
} else {
    if ($_SESSION['Rol'] != 1 and ($_SESSION)['Rol'] != 3) {
        echo "<script>window.location='index.php?mod=inicio';</script>";
    } else {
?>

        <body>
            <div class="ui container">
                <div class="login-registrar admin">
                    <h1>Registrar estudiante</h1>
                    <form action="index.php?mod=registrarEstu" method="post" enctype="multipart/form-data" class="ui form">
                        <div class="two fields">
                            <div class="field">
                                <label for="">Nombres</label>
                                <input type="text" name="Nombres" id="" required>
                            </div>
                            <div class="field">
                                <label for="">Apellidos</label>
                                <input type="text" name="Apellidos" id="" required>
                            </div>
                        </div>
                        <div class="two fields">
                            <div class="field">
                                <label for="">Fecha de nacimiento</label>
                                <input type="date" name="Fecha_nacimiento" id="" required>
                            </div>
                            <div class="field">
                                <label for="">Edad</label>
                                <input type="text" name="Edad" id="" required>
                            </div>
                        </div>
                        <div class="two fields">
                            <div class="field">
                                <label for="">Foto</label>
                                <div class="input-file">
                                    <p> <i class="hand point right icon"></i> Seleccionar foto</p>
                                    <input type="file" name="FotoEstudiante" id="imagen" onchange="vistaPreliminar(event)" class="btn-file" required>
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
}
?>