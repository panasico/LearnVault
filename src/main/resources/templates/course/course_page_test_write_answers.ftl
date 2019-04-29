<#import "course_macro.ftl" as m>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Untitled Document</title>
    <!-- Bootstrap -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../../static/scripts/jquery-3.2.1.min.js"></script>
    <script src="../../static/scripts/popper.min.js"></script>
    <script src="../../static/scripts/bootstrap-4.0.0.js"></script>
    <script src="../../static/scripts/course-pass.js"></script>
    <link href="../../static/css/bootstrap-4.0.0.css" rel="stylesheet">
    <link href="../../static/css/demo1.css" rel="stylesheet">
    <link href="../../static/css/index.css" rel="stylesheet">
    <link href="../../static/css/Page_of_courses.css" rel="stylesheet">

</head>
<body>
<!-- body code goes here -->
<div class="main-layer">
    <div class="paige_of_course_name" id="name_of_course">${course_name}</div>
    <@m.pagelist course_id, pages/>
    <div class="theory-panel">
        <div class="page_title" id="name_of_page">${title}</div>
        <div><textarea name="text_of_paige" cols="100" rows="7" id="textArea" readonly
                       style="resize:none;overflow-y: auto; border-style:none;">${question}</textarea></div>
        <div>
            <form action="" method="post">
                <input type="text" class="form-control" placeholder="введите ответ" id="answer_area">
                <label id="answer_response"></label><br>
                <button type="button" name="send" value="send" onclick="tryAnswer(${course_id}, ${page_num}, getAns(), 'answer_response')">Отправить</button>
            </form>
        </div>
        <@m.scroll course_id, page_num/>
    </div>
</div>
<script>
    function getAns() {
        return document.getElementById("answer_area").value;
    }
</script>
</body>
</html>