package com.ddbookmvn.biz.impl;

import java.util.List;

import com.ddbookmvn.biz.BookBiz;
import com.ddbookmvn.dao.BookDao;
import com.ddbookmvn.dao.impl.BookDaoJdbcImpl;
import com.ddbookmvn.model.Book;

public class BookBizImpl implements BookBiz {

	@Override
	public boolean save(Book book) {
		BookDao bookDao=new BookDaoJdbcImpl();
		return bookDao.saven(book);
	}

	@Override
	public List<Book> findAll(int currentPage,String name,int sid) {
		BookDao bookDao=new BookDaoJdbcImpl();
		return bookDao.findAll(currentPage,name,sid);
	}

	@Override
	public int totalRow(String name,int sid) {
		BookDao bookDao=new BookDaoJdbcImpl();
		return bookDao.total(name,sid);
	}

	@Override
	public int delById(int id) {
		BookDao bookDao=new BookDaoJdbcImpl();
		return bookDao.de(id);
	}

	@Override
	public Book findBookById(int id) {
		BookDao bookDao=new BookDaoJdbcImpl();
		return bookDao.find(id);
	}

	@Override
	public boolean update(Book book) {
		BookDao bookDao=new BookDaoJdbcImpl();
		return bookDao.update(book);
	}

}
