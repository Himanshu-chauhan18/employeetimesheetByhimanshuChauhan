<?php


   require('db_config.php');

   $sql = "SELECT * FROM milestone WHERE ProjectId= {$_GET['id']} "; 

   $result = $mysqli->query($sql);


   $json = [];
   while($row = $result->fetch_assoc()){
        $json[$row['Id']] = $row['Name'];
   }

   echo json_encode($json);
  
?>