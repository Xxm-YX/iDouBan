<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>所有人</title>
	<link rel="icon" href="http://img.linzworld.cn/img/douban_favicon.ico" type="image/x-icon">

	<!-- 显示所有用户的页面 -->

	<link rel="stylesheet" type="text/css" href="http://localhost:8080/iDouBan/css/everyone.css">
	<style type="text/css">
		/*发送豆邮的按钮*/
		#send_doumail{
			height: 30px;
			float: right;
			margin-right: 25px;
			margin-top: 37px;
		}
		/*用户操作的按钮*/
		#everyone_list_operation{
			margin-right: 24px;
			margin-top: 37px;
			float: right;
		}
	</style>

</head>
<!-- 个人信息的主页 -->
<body>
<!-- 顶部的菜单栏 -->
<nav id="first">
	<div id="first_menu">
		<!-- 跳到servlet，对用户的cookie进行注销 -->
		<a  href="http://localhost:8080/iDouBan/ClearLoginServlet">退出登录</a>
		<!-- 相对于端口号的相对路径 -->
		<a  href="http://localhost:8080/iDouBan/jsp/alter.jsp">账号管理</a>
		<a  href="/iDouBan/UserListServlet?method=everyone_list">用户管理</a>
		<a  href="http://localhost:8080/iDouBan/jsp/my_page.jsp">个人主页</a>

		<a href="/iDouBan/DoumailServlet?method=my_doumail_list">豆邮</a>

		<a href="/iDouBan/FriendListServlet?method=blacklist_list">黑名单</a>
		<a href="/iDouBan/FriendListServlet?method=attention_list">我的关注</a>
		<a href="/iDouBan/FriendListServlet?method=friend_list">我的好友</a>
		<!-- 先跳转servlet 查询第一页的所有人信息 -->
		<a href="/iDouBan/EveryoneListServlet?method=everyone_list">所有人</a>
		<!-- 编辑文章 -->
		<a href="http://localhost:8080/iDouBan/jsp/article_edit.jsp" target="_blank">写文章</a>
		<a href="/iDouBan/ArticleListServlet?method=article_list">所有文章</a>
		<a href="/iDouBan/ArticleListServlet?method=my_article_list" >我的文章</a>
		<a href="/iDouBan/ArticleListServlet?method=my_collection_list">我的收藏</a>
		<a  href="http://localhost:8080/iDouBan/jsp/photoGraph.jsp">我的相册</a>
	</div>
</nav>
<!-- 第二个导航栏 -->
<header id="second">
	<nav  id="second_menu">
		<!-- logo部分 -->
		<div class="logo">
			<img alt="豆瓣logo" src="http://localhost:8080/iDouBan/image/豆瓣首页logo.jpg" width=175px height=58px >
		</div>
		<!-- 导航栏部分_可选择部分 -->
		<div class="navbar">
			<ul>
				<li><a href="#">首页</a></li>
				<li><a href="http://localhost:8080/iDouBan/jsp/my_page.jsp">个人主页</a></li>
				<li><a href="/iDouBan/ArticleListServlet?method=article_list">浏览发现</a></li>
			</ul>
		</div>
		<!-- 搜索框部分 -->
		<div class="search">
			<form action="EveryoneListServlet?method=search_users&currentPage=1" id="search_action" method="post">
				<!-- placeholder占位符 -->
				<input type="text" name="search_content" id="search_content" placeholder="搜索你感兴趣的内容和人">
				<!-- placeholder--默认显示值 -->
				<input  type="submit" value="">
			</form>
		</div>
	</nav>
</header>
<!-- 显示主要内容的地方 -->
<div id="main_content">
	<div id="main_content-left">
		<!-- 放置个人头像和信息 -->
		<div id="main_content-left-top">
			<div>
				<h1 style="margin-bottom: 20px;">所有人的列表</h1>
			</div>
			<!-- 展示所有人的信息列表 --分页列表---包含模糊搜索的功能-->
			<div >

				<c:forEach  items="${requestScope.p.objects}" var="u">
					<!-- 每一行的显示 -->
					<div class="users_info_list">
						<!-- 其他人的头像 -->
						<div id="everyone_list_img">
							<img alt="用户头像" src="${u.portrait}" width=60px height=60px id="everyone_list_portrait">
						</div>
						<!--其他人的昵称和个性签名  -->
						<div id="everyone_list_info">
							<p id="everyone_list_nickname">${u.nickname==""?"无名氏":u.nickname} </p>
							<p id="everyone_list_signature">${u.signature}

								权限:${u.status==1?"管理员":"普通用户"}
								地址：${u.address}
								注册时间：${u.time}
								是否被举报：${u.reported==1?"是":"否"}
								封号时间：${u.titleTime}
						</div>
					</div>
				</c:forEach>
			</div>



			<!-- 分页选择链接 -->
			<c:if test="${requestScope.p.totalPage!=0}">
				<div id="paging">
							 		<span id="page_number">
									当前第 ${requestScope.p.currentPage} 页，总共 ${requestScope.p.totalPage} 页
									</span>
					<a href="UserListServlet?method=${requestScope.method}&currentPage=1" id="first_page" class="page_contrller">首页</a>
					<!-- 利用el表达式的三目运算符进行判断 -->
					<a href="UserListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==1)?1:requestScope.p.currentPage-1}" id="pervious_page"  class="page_contrller">上一页</a>
					<a href="UserListServlet?method=${requestScope.method}&currentPage=${(requestScope.p.currentPage==requestScope.p.totalPage)?requestScope.p.totalPage:requestScope.p.currentPage+1}" id="next_page"  class="page_contrller">下一页</a>
					<a href="UserListServlet?method=${requestScope.method}&currentPage=${requestScope.p.totalPage}" id="last_page"  class="page_contrller">尾页</a>

				</div>
			</c:if>

		</div>
		<div id="main_content-left-centre">


		</div>
	</div>

	<div id="main_content-right">
	</div>


</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	function a() {
		document.getElementById(status).type = "text";
		document.getElementById(address).type = "text";
		document.getElementById(reported).type = "text";
	}
		// function change_User(Object){
		// 	$.ajax({
		// 		url:"http://localhost:8080/iDouBan/ChangeUserInfo",
		// 		type:"POST",
		// 		data:Object.serialize(),
		// 		success:function (data) {
		// 			// alert("传回来的JSON字符串："+data)
		// 			var arraydata = eval(data);
		// 			// alert("前端解析JSON字符串之后的数组："+arraydata);
		//
		// 			if(!data.length){
		// 				alert("没有图片");
		// 				return;
		// 			}else {
		// 				loadPicFormDB(data);
		// 			}
		// 		},
		// 		error: function (e) {
		// 			console.log(e);
		// 			console.log("获取文件list数组失败，请检查接口服务");
		// 		}
		// 	})
		// };


</script>
</body>
</html>