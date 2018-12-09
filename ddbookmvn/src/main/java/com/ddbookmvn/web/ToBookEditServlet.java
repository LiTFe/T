package com.ddbookmvn.web;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddbookmvn.biz.BookBiz;
import com.ddbookmvn.biz.SmallTypeBiz;
import com.ddbookmvn.biz.impl.BookBizImpl;
import com.ddbookmvn.biz.impl.SmallTypeBizImpl;
import com.ddbookmvn.model.Book;
@WebServlet("/toBookEdit")
public class ToBookEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ToBookEditServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strId=request.getParameter("id");
		int id= Integer.parseInt(strId);
		BookBiz bookBiz=new BookBizImpl();
		Book book=bookBiz.findBookById(id);
		request.setAttribute("book", book);
		SmallTypeBiz smallTypeBiz=new SmallTypeBizImpl();
		int bid=smallTypeBiz.findBidById(book.getSid());
		request.setAttribute("bid", bid);
		request.getRequestDispatcher("bookEdit.jsp").forward(request, response);;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
