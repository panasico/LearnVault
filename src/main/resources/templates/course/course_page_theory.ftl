<#import "course_macro.ftl" as m>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Untitled Document</title>
    <script src="../../static/scripts/jquery-3.2.1.min.js"></script>
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
    <div class="theory-panel" id="theory_column">
        <div class="page_title" id="name_of_page">${title}</div>
        <div><textarea name="text_of_paige" cols="100" rows="15" id="textArea" readonly
                       style="resize:none;overflow-y: auto; border-style:none;">${text}</textarea></div>
        <#if photo??>
            <div>СЮДА НАДО ДОБАВИТЬ ФОТО</div>
        </#if>
        <#if addtional??>
            <div>
                <header_text_addons> Дополнителтные материалы:</header_text_addons>
            </div>
            <div class="link-list">
                <ul class="col-xl-6" id="list-links" style="padding: 0;">
                    <a href="{{docs}}">{{links_of_inserts}} </a>
                </ul>
            </div>
        </#if>
        <#if video??>
            <div class="video">
                <iframe class="video" src="http://tv.adobe.com/embed/1221/24197/"></iframe>
            </div>
        </#if>
        <@m.scroll course_id, page_num/>
    </div>
</div>

</body>

</html>