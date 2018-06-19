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
    <style>
        #books_table{
            font-size: 20px;
            border: #2e6da4;
        }
        .edit_btn{
            width: 42%;
        }
        .delete_btn{
            float: right;
            width: 42%;
        }
        #books_table thead tr{
            color: white;
            background-color: #5ba4a1;
        }
        #books_table tr{
            height: 60px;
        }
    </style>
</head>
<body>
<%--新增模态框--%>
<div class="modal fade" id="bookAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Add</h4>
            </div>
            <form class="form-horizontal">
                <div class="modal-body">

                    <div class="form-group">
                        <label for="bname_add_input" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <input type="text" name="bname" class="form-control" id="bname_add_input"
                                   placeholder="书名">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="bisbn_add_input" class="col-sm-2 control-label">ISBN</label>
                        <div class="col-sm-10">
                            <input type="text" name="bisbn" class="form-control" id="bisbn_add_input"
                                   placeholder="标准书号">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="bprice_add_input" class="col-sm-2 control-label">Price</label>
                        <div class="col-sm-10">
                            <input type="number" name="bprice" class="form-control" id="bprice_add_input"
                                   placeholder="价格">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bnumber_add_input" class="col-sm-2 control-label">Number</label>
                        <div class="col-sm-10">
                            <input type="number" name="bnumber" class="form-control" id="bnumber_add_input"
                                   placeholder="数量">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bauthor_add_input" class="col-sm-2 control-label">Author</label>
                        <div class="col-sm-10">
                            <input type="text" name="bauthor" class="form-control" id="bauthor_add_input"
                                   placeholder="作者">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="bpress_add_input" class="col-sm-2 control-label">Press</label>
                        <div class="col-sm-10">
                            <input type="text" name="bpress" class="form-control" id="bpress_add_input"
                                   placeholder="出版社">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="col-md-12" align="right">


                    </div>

                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-primary" id="book_clear_btn">Clear</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="book_save_btn">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%--新增模态框结束--%>
<%--修改模态框--%>
<div class="modal fade" id="bookUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="bname_update_input" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <input type="text" name="bname" class="form-control" id="bname_update_input"
                                   placeholder="书名">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-2 control-label">ISBN</label>
                        <div class="col-sm-10">

                            <p class="form-control-static" id="bisbn_update_static">ssss</p>
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="bprice_update_input" class="col-sm-2 control-label">Price</label>
                        <div class="col-sm-10">
                            <input type="number" name="bprice" class="form-control" id="bprice_update_input"
                                   placeholder="价格">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bnumber_update_input" class="col-sm-2 control-label">Number</label>
                        <div class="col-sm-10">
                            <input type="number" name="bnumber" class="form-control" id="bnumber_update_input"
                                   placeholder="数量">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bauthor_update_input" class="col-sm-2 control-label">Author</label>
                        <div class="col-sm-10">
                            <input type="text" name="bauthor" class="form-control" id="bauthor_update_input"
                                   placeholder="作者">
                            <span class="help-block"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="bpress_update_input" class="col-sm-2 control-label">Press</label>
                        <div class="col-sm-10">
                            <input type="text" name="bpress" class="form-control" id="bpress_update_input"
                                   placeholder="出版社">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="book_update_btn">Save changes</button>
            </div>
        </div>
    </div>
</div>
<%--修改模态框结束--%>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>ssm-books</h1>
        </div>

    </div>
    <div class="row" style="margin-bottom: 10px;">
        <div class="col-md-2"><a href="index.jsp"> <button class="btn btn-primary btn-md">返回首页</button></a></div>
        <div class="col-md-2 col-md-offset-6" align="right">
            <button class="btn btn-primary btn-md" id="book_add_modal_btn">新增</button>
        </div>
        <div class="col-md-2">
            <form method="get" action="search.jsp">
                <input class="form-control" name="msg" type="text" style="width: 70%;float: left"/>
                <button type="submit" class="btn btn-primary btn-md" id="book_search" style="float: left;height: 34px"><span class="glyphicon glyphicon-search"></span></button>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-bordered" id="books_table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Number</th>
                    <th>Author</th>
                    <th>Press</th>
                    <th>ISBN</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr><td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td align="center"><h2>暂无数据</h2></td>

                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                </tbody>



            </table>
        </div>
    </div>
    <div class="row">
        <%--分页信息--%>
        <div class="col-md-6" id="page_info_area">


        </div>

        <%--bootstrap分页--%>
        <div class="col-md-6" align="right" id="page_nav_area">

        </div>

    </div>
</div>
<script>
    var finalPage;
    var currentPage;
    $(function () {
        <%--alert("<%=request.getParameter("msg")%>");--%>
        to_page(1);
    })
    function to_page(pn) {
        $.ajax({
            url: "/search/"+"<%=request.getParameter("msg")%>",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                console.log(result);
                build_books_table(result);
                build_page_info(result);
                build_page_nav(result);

            }
        });
    }
    function build_books_table(result) {
        $("#books_table tbody").empty();
        var books = result.extend.PageInfo.list;
        $.each(books,function (index,item) {
            var bookId = $("<td></td>").append(item.bid);
            var bookName = $("<td></td>").append(item.bname);
            var bookPrice = $("<td></td>").append(item.bprice);
            var bookNum = $("<td></td>").append(item.bnumber);
            var bookAuthor = $("<td></td>").append(item.bauthor);
            var bookPress = $("<td></td>").append(item.bpress);
            var bookIsbn = $("<td></td>").append(item.bisbn);
            var editBtn = $("<button></button>").addClass("btn btn-info btn-sm edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            editBtn.attr("edit-id", item.bid);

            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            deleteBtn.attr("del-id", item.bid);
            var dealTd = $("<td></td>").append(editBtn).append("  ").append(deleteBtn);
            $("<tr></tr>").append(bookId).append(bookName).append(bookPrice).append(bookNum).append(bookAuthor).append(bookPress).append(bookIsbn).append(dealTd).appendTo("#books_table tbody");
        })
    }
    function build_page_info(result) {
        $("#page_info_area").empty();
        var pageInfo = result.extend.PageInfo;
        var msg = "<h4>当前"+pageInfo.pageNum+"页,&nbsp;&nbsp;总"+pageInfo.pages+"页,&nbsp;&nbsp;总"+pageInfo.total+"条记录</h4>";
        $("#page_info_area").append(msg);
        finalPage = result.extend.PageInfo.pages;
        currentPage=result.extend.PageInfo.pageNum;

    }

    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>")
            .append($("<a></a>").append("首页"));
        var prePageLi = $("<li></li>")
            .append($("<a></a>").append("&laquo;"));
        if (!result.extend.PageInfo.hasPreviousPage) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.PageInfo.pageNum - 1);
            });
        }
        var nextPageLi = $("<li></li>")
            .append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>")
            .append($("<a></a>").append("尾页"));
        if (!result.extend.PageInfo.hasNextPage) {
            lastPageLi.addClass("disabled");
            nextPageLi.addClass("disabled");
        } else {
            lastPageLi.click(function () {
                to_page(result.extend.PageInfo.pages);
            });
            nextPageLi.click(function () {
                to_page(result.extend.PageInfo.pageNum + 1);
            });
        }
        ul.append(firstPageLi).append(prePageLi);
        $.each(result.extend.PageInfo.navigatepageNums, function (index, item) {
            var numLi = $("<li></li>")
                .append($("<a></a>").append(item));
            if (result.extend.PageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item)
            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle = $("<nav></nav>").append(ul);
        $("#page_nav_area").append(navEle);
    }

    //    新增点击事件
    $("#book_add_modal_btn").click(function () {

        $("#bookAddModal").modal({
            backdrop: "static"
        });
    });

    //新建清空事件
    $("#book_clear_btn").click(function () {
        $("#bookaddModal form").form("clear");
    })
    //    保存新增书籍点击事件
    $("#book_save_btn").click(function () {

        if(!validate_add_form()){
            return false;
        }

        $.ajax({
            url:"/books",
            type:"POST",
            data:$("#bookAddModal form").serialize(),
            success:function (result) {
                alert(result.msg);
                $("#bookAddModal").modal("hide");
                to_page(finalPage);
            }
        })
    })

    //新建前端校验
    function validate_add_form() {
        var state = 1;
        var bookname = $("#bname_add_input").val();
        if(!JudgeInput("#bname_add_input","请输入书名")) {
            state=0;
        }
        if(!JudgeInput("#bprice_add_input","请输入价格")) {
            state=0;
        }
        if(!JudgeInput("#bnumber_add_input","请输入数量")) {
            state=0;
        }
        if(!JudgeInput("#bauthor_add_input","请输入作者")) {
            state=0;
        }
        if(!JudgeInput("#bpress_add_input","请输入出版社")) {
            state=0;
        }

        var bookisbn = $("#bisbn_add_input").val();
        var regISBN = /(^\d{3}-(\d[- ]*){9}[\dxX]$)|(^(\d[- ]*){9}[\dxX]$)/;
        if(bookisbn=="") {
            show_validate_msg("#bisbn_add_input", "error", "请输入标准书号");
            state = 0;
        }
        else if(!regISBN.test(bookisbn)){
            show_validate_msg("#bisbn_add_input", "error", "请核对标准书号，您输入的标准书号有误！");
            state = 0;
        }
        else show_validate_msg("#bisbn_add_input", "success", "");


        if(state==1) return true;
        else return false;
    }

    //校验isbn是否存在

    function show_validate_msg(ele, status, msg){
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if(status=="error"){
            $(ele).parent().addClass("has-error");
        }
        else $(ele).parent().addClass("has-success");
        $(ele).next("span").text(msg);

    }
    //isbn是否唯一
    $("#bisbn_add_input").change(function () {
        var bookIsbn = this.value;
        $.ajax({
            url:"/checkisbn",
            type:"POST",
            data:"bisbn="+bookIsbn,
            success:function (result) {
                if(result.code==100){
                    show_validate_msg("#bisbn_add_input","success","该ISBN未添加过");
                }else {
                    show_validate_msg("#bisbn_add_input","error","该已存在数据库中");
                }
            }
        })
    })

    //编辑点击事件
    $(document).on("click",".edit_btn",function () {
        $("#bookUpdateModal").modal({
            backdrop: "static"
        });
        getBook($(this).attr("edit-id"));
        $("#book_update_btn").attr("edit-id", $(this).attr("edit-id"));
    })

    function getBook(id) {
        $.ajax({
            url: "/books/" + id,
            type: "GET",
            success: function (result) {
                //console.log(result);
                var book = result.extend.book;
                $("#bisbn_update_static").text(book.bisbn);
                $("#bname_update_input").val(book.bname);
                $("#bprice_update_input").val(book.bprice);
                $("#bnumber_update_input").val(book.bnumber);
                $("#bauthor_update_input").val(book.bauthor);
                $("#bpress_update_input").val(book.bpress);
            }
        });
    }
    //判断input中是否为空，是的话则执行show——validate
    function JudgeInput(ele,error) {
        var value = $(ele).val();
        if(value==""){
            show_validate_msg(ele, "error", error);
            return false;
        }
        else {
            show_validate_msg(ele, "success","");
            return true;
        }

    }
    //    编辑保存事件
    $("#book_update_btn").click(function () {
        var state = 1;
        if(!JudgeInput("#bname_update_input","请输入书名")) {
            state=0;
        }
        if(!JudgeInput("#bprice_update_input","请输入价格")) {
            state=0;
        }
        if(!JudgeInput("#bnumber_update_input","请输入数量")) {
            state=0;
        }
        if(!JudgeInput("#bauthor_update_input","请输入作者")) {
            state=0;
        }
        if(!JudgeInput("#bpress_update_input","请输入出版社")) {
            state=0;
        }

        if(state==0) return false;
        else{
            $.ajax({
                url : "/books/" + $(this).attr("edit-id"),
                type : "PUT",
                data : $("#bookUpdateModal form").serialize(),
                success : function(result) {
                    $("#bookUpdateModal").modal("hide");
                    to_page(currentPage);
                }
            });
        }
    })

    //删除点击事件
    $(document).on("click",".delete_btn",function () {
        var r=confirm("确认删除该书？");
        if(r==true){
            $.ajax({
                url : "/books/" + $(this).attr("del-id"),
                type : "DELETE",
                success : function(result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }

    });

</script>
</body>
</html>
