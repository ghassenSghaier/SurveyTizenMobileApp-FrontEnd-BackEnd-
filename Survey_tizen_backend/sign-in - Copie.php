<?php
include("connexion.php");
$response["utilisateur"]   = array();
$email = $_GET['email'];
$password = $_GET['password'];
$sql = "SELECT * FROM `utilisateur` WHERE email='".$email."' and password='".$password."'  ";
$result=$conn->query($sql);
    
	
if ($result->num_rows!=0) {
      
    while($row = $result->fetch_assoc()) {
        $user = array();
        $user["id"]  = $row["id"];
        array_push($response["utilisateur"], $user);
    }
echo json_encode($response);
    } else {
        $response["success"] = 0;
        $response["message"] = "Oops! An error occurred.";
 
        echo json_encode($response);
    }
$conn->close();
?>