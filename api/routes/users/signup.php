<?php
    include("../../config/connection.php");

    include("../../modules/header.php");
    include("../../modules/body.php");

    if (isset($_BODY)) {
        $name = $_BODY["name"];
        $email = $_BODY["email"];
        $password = $_BODY["password"];
        $password_c = $_BODY["password_confirm"];

        if ($name && $email && $password && $password_c) {
            if ($password === $password_c) {
                $sql = "SELECT * FROM user WHERE `user_name` = '$name'";
                $result = $connect->query($sql);

                if ($result->num_rows > 0) {
                    $response["status"] = 403;
                    $response["response"] = "Usuário já existe";
                } else {
                    // Criptografando senha
                    $encrypted_password = md5($password);

                    // Tratando a data
                    $today =  getdate();

                    $day = $today["mday"];
                    $month = $today["mon"];
                    $year = $today["year"];

                    if($day < 10) {
                        $day = 0 . $day;
                    }
                    if($month < 10) {
                        $month = 0 . $month;
                    }
                    $today = $year . "-" . $month . "-" . $day;

                    $sql = "INSERT INTO user(`user_name`, user_email, user_password, user_date) VALUES ('$name', '$email', '$encrypted_password', '$today')";
                    if ($connect->query($sql) === TRUE) {
                        $response["status"] = 200;
                        $response["response"] = "Cadastro realizado com sucesso";
                    } else {
                        $response["status"] = 400;
                        $response["response"] = "Não foi possível realizar o cadastro";
                    }
                }
            } else {
                $response["status"] = 400;
                $response["response"] = "Senhas não correspondem";
            }
        } else {
            $response["status"] = 403;
            $response["response"] = "Preencha todos os campos";
        }
    } else {
        $response["status"] = 401;
        $response["response"] = "Acesso negado";
    }

    echo(json_encode($response));
    