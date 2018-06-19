package com.zy.crud.test;

import com.zy.crud.bean.Book;
import com.zy.crud.bean.BookExample;
import com.zy.crud.dao.BookMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

/**
 * @author ZhouXiaoyu
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    List<Book> list;
    @Autowired
    BookMapper bookMapper;


    @Autowired
    SqlSession sqlSession;


    public List<Book> SearchByName(String msg) {
        System.out.println(bookMapper);
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andBnameEqualTo(msg);
        List<Book> list= bookMapper.selectByExample(bookExample);
        System.out.println("this is name ");
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
        System.out.println("this is author ");
        for (Book o:list){
            System.out.print(o.getBid()+"  ");
        }
        return list;
    }
    @Test
    public void SearchByAll(){
        String msg = "michael";
        list =SearchByAuthor(msg);
        list.addAll(SearchByName(msg));
        for (Book o:list){
            System.out.print(o.getBid());
        }
    }

    public List<Book> getList() {
        return list;
    }
}
