# iDouban
📖研发中心工作室二轮考核项目<br>
✨仿豆瓣的在线博客系统，实现用户简单的登录注册，个人信息管理，好友关系管理，文章管理等功能。<br>
🏁后端技术栈为Java+Servlet+tomcat+mysql+JSP，前端技术栈为HTML+CSS+JS+Ajax+Jquery。<br>
🖥️版本：IDE是IntelliJ IDEA 2019.1.3 (Ultimate Edition) + 数据库版本为Mysql：5.7.24 + Tomcat：8.5.51。<br>
🚀纯原生的JavaWeb实现系统的功能。<br>
## 项目简介
本项目为开发一个仿豆瓣的在线博客系统。使用JavaWeb以及Java为主要开发语言。实现用户简单的登录注册，个人信息管理，好友关系管理，文章管理等功能。纯原生的JavaWeb实现系统的功能。
## 在线体验
1. 体验网址：http://www.linzworld.cn/iDouBan/
2. 体验账号<br>
    账号：123<br>
    密码：123<br>
    【有问题欢迎提issue讨论学习，看到的话就会进行回复，如果对你有帮助的话，点个star是对本人的最大支持】
## 项目展示
![](http://img.linzworld.cn/img/20201224235856.png)
## 启动说明
该项目是本人的一个JavaWeb练手项目，目前优先在线体验，因为前期基本都是本地运行的，但是后面改成了远程服务器的地址（项目中是写死了的），以便供大家访问，后续可能会将这个地址进行提取，设置成一个可以进行配置的属性。
### 本地启动
1. 本地创建一个文件夹<br>
2. 将项目克隆到本地<br>
git clone git@github.com:linzworld/iDouban.git
3. idea编译器导入JavaWeb项目
4. 将根目录中的 db.properties 移动到 src 目录下，并且修改其中的配置为自己的数据库配置。（db_URL的属性中要使用 autoReconnect=true 来进行自动连接，否则Mysql连接会失效）
5. 配置idea中的Project Structure，配置好对应的JDK，artifacts等部分，设置tomcat的启动配置（这部分不会的建议先csdn查下，挺有用的）
6. 启动项目，访问地址：http://localhost:8080/iDouBan
## 项目技术环境
1. 编程语言：Java
2. 前端语言：JSP+HTML+CSS+JS+Ajax+Jquery
3. 编程环境：IntelliJ IDEA 2019.1.3 (Ultimate Edition)
4. 数据库版本：Mysql 5.7.24
5. Tomcat版本：Tomcat 8.5.51
6. 处理请求：Servlet
## 备注
1. 后续将放到线上 ✔️ 已经发到对应网站上了，有bug欢迎提出
2. 项目展示后面将放
## 背景介绍以及系统的意义
  豆瓣（douban）是一个社区网站。网站由杨勃（网名“阿北”） 创立于2005年3月6日。该网站以书影音起家，提供关于书籍、电影、音乐等作品的信息，无论描述还是评论都由用户提供（User-generated content，UGC），是Web 2.0网站中具有特色的一个网站。网站还提供书影音推荐、线下同城活动、小组话题交流等多种服务功能，它更像一个集品味系统（读书、电影、音乐）、表达系统（我读、我看、我听）和交流系统（同城、小组、友邻）于一体的创新网络服务，一直致力于帮助都市人群发现生活中有用的事物。<br>
  通过java原生实现一个javaweb项目，从而锻炼自己的代码实践能力，进一步提升自己的代码水平和代码思考深度。
## 系统用例图
![](http://img.linzworld.cn/img/20201225000231.png)
## 系统架构图
![](https://gitee.com/linzworld/picgo-img/raw/master/img/20200725143957.png)
## 系统架构概述
功能页面分为用户登录注册，个人信息管理，好友关系管理，文章管理。每个页面中有对应的请求处理程序，数据大多存在数据库中，作为数据的管理和保存的功能。
## 框架结构包
1. 使用的jar包：
Json.jar：
用于json格式的字符串和java对象之间的转化。
## 项目亮点
1. 对于jar包，有自己写过一些简单的程序来替代jar包，例如自己手写了个数据库连接池，对于数据库的连接进行了管理。
2. 一些常修改的文件，通过使用配置文件的方式来进行配置，从而减少代码的耦合度。
3. 页面整体较美观
4. 有对前端攻击xss做防护工作
5. 密码使用MD5加密，更加安全。
6. 项目中的富文本是自己找文档原生实现的，没有调用jar包
7. 对于查询操作，有做分页处理。