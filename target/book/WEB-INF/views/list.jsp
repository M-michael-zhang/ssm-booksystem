<%--
  Created by IntelliJ IDEA.
  User: 49988
  Date: 2018/6/14
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>书列表</title>
    <script type="text/javascript" src="/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/static/bootstrap/js/bootstrap.js"></script>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css">
    <%--<style>--%>
        <%--.table tr:hover{--%>
            <%--background-color: #1d9da4;--%>
        <%--}--%>
    <%--</style>--%>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>ssm-books</h1>
        </div>

    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8" align="right">
            <button class="btn btn-info">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover">
                <tr>
                    <th>#</th>
                    <th>BookName</th>
                    <th>BookPrice</th>
                    <th>BookNumber</th>
                    <th>BookAuthor</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${PageInfo.list}" var="book">
                <tr>
                    <td>${book.bid}</td>
                    <td>${book.bname}</td>
                    <td>${book.bprice}</td>
                    <td>${book.bnumber}</td>
                    <td>${book.bauthor}</td>
                    <td>
                        <button class="btn btn-info btn-sm">

                            <span class=" glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            修改
                        </button>

                        <button class="btn btn-danger btn-sm">
                            <span class=" glyphicon glyphicon-trash" aria-hidden="true"></span>
                            删除
                        </button>

                    </td>
                </tr>
                </c:forEach>


            </table>
        </div>
    </div>
    <div class="row">
        <%--分页信息--%>
            <div class="col-md-6">
                <h4>当前${PageInfo.pageNum}页,&nbsp;&nbsp;总${PageInfo.pages}页,&nbsp;&nbsp;总${PageInfo.total}条记录</h4>

            </div>

       <%--bootstrap分页--%>
           <div class="col-md-6" align="right">
               <nav aria-label="Page navigation">
               <ul class="pagination">


                       <li><a href="/books?pn=1"> 首页</a></li>
                   <c:if test="${PageInfo.hasPreviousPage}">
                       <li>
                           <a href="/books?pn=${PageInfo.pageNum-1}" aria-label="Previous">
                               <span aria-hidden="true">&laquo;</span>
                           </a>
                       </li>
                   </c:if>
                   <c:forEach items="${PageInfo.navigatepageNums}" var="page_Num">
                       <c:if test="${page_Num==PageInfo.pageNum}">
                           <li class="active"><a href="#">${page_Num}</a></li>
                       </c:if>
                       <c:if test="${page_Num!=PageInfo.pageNum}">
                           <li><a href="/books?pn=${page_Num}">${page_Num}</a></li>
                       </c:if>
                   </c:forEach>
                   <c:if test="${PageInfo.hasPreviousPage}">
                       <li>
                           <a href="/books?pn=${PageInfo.pageNum+1}" aria-label="Next">
                               <span aria-hidden="true">&raquo;</span>
                           </a>
                       </li>
                   </c:if>

                   <li><a href="/books?pn=${PageInfo.pages}"> 末页</a></li>
               </ul>
        </nav>
           </div>

    </div>

</div>
</body>
</html>
