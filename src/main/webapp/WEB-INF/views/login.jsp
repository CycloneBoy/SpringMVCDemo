<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>登录页</title>
	<style type="text/css">
		body {
			padding-top: 40px;
			padding-bottom: 40px;

			background-image: url("/WEB-INF/img/flower.jpeg");
		}

		body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,p,blockquote,th,td
		{
			margin: 0;
			padding: 0;
		}

		.form-signin {
			max-width: 500px;
			padding: 19px 29px 29px;
			margin: 0 auto 20px;

			background-image: url("/WEB-INF/img/sea.jpg");
			border: 1px solid #e5e5e5;
			-webkit-border-radius: 5px;
			-moz-border-radius: 5px;
			border-radius: 5px;
			-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
			-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
			box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
		}

		.form-signin .form-signin-heading,.form-signin .checkbox {
			margin-bottom: 15px;
		}

		.form-signin input[type="text"],.form-signin input[type="password"] {
			height: auto;
			margin-bottom: 15px;
			padding: 7px 9px;
		}

		h1 {
			color: #fff;
			background: #06b;
			padding: 10px;
			font-size: 200%;
			text-align: center;
		}

	</style>
</head>
<body >
	<div>
		<form:form class="form-signin" action="${ctx}/admin/users/login" method="post"  commandName="user" role="form">
			<h2 class="form-signin-heading">用户登录</h2>
			<hr>
		    <table >
					<tr>
						<td></td>
						<td>${message}</td>
					</tr>
					<tr >
	                     <td >用户名：</td>
		                 <td><input type="text" id="nickname" name="nickname" class="form-control" placeholder="请输入用户名" ></td>
		            </tr>

					<tr >
	                     <td >密码：</td>
		                 <td> <input type="password" class="form-control" id="password" name="password"  placeholder="请输入密码">
						 </td>
		            </tr>

					<tr >
						<td >类型：</td>
						<td>
							<label class="checkbox-inline">
								<input type="radio" name="type" id="type1" value="1"
									   checked> 用户
							</label>
							<label class="checkbox-inline">
								<input type="radio" name="type" id="type2"  value="2"> 管理员
							</label>
						</td>
					</tr>
		             <tr>
	                     <td ></td>	            
		                 <td>
							 <button type="submit"  class="btn btn-success">登陆</button>
							 <input type="reset" class="btn btn-primary" value="重置"/>
							 <a href="${ctx}/admin/users/add" type="button" class="btn btn-primary btn-sm">注册</a>
						 </td>
		            </tr>
		    </table>
		</form:form>
	</div>
</body>
</html>