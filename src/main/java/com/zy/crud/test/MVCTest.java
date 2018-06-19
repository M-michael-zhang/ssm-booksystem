package com.zy.crud.test;
//使用spring-test的测试请求功能，测试crud正确性

import com.github.pagehelper.PageInfo;
import com.zy.crud.bean.Book;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:spring-mvc.xml"})
public class MVCTest {
//    传入springmvc的ioc
    @Autowired
    WebApplicationContext context;
    //虚拟mvc请求，获取处理结果
    MockMvc mockMvc;

    @Before
    public void initMockMvc(){
        mockMvc=MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        //模拟拿到返回值
        MvcResult result= mockMvc.perform(MockMvcRequestBuilders.get("/books").param("pn","1")).andReturn();

        //请求成功以后，请请求域中有pageinfo，取出进行验证

        MockHttpServletRequest request = result.getRequest();
        PageInfo pi = (PageInfo) request.getAttribute("PageInfo");
        System.out.println("当前页码"+pi.getPageNum());
        System.out.println("总记录数"+pi.getTotal());
        System.out.println("连续显示的页码：");
        int[] nums = pi.getNavigatepageNums();
        for (int i : nums){
            System.out.print(" "+i);
        }

        List<Book> list = pi.getList();
        for (Book book : list){
            System.out.println("ID:"+book.getBid()+"==>Name:"+book.getBname());
        }
    }
}
