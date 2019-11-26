<?php
$servername = "localhost";
$username = "root";
$password = "";
$conn = new mysqli($servername,$username,$password,"sondagedb");
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
$response["utilisateurs"]   = array();


$sql = "SELECT nomprenom ,email
FROM  utilisateur";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        $utilisateur = array();
		  $utilisateur["id"]  = $row["id"];
		   $utilisateur["nomprenom"]  = $row["nomprenom"];
		    $utilisateur["email"]  = $row["email"];
		 //$utilisateur["username"]  = $row["username"];
		
		 $utilisateur["password"]  = $row["password"];

		
		
		
 array_push($response["utilisateurs"], $utilisateur);

    }
echo json_encode($response);
} else {
    echo "0 results";
}
$conn->close();

?>