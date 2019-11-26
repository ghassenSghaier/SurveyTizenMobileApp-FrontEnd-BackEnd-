<?php
include("connexion.php"); 
$response["utilisateurs"]   = array();

$sql = "SELECT * FROM `utilisateur` where id=".$_GET["id"];
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        $utilisateur = array();
		 $utilisateur["id"]  = $row["id"];
		 $utilisateur["nomprenom"]  = $row["nomprenom"];
		 $utilisateur["email"]  = $row["email"];
		 $utilisateur["image"]  = $row["image"];
		
		
		 
		
 array_push($response["utilisateurs"], $utilisateur);

    }
echo json_encode($response);
} else {
    echo "0 results";
}
$conn->close();

?>