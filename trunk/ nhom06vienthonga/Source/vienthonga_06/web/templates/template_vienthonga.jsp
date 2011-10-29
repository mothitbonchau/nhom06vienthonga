<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <title>Nhóm 06 - www.vienthonga.com</title>

        <link rel="shortcut icon" href="http://static.hnammobile.com/images/favicon.ico" />

        <link href="css/screen.css" rel="stylesheet" type="text/css" />
        <link href="css/modify.css" rel="stylesheet" type="text/css" />
        <link href="css/modify21.css" rel="stylesheet" type="text/css" />
        <link href="css/modify221.css" rel="stylesheet" type="text/css" />

        <script type="text/javascript" src="css/mootools.js"></script>
        <script type="text/javascript" src="css/implement.js"></script>
        <script type="text/javascript" src="css/form.js"></script>
        <script type="text/javascript" src="css/initForm_v11.js"></script>
        <script type="text/javascript" src="css/common.js"></script>
        <script type="text/javascript" src="css/hnamv2.js"></script>
        <script type="text/javascript" src="css/modify.js"></script>
        <script type="text/javascript" src="css/swfobject.js"></script>
        <script type="text/javascript" src="plugins/fckeditor/fckeditor.js"></script>
        <script type="text/javascript" src="js/fileuploader.js"></script>
        <script type="text/javascript" src="js/jquery-1.6.4.js"></script>
        
        <style media="screen" type="text/css">
            #bannertop {visibility:hidden}
        </style>
    </head>

    <body>

        <div id="left" style="float:left; width:15%;">
            &nbsp;
        </div>


        <div id="mid" style="float:left; width:80%;">
            <!-- bắt đầu header -->
            <tiles:insertAttribute name="header" />
            <!-- kết thúc header -->

            <div id="body" style="padding-left: 20px;">
                <!-- bắt đầu body_left -->
                <tiles:insertAttribute name="body_left" />
                <!-- kết thúc body_left -->

                <div style="margin-top:10px;">
                    <!-- bắt đầu body_mid -->
                    <tiles:insertAttribute name="body_mid" />
                    <!-- kết thúc body_mid -->                    
                </div>

                <!-- bắt đầu body_right -->
                <tiles:insertAttribute name="body_right" />
                <!-- kết thúc body_right -->     
            </div>

            <div id="footer" style="float:left;">
                <!-- bắt đầu footer1 -->
                <tiles:insertAttribute name="footer1" />
                <!-- kết thúc footer1 -->

                <!-- bắt đầu footer2 -->
                <tiles:insertAttribute name="footer2" />
                <!-- kết thúc footer2 -->                
            </div>
        </div>

        <div id="right" style="float:right; width:10%;">
            &nbsp;
        </div>

    </body>
</html>
