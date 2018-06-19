package com.zy.crud.controller;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zy.crud.bean.Book;
import com.zy.crud.bean.Msg;
import com.zy.crud.service.BookService;
import com.zy.crud.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

//处理增删改查
@Controller
public class BookController {

    @Autowired
    BookService bookService;

    @Autowired
    SearchService searchService;

//    需要导入jackson包
    @RequestMapping("/books")
    @ResponseBody
    public Msg getBooksWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
    //引入pagerHelper分页插件
    //在查询前传入页码和数据量
        PageHelper.startPage(pn,8);
    //后面紧跟分页
        List<Book> books = bookService.getAll();
    //使用pageinfo包装查询后的结果
    //将pageinfo交给页面，封装了详细的信息
        PageInfo page = new PageInfo(books,5);
    //传入连续的页数，这里传入5页
        model.addAttribute("PageInfo",page);
        return Msg.success().add("PageInfo",page);
    }

    //查询(分页）
//    @RequestMapping("/books")
    public String getBooks(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model){
//引入pagerHelper分页插件
//在查询前传入页码和数据量
        PageHelper.startPage(pn,10);
//后面紧跟分页
        List<Book> books = bookService.getAll();
//使用pageinfo包装查询后的结果
//将pageinfo交给页面，封装了详细的信息
        PageInfo page = new PageInfo(books,5);
//传入连续的页数，这里传入5页
        model.addAttribute("PageInfo",page);
        return "list";
    }


    @RequestMapping(value = "/books",method = RequestMethod.POST)
    @ResponseBody
    public Msg savaBook(Book book){
        bookService.saveBook(book);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value = "/checkisbn",method = RequestMethod.POST)
    public Msg checkIsbn(@RequestParam("bisbn" )String bisbn){
        boolean b =bookService.checkIsbn(bisbn);
        if(b){return Msg.success();}
        else return Msg.fail();
    }

//获取单个book对象数据
    @RequestMapping(value = "/books/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getbook(@PathVariable("id") Integer id){
        Book book = bookService.getbook(id);
        return Msg.success().add("book",book);
    }
/**
 * 更新信息
 */
    @ResponseBody
    @RequestMapping(value = "/books/{id}", method = RequestMethod.PUT)
    public Msg UpdateBook(@PathVariable("id") Integer id,Book book){
        book.setBid(id);
        bookService.updateBook(book);
        return Msg.success();
    }


    /**
     * 删除信息
     */
    @ResponseBody
    @RequestMapping(value = "/books/{id}",method = RequestMethod.DELETE)
    public Msg DeleteBook(@PathVariable("id") Integer id){
        bookService.DeleteBook(id);
        return Msg.success();
    }

    @RequestMapping(value = "/search/{msg}",method = RequestMethod.GET)
    @ResponseBody
    public Msg SearchBooks(@RequestParam(value = "pn",defaultValue = "1")Integer pn, Model model,@PathVariable("msg") String msg){
        //引入pagerHelper分页插件
        //在查询前传入页码和数据量
        PageHelper.startPage(pn,5);
        //后面紧跟分页
        List<Book> books = searchService.SearchByAll(msg);
        //使用pageinfo包装查询后的结果
        //将pageinfo交给页面，封装了详细的信息
        PageInfo page = new PageInfo(books,5);
        System.out.println(books.size());
        page.setTotal(books.size());
        //传入连续的页数，这里传入5页
        model.addAttribute("PageInfo",page);
        return Msg.success().add("PageInfo",page);
    }

}
