<?php

$dbHost = "localhost";
$dbUsername = 'root';
$dbPassword = '';
$dbName = 'db_buku';

$conn = mysqli_connect($dbHost, $dbUsername, $dbPassword, $dbName) or die('Koneksi Gagal');



function query($query)
{
  global $conn;
  $result = mysqli_query($conn, $query);
  $rows = [];
  while ($row = mysqli_fetch_assoc($result)) {
    $rows[] = $row;
  }
  return $rows;
}