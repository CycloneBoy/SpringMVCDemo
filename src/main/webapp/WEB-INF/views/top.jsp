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
<h1>软件下载中心 系统 - 首页</h1>

<h3>出现此页面，说明配置成功。</h3>

<h5>我是石头，这是我的SpringMVC工程</h5>
<ul class="nav nav-tabs">
    <li class="active">
        <a href="mainServlet" >
            <span class="glyphicon glyphicon-home"></span>主页
        </a>
    </li>
    <!-- 用户管理菜单 <span class="caret"></span> -->
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            <span class="glyphicon glyphicon-user"></span>用户管理
        </a>
        <ul class="dropdown-menu">
            <li><a href="PreTUserServlet?method=update&id=<%=session.getAttribute("index")%>">修改用户信息</a></li>
            <li><a href="PreTUserServlet?method=preupdatepwd">修改密码</a></li>
            <li class="divider"></li>
            <li><a onclick="check()">退出系统</a></li>
        </ul>
    </li>
    <!-- 旅游团管理菜单 -->
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            旅游团管理<span class="caret"></span>
        </a>
        <ul class="dropdown-menu">

            <li><a href="PreTTourServlet?method=displaysTTour">查询旅游团</a></li>
            <li><a href="PreTTourServlet?method=displaysTTour">预订旅游团</a></li>

        </ul>
    </li>
    <!-- 预订信息管理菜单 -->
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            预订信息管理<span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><a href="PreTBookServlet?method=displaysTUserTBook&id=<%=session.getAttribute("index")%>">查找预订信息</a></li>
            <!-- <li class="divider"></li>
            <li><a href="PreTTouristServlet?method=add">添加预订人员</a></li>
            <li><a href="PreTTouristServlet?method=displaysTTourist">预订人员管理</a></li> -->
        </ul>
    </li>
    <!-- 评价管理菜单 -->
    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            评价管理<span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><a href="PreTEvaluateServlet?method=displaysTUserTEvaluate">查看个人评价</a></li>
            <li><a href="PreTEvaluateServlet?method=displaysTEvaluate">查看所有评价</a></li>
        </ul>
    </li>

</ul>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
