package com.dt59.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dt59.dao.impl.BizDaoImpl;
import com.dt59.entity.User;
import com.dt59.service.impl.BizServiceImpl;
import com.dt59.util.TokenUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	    super.destroy();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		String uname= request.getParameter("uname");
		String upwd= request.getParameter("upwd");
		User user=new User(uname,upwd);
		//user.setUname(uname);
		//user.setUpwd(upwd);
		BizDaoImpl bizdao=new BizDaoImpl();
		BizServiceImpl bsi=new BizServiceImpl();
		bsi.setBizdao(bizdao);
		boolean flag=bsi.validateUser(user);		
		PrintWriter out= response.getWriter();		
		if(flag){
			HttpSession session= request.getSession();
			
			session.setMaxInactiveInterval(60*60);
			TokenUtil tu=TokenUtil.getInstance();
			String server_token=tu.get_token();
			session.setAttribute("server_token", server_token);
			session.setAttribute("loginName", uname);
			response.sendRedirect("init");
		}else{
			out.print("<script>");
			out.print("alert('密码与用户名错误');");
			out.print("window.location.href='init';");			
			out.print("</script>");
			out.flush();
			out.close();
		}
	}

}
