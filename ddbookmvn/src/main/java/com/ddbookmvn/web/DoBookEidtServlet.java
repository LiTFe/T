package com.ddbookmvn.web;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.ddbookmvn.biz.BookBiz;
import com.ddbookmvn.biz.impl.BookBizImpl;
import com.ddbookmvn.model.Book;
import com.ddbookmvn.util.MyBeanUtils;
@WebServlet("/doBookEdit")
public class DoBookEidtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DoBookEidtServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Book book=new Book();
		MyBeanUtils.populate(book, request.getParameterMap(), "yyyy-MM-dd");
		String newFile=null;
		Part part=request.getPart("photo");
		if(part.getHeader("Content-Disposition").contains("; filename=")) {
			if(part.getSubmittedFileName()!=null&&!part.getSubmittedFileName().equals("")) {
				String ext=part.getSubmittedFileName().substring(part.getSubmittedFileName().lastIndexOf(".")+1);
				newFile=UUID.randomUUID()+"."+ext;
				part.write(request.getServletContext().getRealPath("/upload/"+newFile));;
			}
		}
		book.setPhoto(newFile);
		BookBiz bookBiz=new BookBizImpl();
		boolean ret=bookBiz.update(book);
		if(ret) {
			response.sendRedirect("bookbg");
		}else {
			request.setAttribute("book", book);
			request.getRequestDispatcher("bookbg.jsp").forward(request, response);
		}
	}
	}

