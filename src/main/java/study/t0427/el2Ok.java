package study.t0427;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/t0427/el2Ok")
public class el2Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "":request.getParameter("name");
		String[] hobbies = request.getParameterValues("hobby");
		String hobby_str = "";
		for(String hobby_atom : hobbies) {
			hobby_str += hobby_atom + " / ";
		}
		
		hobby_str = hobby_str.substring(0, hobby_str.length()-3);
		request.setAttribute("name", name);
		request.setAttribute("hobbies", hobbies);
		request.setAttribute("hobby_str", hobby_str);
		
		String viewpage = "/study/0427/el2.jsp";
		request.getRequestDispatcher(viewpage).forward(request, response);
	}
}
