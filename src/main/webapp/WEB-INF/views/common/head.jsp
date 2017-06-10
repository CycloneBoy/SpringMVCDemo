<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>软件管理中心首页</title>
    <style>
        h1 {
            color: #fff;
            background: #06b;
            padding: 10px;
            font-size: 200%;
            text-align: center;
        }
    </style>

</head>
<body>
<div class="container">
    <h1>软件管理中心 首页</h1>
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
            <%--<li><a href="${ctx}/admin/users/show/${user.id}">查看详细</a></li>
            <li class="divider"></li>
            <li><a href="${ctx}/admin/users/update/${user.id}">更新信息</a></li>--%>
            <li><a href="${ctx}/admin/users/logout">注销</a></li>


        </ul>
    </li>
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href=${ctx}/admin/documents">
                软件中心<span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
                <li><a href="${ctx}/admin/documents">所有软件</a></li>
                <li class="divider"></li>
                <li><a href="${ctx}/admin/documents/get/1">工具</a></li>
                <li><a href="${ctx}/admin/documents/get/2">游戏软件</a></li>
                <li><a href="${ctx}/admin/documents/get/3">视频软件</a></li>
                <li><a href="${ctx}/admin/documents/get/4">音乐软件</a></li>
                <li><a href="${ctx}/admin/documents/get/5">社交软件</a></li>
                <li><a href="${ctx}/admin/documents/get/6">办公软件</a></li>
                <li><a href="${ctx}/admin/documents/get/7">其他软件</a></li>

            </ul>
        </li>

    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            软件管理<span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><a href="${ctx}/admin/documents">查询软件</a></li>
            <li><a href="${ctx}/admin/documents/add">添加软件</a></li>
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
            <li><a href="${ctx}/admin/installs">查看安装记录</a></li>
            <!-- <li class="divider"></li>
            <li><a href="PreTTouristServlet?method=add">添加预订人员</a></li>
            <li><a href="PreTTouristServlet?method=displaysTTourist">预订人员管理</a></li> -->
        </ul>
    </li>

    <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
            其他<span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li><a href="${ctx}/admin/blogs">查看</a></li>
            <li><a href="${ctx}/admin/blogs/add">添加</a></li>
        </ul>
    </li>

</ul>
</div>
</body>
</html>

