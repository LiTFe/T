package com.ddbookmvn.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ddbookmvn.biz.SmallTypeBiz;
import com.ddbookmvn.biz.impl.SmallTypeBizImpl;
import com.ddbookmvn.model.SmallType;
import com.ddbookmvn.util.MyBeanUtils;

@WebServlet("/smallTypeAdd")
public class SmallTypeAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public SmallTypeAddServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SmallType smallType=new SmallType();
		MyBeanUtils.populate(smallType,request.getParameterMap());
		SmallTypeBiz smallTypeBiz=new SmallTypeBizImpl();
		boolean ret=smallTypeBiz.save(smallType);
		if(ret) {
			response.sendRedirect("main.jsp");
		}else{
			request.setAttribute("smallType", smallType);
			request.getRequestDispatcher("/smallTypeAdd.jsp").forward(request, response);
		}
	}

}
