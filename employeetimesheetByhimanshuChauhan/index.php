<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>   
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container mt-2 border border-dark p-4 shadow-lg p-3 mb-5 bg-white rounded">
    <div class="panel panel-default">
    <form action="submit.php" method="POST">
      <div class="panel-body">
            <div class="form-group">
            <h3 class="text-center">Fill Timesheet of an Employee</h3>
                <label for="title">Employee Name</label>
                <select name="employee" class="form-control" id="employee">
                    <option value="">Name</option>
                    <?php
                        require('db_config.php');
                        $sql = "SELECT project.Id,employeemaster.FirstName FROM  project INNER JOIN employeemaster ON project.Id=employeemaster.Id"; 
                        $result = $mysqli->query($sql);
                        while($row = $result->fetch_assoc()){
                            echo "<option value='".$row['Id']."'>".$row['FirstName']."</option>";
                        }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="title">Project</label>
                <select name="state" class="form-control" id="employee">
                    <option value="">Project</option>
                    <?php
                        require('db_config.php');
                        $sql = "SELECT * FROM  project"; 
                        $result = $mysqli->query($sql);
                        while($row = $result->fetch_assoc()){
                            echo "<option value='".$row['Id']."'>".$row['Name']."</option>";
                        }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="title">Milestone</label>
                <select name="city" class="form-control" style="width:350px" id="milestone">
                </select>
            </div>
            <div class="form-group">
                <label for="title">Task</label>
                <input type="text" name="task" id="task"  class="form-control">
            </div>
            <div class="form-group">
                <label for="title">Date</label>
             <div class="row">
                <div class="col-sm-3">
                <input type="date" name="date" id="date"  class="form-control">
                </div>
             </div>
                </select>
            </div>
            <div class="form-group">
                <label for="title">Time</label>
               <div class="row">
                <div class="col-sm-3">
                <input type="time" id="time" name="time"  class="form-control"  pattern="^([0-1]?[0-9]|2[0-4]):([0-5][0-9])(:[0-5][0-9])?$">
                </div>
               </div>
            </div>
            <div class="form-group">
                <label for="title">Description</label>
                <input type="text" name="desc" id="desc"  class="form-control">
            </div>
            <div class="form-group">
                <input type="submit" name="submit" value="Fill Time Sheet"  class=" btn btn-warning">
            </div>
      </div>
    </form>
    </div>
</div>


<script>
$( "select[name='state']" ).change(function () {
    var stateID = $(this).val();
    if(stateID) {
        $ .ajax({
            url: "ajaxpro.php",
            dataType: 'Json',
            data: {'id':stateID},
            success: function(data) {
                $('select[name="city"]').empty();
                $.each(data, function(key, value) {
                    $('select[name="city"]').append('<option value="'+ key +'">'+ value +'</option>');
                });
            }
        });
    }else{
        $('select[name="city"]').empty();
    }
});
</script>

<script src="index.js"></script>
</body>
</html>



