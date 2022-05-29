<?php

require 'koneksi.php';

$A = query("SELECT * FROM buku");

$B = query("SELECT * FROM pengarang");

$sql = query("SELECT * FROM buku AS 
A LEFT JOIN pengarang AS B ON 
A.pengarang_id=B.pengarang_id 
ORDER 
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
  <?php require('nav.php'); ?>

  <div class="container">

    <div class="text-center">
      <h3>LEFT JOIN</h3>
    </div>

    <table class="table table-bordered table-striped table-hover">
      <thead>
        <tr class="table-primary">
          <th class="text-center">No</th>
          <th class="text-center">Buku ISBN</th>
          <th class="text-center">Judul</th>
          <th class="text-center">Pengarang</th>
        </tr>
      </thead>

      <?php $nomor = 1;  ?>
      <?php foreach ($sql as $data) : ?>

      <tr>
        <td class="text-center"><?= $nomor; ?></td>
        <td class="text-center"><?= $data['buku_isbn']; ?></td>
        <td class="text-center"><?= $data['buku_judul']; ?></td>
        <td class="text-center"><?= $data['pengarang_nama']; ?></td>
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