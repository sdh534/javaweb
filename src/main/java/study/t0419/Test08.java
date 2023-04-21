package study.t0419;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/t8Get")
public class Test08 extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8"); //포스트는 헤더 때문에 깨지는게 맞?음
		
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		System.out.println("성명: " + name + ", 나이 : " + age);
		
		PrintWriter out = response.getWriter();
		out.print("성명 : " + name + "<br/>");
		out.print("나이 : " + age + "<br/>");
	}
}
