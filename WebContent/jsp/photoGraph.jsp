<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>账号管理</title>

    <link rel="icon" href="http://img.linzworld.cn/img/douban_favicon.ico" type="image/x-icon">
    <!-- 登录成功之后，进行个人信息的修改 -->
    <!-- 导航栏 -->
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/iDouBan/css/header.css">
    <style type="text/css">
        /*放置主要的页面内容*/
        #main_content{
            width: 1040px;
            height: 1400px;
            border-radius: 5px;
            margin: auto 239.600px;
            background-color: #e1dbdb;
        }
        /*页面的主要布局*/
        #main_content-left-top{
            margin: 40px;
        }
        /*用户头像*/
        #user_img{
            border-radius: 8px;
            width:200px;
            height:200px;
        }
        #second1 {
            height: 74px;
            /* background-color: pink; */
            overflow: hidden;
            background-color: #edf4ed;
            margin-bottom: 50px;
        }

    </style>
</head>
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
            <form action="ArticleListServlet?method=search_article_list&currentPage=1" id="search_action" method="post">
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

    <div>
        <form action="http://localhost:8080/iDouBan/UploadImageServlet" method="post" enctype="multipart/form-data">
            选择文件：<input type="file" name="photo" value="" /><br/>
            <input type="submit"  name = "修改" value="上传图片"/>
        </form>
    </div>

    <div id="main_content-left-top"></div>


</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">

        $(function(){
            $.ajax({
                url:"http://localhost:8080/iDouBan/ImageServlet",
                type:"POST",
                success:function (data) {
                    // alert("传回来的JSON字符串："+data)
                    var arraydata = eval(data);
                    // alert("前端解析JSON字符串之后的数组："+arraydata);

                    if(!data.length){
                        alert("没有图片");
                        return;
                    }else {
                        loadPicFormDB(data);
                    }
                },
                error: function (e) {
                    console.log(e);
                    console.log("获取文件list数组失败，请检查接口服务");
                }
            })
        });

        function loadPicFormDB(data) {
            var pichtml = "";
            for (var i = 0; i < data.length; i++) {
                var src =data[i];

                var html1 = '<li><a  href="file:///' + src + '" rel="lightbox" title="' + data[i] + '" target="_blank">'
                    + '<img style="display: inline-block;width: 100%;max-width: 100%;height: auto;" " src="' + src + '"></a><span>' + data[i] + '</span></li>';

                pichtml += html1;
                //scrollPic();
            }
            document.getElementById("main_content-left-top").innerHTML=pichtml;
        }

    </script>
</body>
</html>
