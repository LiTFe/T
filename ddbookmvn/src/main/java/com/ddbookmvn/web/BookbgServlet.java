package com.ddbookmvn.web;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddbookmvn.biz.BookBiz;
import com.ddbookmvn.biz.impl.BookBizImpl;
import com.ddbookmvn.model.Book;
import com.ddbookmvn.util.PageConstant;
@WebServlet("/bookbg")
public class BookbgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BookbgServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strCurrentPage=request.getParameter("currentPage");
		if(strCurrentPage==null) {
			strCurrentPage="1";
		}
		int currentPage=Integer.parseInt(strCurrentPage);
		String name=request.getParameter("name");
		String strSid=request.getParameter("sid")==null?"-1":request.getParameter("sid");
		int sid=Integer.parseInt(strSid);
		String strBid=request.getParameter("bid")==null?"-1":request.getParameter("bid");
		int bid=Integer.parseInt(strBid);
		BookBiz bookBiz=new BookBizImpl();
		List<Book> ls=bookBiz.findAll(currentPage,name,sid);
		int totalRow=bookBiz.totalRow(name,sid);
		int totalPage=totalRow%PageConstant.PAGE_SIZE==0?totalRow/PageConstant.PAGE_SIZE:totalRow/PageConstant.PAGE_SIZE+1;
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("ls", ls);
		request.setAttribute("bid", bid);
		request.setAttribute("sid",sid);
		request.getRequestDispatcher("bookbg.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
