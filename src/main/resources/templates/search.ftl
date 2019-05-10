<#import "index_macro.ftl" as m>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Training portal</title>
    <link href="../static/images/icon.png" rel="shortcut icon" type="image/x-icon">
    <link href="../static/css/demo1.css" rel="stylesheet">
    <link href="../static/css/index.css" rel="stylesheet">
    <script src="../static/scripts/jquery-1.12.4.min.js"></script>
    <script src="../static/scripts/wb.carousel.min.js"></script>
    <script src="../static/scripts/searchindex.js"></script>
    <script src="../static/scripts/wb.sitesearch.min.js"></script>
    <script src="../static/scripts/login.js"></script>
    <style>
        hr {
            border: 0;
            height: 1px;
            background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));
        }

        .result_container {
            style = "margin: 20px 40px 20px 40px;"
            border: 4px double black; /* Параметры границы */
            background: #BDD2DE; /* Цвет фона */
            padding: 10px; /* Поля вокруг текста */
            min-height: 160px;
            max-width: 1160px;
            margin: 20px 0;
        }

        .result_description {
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            max-width: 1000px;
            overflow: hidden;
            text-overflow: ellipsis;
            height: 56px;
            color: rgb(0, 45, 86);
            font-family: "Exo 2";
        }

        .tag {
            display: inline-block;
            margin-top: 5px;
            margin-right: 4px;
            padding: 0 4px;
            color: #7A7A7A;
            border: 2px solid #e4e4e4;
            border-radius: 6px;
            white-space: nowrap;
            background: #FCF8F8;
            font-family: "Exo 2";
            height: 15px;
            padding: 2px 10px;
        }

        h3.h3 {
            color: rgb(0, 45, 86);
            font-family: "Exo 2";
            margin-bottom: 20px;
        }

        h5.H5 {
            font-family: "Exo 2";
            margin-top: 20px;
            font-size: 18px;
            color: rgba(0, 70, 134, 1.00);
        }

        h5.h5 {
            color: rgba(13, 107, 192, 1.00);
            font-family: "Exo 2";
            margin-top: 20px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div id="LayerBody">
    <div id="LayerBody_Container">
        <div id="LayerMain" style="width:1200px; min-height: 800px;">
            <@m.header_site/>
            <div style="margin: 20px 40px 20px 40px;">
                <div style="margin:20px 0;"><h3 class="h3">Результаты поиска:</h3></div>
                <hr>
                <#list courses as course>
                    <div class="result_container">
                        <a href="#">
                            <img src="../static/images/business.jpg" style="width:160px;height:160px;float:left;">
                            <div style="float:left;min-height:160px;max-width:900px;">
                                <div><h5 class="H5" style="margin: 10px 50px; font-size:18px;">${course.name}</h5></div>
                                <div>
                                    <h3 class="result_description"
                                        style="margin: 15px 50px; font-size:16px;">
                                        ${course.description}
                                    </h3>
                                </div>
                                <div style="margin: 10px 50px;">
                                    <#list course.tags as tag>
                                        <span class="tag">${tag.name}</span>
                                    </#list>
                                </div>
                            </div>
                        </a>
                    </div>
                </#list>
            </div>
        </div>
    </div>
</div>
</body>
</html>