package com.zy.crud.service;

import com.zy.crud.bean.Book;
import com.zy.crud.bean.BookExample;
import com.zy.crud.bean.Msg;
import com.zy.crud.dao.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {


    @Autowired
    BookMapper bookMapper;

    public List<Book> getAll() {
        return bookMapper.selectByExample(null);
    }

    public void saveBook(Book book) {
        bookMapper.insertSelective(book);
    }

    /**
     *
     * 检查ISBN是否可用
     * @return
     */
    public boolean checkIsbn(String bisbn) {
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andBisbnEqualTo(bisbn);
        long count = bookMapper.countByExample(bookExample);
        return count==0;
    }

    public Book getbook(Integer id) {
        Book book =bookMapper.selectByPrimaryKey(id);
        return book;
    }

    public void updateBook(Book book) {
        bookMapper.updateByPrimaryKeySelective(book);
    }

    public void DeleteBook(Integer id) {
        bookMapper.deleteByPrimaryKey(id);
    }
}
