package com.ddbookmvn.biz;

import java.util.List;

import com.ddbookmvn.model.Book;

public interface BookBiz {

	boolean save(Book book);
	List<Book> findAll(int currentPage, String name, int sid);
	int totalRow(String name, int sid);
	int delById(int id);
	Book findBookById(int id);
	boolean update(Book book);

}
