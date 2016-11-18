<script>
$(document).ready(function(){
        $("#student_profile").change(function(){
          console.log($("#student_profile").val())
            if($("#student_profile").val() == "Student"){
              $("#hidden_option").show();
            }else {
              $("#hidden_option").hide();
            }
        });
    });
</script>
