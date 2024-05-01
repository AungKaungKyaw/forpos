<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Max-Age: 31536000");


// Check if data is received through POST request
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $jsonData = file_get_contents('php://input');
    $data = json_decode($jsonData, true);
        // Check if username and password are set
        if (isset($data["username"]) && isset($data["password"])) {
            $username = sanitizeString($data['username']);
            $password = sanitizeString($data['password']);
            include('../model/dbReq.php');
            $result = dbReq::checkUsernameAndPass($username, $password);
            if ($result == 'success') {
                $response = array(
                    "status" => "success",
                    "message" => "valid username"
                );
                echo json_encode($response);
            }else if($result == 'noValidUser'){
                $response = array(
                    "status" => "failed",
                    "message" => "invalid username"
                );
                echo json_encode($response);
            }
        }
    if(isset($data['itemCode'])){
//        echo "itemcode : " . $data['itemCode'];
        include ('../model/dbReq.php');
        $result = dbReq::returnItemCode($data['itemCode']);
        if ($result) {
            echo json_encode($result);
        }
        else{
            echo $result;
        }
    }
}
function sanitizeString($inputSanitizeData)
{
    $inputSanitizeData = trim($inputSanitizeData);
    $inputSanitizeData = stripslashes($inputSanitizeData);
    $inputSanitizeData = htmlspecialchars($inputSanitizeData);
    return $inputSanitizeData;
}


