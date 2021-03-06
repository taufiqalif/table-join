<?php

require 'koneksi.php';

$A = query("SELECT * FROM buku");

$B = query("SELECT * FROM pengarang");

$C = query("SELECT * FROM penerbit");

$sql = query("SELECT * FROM buku AS 
A INNER JOIN pengarang AS B
INNER JOIN penerbit AS C ON 
A.pengarang_id=B.pengarang_id AND
A.penerbit_id=C.penerbit_id ORDER
BY buku_isbn ASC ");

?>



<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <title>Table Join</title>
</head>

<body>


  <div class="container-fluid">
    <?php require('nav.php'); ?>

    <div class="text-center">
      <h3>Ujian Akhir Semester</h3>
    </div>

    <table class="table table-bordered table-striped table-hover">
      <thead>
        <tr class="table-primary">
          <th class="text-center">No</th>
          <th class="text-center">Judul</th>
          <th class="text-center">Pengarang</th>
          <th class="text-center">Penerbit</th>
          <th class="text-center">Harga</th>
          <th class="text-center">Stok</th>
        </tr>
      </thead>

      <?php $nomor = 1;  ?>
      <?php foreach ($sql as $data) : ?>

      <tr>
        <td class="text-center"><?= $nomor; ?></td>
        <td class="text-center"><?= $data['buku_judul']; ?></td>
        <td class="text-center"><?= $data['pengarang_nama']; ?></td>
        <td class="text-center"><?= $data['penerbit_nama']; ?></td>
        <td class="text-center"><?= $data['buku_harga']; ?></td>
        <td class="text-center"><?= $data['stok']; ?></td>
      </tr>
      <?php $nomor++; ?>
      <?php endforeach; ?>

    </table>

  </div>


  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
  </script>
</body>

</html>