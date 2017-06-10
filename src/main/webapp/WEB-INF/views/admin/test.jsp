<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SpringMVC 博客管理</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <h1>软件下载中心 系统  - 测试管理</h1>
    <hr/>

    <h3>测试文件 <a href="${ctx}/admin/documents/add" type="button" class="btn btn-primary btn-sm">添加</a></h3>
    <input type="text" class="form-control" id="showMessage" name="showMessage" placeholder="Enter message:"/>
</div>
<h2>准备下载软件</h2>
<!-- 按钮触发模态框 -->
<button class="btn btn-primary " data-toggle="modal" data-target="#myModal">
    下载
</button>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    你确定要下载安装这个软件软件
                </h4>
            </div>
            <div class="modal-body">
                自动下载安装，本软件中心支持多范围软件下载。。。
            </div>
            <div class="modal-footer">
                <button type="button" id="btn_install_false" class="btn btn-primary" data-dismiss="modal">不安装
                </button>
                <button type="button" id="btn_install_true" class="btn btn-success">
                    安装软件
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<p>点击按钮，显示确认下载框。</p>
<button onclick="myFunction()">点我</button>
<p id="demo"></p>
<script>
    function myFunction(){
        var x;
        var r=confirm("确认确认下载安装本软件？");
        if (r==true){
            x="你按下了\"确定\"按钮!";
            window.location = "${ctx}/admin/documents/download/2";
        }
        else{
            x="你按下了\"取消\"按钮!";
            window.location = "${ctx}/admin/documents";
        }
        document.getElementById("demo").innerHTML=x;
    }
</script>

<script type="text/javascript">
    $(function() {
        $('#btn_install_false').click(function () {

            $('#showMessage').set("不安装")；
            // 发送请求

            window.location = "${ctx}/admin/documents";

            alert('谢谢你下一次安装...');})
            $('#myModal').modal('hide')
        })

        $('#btn_install_true').click(function () {
            // 发送请求
            window.location = "${ctx}/admin/documents/download/4";
            alert('非常感谢你的支持...');})
        })


    });
</script>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>

