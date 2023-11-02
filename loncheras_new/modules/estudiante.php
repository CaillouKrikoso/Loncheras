<?php
include("php/conexion.php");

$query = "SELECT * FROM estudiante";
$result = $enlace->query($query);
?>

<body>
    <div>
        <table>
            <thead>
                <tr>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Fecha Nacimiento</th>
                    <th>Edad</th>
                    <th>Estado</th>
                    <th>Fecha Ingreso</th>
                    <th>Foto Estudiante</th>
                    <th>Id Acudiente</th>
                    <th>Id Dieta</th>
                </tr>
            </thead>
            <tbody>
                <?php while ($fila=mysqli_fetch_array($result)){ ?>
                    <tr>
                        <th><?php echo $fila['Nombres'] ?></th>
                        <th><?php echo $fila['Apellidos'] ?></th>
                        <th><?php echo $fila['Fecha_nacimiento'] ?></th>
                        <th><?php echo $fila['Edad'] ?></th>
                        <th><?php echo $fila['Estado'] ?></th>
                        <th><?php echo $fila['F_ingreso'] ?></th>
                        <th><div class="foto">
              <img class="imagen-perfil" src="../img/<?php echo $row['FotoUsuario'] ?>">
            </div></th>
                        <th><?php echo $fila['Id_usuario'] ?></th>
                        <th><?php echo $fila['Id_dieta'] ?></th>
                    </tr>
                <?php } ?>
            </tbody>
            <tfoot>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
            </tfoot>
        </table>
    </div>

</body>