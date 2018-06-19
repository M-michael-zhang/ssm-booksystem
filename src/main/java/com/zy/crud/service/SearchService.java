package com.zy.crud.service;

import com.zy.crud.bean.Book;
import com.zy.crud.bean.BookExample;
import com.zy.crud.dao.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SearchService {
    public SearchService() {
    }

    @Autowired
    BookMapper bookMapper;

    public List<Book> SearchByName(String msg) {
        System.out.println(bookMapper);
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andBnameEqualTo(msg);
        List<Book> list= bookMapper.selectByExample(bookExample);
        System.out.println("this is namea ");
        for (Book o:list){
            System.out.print(o.getBid()+"  ");
        }
        return list;
    }

    public List<Book> SearchByAuthor(String msg) {
        System.out.println(bookMapper);
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andBauthorEqualTo(msg);
        List<Book> list= bookMapper.selectByExample(bookExample);
        System.out.println("this is author");
        for (Book o:list){
            System.out.print(o.getBid()+"  ");
        }
        return list;
    }

    public List<Book> SearchByPress(String msg) {
        System.out.println(bookMapper);
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andBpressEqualTo(msg);
        List<Book> list= bookMapper.selectByExample(bookExample);
        System.out.println("this is press");
        for (Book o:list){
            System.out.print(o.getBid()+"  ");
        }
        return list;
    }






    public List<Book> SearchByIsbn(String msg) {
        System.out.println(bookMapper);
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andBisbnEqualTo(msg);
        List<Book> list= bookMapper.selectByExample(bookExample);
        System.out.println("this is isbn");
        for (Book o:list){
            System.out.print(o.getBid()+"  ");
        }
        return list;
    }

    public List<Book> SearchByAll(String msg){
        List<Book> list =SearchByAuthor(msg);
        list.addAll(SearchByName(msg));
        list.addAll(SearchByPress(msg));
        list.addAll(SearchByIsbn(msg));
        for (Book o:list){
            System.out.print(o.getBid()+"  ");
        }
        return list;
    }


}
