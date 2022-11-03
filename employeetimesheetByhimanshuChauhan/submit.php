<?php

if(isset($_POST['submit']))
{
   
$conn = mysqli_connect("localhost","root","","employeetimesheetsep2022") or die("Connection Failed");
if($_POST['employee'] && $_POST['state'] && $_POST['city'] && $_POST['task'] && $_POST['date'] && $_POST['desc'] && $_POST['time'])
{

$emp= $_POST['employee']; 
$st= $_POST['state'];
$ct= $_POST['city'];
$task= $_POST['task'];
$date= $_POST['date'];
$desc= $_POST['desc'];
if( $_POST['time']=='00:00')
{
    echo "<script>alert('Time should not be Zero hours, not more than 24 hours.');
    window.location= 'http://localhost/employeetimesheetByhimanshuChauhan/';
    </script>";
    exit;
}else{
    $time= $_POST['time'];
    $sql1 = "SELECT * FROM  timesheet WHERE Empid=$emp AND TimesheetDate='$date'";
    $res = mysqli_query($conn, $sql1);
    if(mysqli_num_rows($res) > 0){
        echo "<script>alert('Employee can fill only 1 timesheet for the date.');
        window.location= 'http://localhost/employeetimesheetByhimanshuChauhan/';
        </script>";
        exit;
    }else{
    $sql = "INSERT INTO  timesheet(ProjectId,MilestoneId,TaskName,LoggedHours,TimesheetDate,Description,Empid) VALUES($st,$ct,'$task','$time','$date','$desc',$emp)";
    //   echo $sql;

    //   exit;
    if( mysqli_query($conn, $sql))
    {
        echo "<script>alert('Timesheet filled successfully..');
        window.location= 'http://localhost/employeetimesheetByhimanshuChauhan/';
        </script>";
    }else{
        echo "<script>alert('There is some problem.');
        window.location= 'http://localhost/employeetimesheetByhimanshuChauhan/';
        </script>";
    }
}
}
}else{ 
    echo "<script>alert('Please Fill Required Fields');
    window.location= 'http://localhost/employeetimesheetByhimanshuChauhan/';
    </script>";
}
}
?>