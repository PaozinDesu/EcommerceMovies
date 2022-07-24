<?php  
include("../../config/connection.php");
include("../../modules/header.php");

$sql = "SELECT * FROM user";
$result = $connect->query($sql);

if ($result->num_rows > 0) {
    while ($user = $result->fetch_assoc()) {
        $user_data[] = [
            "id" => intval($user["user_id"]),
            "name" => $user["user_name"],
            "email" => $user["user_email"],
            "password" => $user["user_password"],
            "token" => $user["user_token"],
            "date" => $user["user_date"]
        ];
    }

    $response["status"] = 200;
    $response["response"] = $user_data;
} else {
    $response["status"] = 400;
    $response["response"] = "Não foi encontrado nenhum usuário.";
}
    
echo (json_encode($response));
    