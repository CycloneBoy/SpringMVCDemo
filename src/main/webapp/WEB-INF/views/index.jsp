<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SpringMVC Demo 首页</title>

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
<h1>这里是 软件管理中心 首页</h1>

<h3>出现此页面，说明配置成功。</h3>

<h5>这是我的软件管理中心工程</h5>

<ul class="nav nav-tabs">
    <li class="active">
        <a href="${ctx}/" >
            <span class="glyphicon glyphicon-home"></span>主页
        </a>
    </li>

    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <span class="glyphicon glyphicon-user"></span>用户管理
        </a>
        <ul class="dropdown-menu">
            <li><a href="${ctx}/admin/users">修改用户信息</a></li>
            <li><a href="">修改密码</a></li>
            <li class="divider"></li>
            <li><a onclick="check()">退出系统</a></li>
        </ul>
    </li>

    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            文件管理<span class="caret"></span>
        </a>
        <ul class="dropdown-menu">

            <li><a href="${ctx}/admin/documents">查询文件</a></li>
            <li><a href="${ctx}/admin/documents/add">添加文件</a></li>
            <li><a href="">删除文件</a></li>
            <li><a href="">修改文件</a></li>
            <li><a href="">下载文件</a></li>
        </ul>
    </li>

    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            记录管理<span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><a href="">查找记录</a></li>
            <!-- <li class="divider"></li>
            <li><a href="PreTTouristServlet?method=add">添加预订人员</a></li>
            <li><a href="PreTTouristServlet?method=displaysTTourist">预订人员管理</a></li> -->
        </ul>
    </li>

    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            软件管理<span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><a href="">查看软件</a></li>
            <li><a href="">添加软件</a></li>
        </ul>
    </li>

</ul>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
