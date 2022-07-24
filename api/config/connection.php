<?php
// Credenciais de conexão com o banco de dados
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bd_ecommerce_movies";

// Criando conexão
$connect = new mysqli($servername, $username, $password, $dbname);
$connect->set_charset("utf8");

// Checando se conectou
if ($connect->connect_error) {
    echo("Erro ao conectar com o banco de dados");
    return;
}
