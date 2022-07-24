<?php
include ("../modules/header.php");

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
    $response["status"] = 400;
    $response["response"] = "Não foi possível se conectar ao banco de dados.";
} else {
    $response["status"] = 200;
    $response["response"] = "Conexão realizada com sucesso.";
}

// Retornando a resposta da conexão no formato JSON
echo(json_encode($response));