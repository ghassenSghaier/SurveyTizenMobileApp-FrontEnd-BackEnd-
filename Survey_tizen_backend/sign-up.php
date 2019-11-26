<?php
include("connexion.php");
$response = array();


if(isset($_POST['nomprenom']))      $nomprenom=$_POST['nomprenom'];
else      $nomprenom="";

if(isset($_POST['email']))      $email=$_POST['email'];
else      $email="";

if(isset($_POST['image']))      $image=$_POST['image'];
else      $image="";

if(isset($_POST['password']))      $password=$_POST['password'];
else      $password="";

//$nomprenom = $_POST['nomprenom'];
//$email = $_POST['email'];
//$image = $_POST['image'];
//$password= $_POST['password'];



$sql = "INSERT INTO utilisateur (
nomprenom ,
email ,
image,
password
)
VALUES ('$nomprenom','$email','$image','$password');";
$result = $conn->query($sql);
if ($result) {
        // successfully inserted into database
        $response["success"] = 1;
        $response["message"] = "User successfully created.";
 
        // echoing JSON response
        echo json_encode($response);
    } else {
        // failed to insert row
        $response["success"] = 0;
        $response["message"] = "Oops! An error occurred.";
 
        // echoing JSON response
        echo json_encode($response);
    }
$conn->close();

?>