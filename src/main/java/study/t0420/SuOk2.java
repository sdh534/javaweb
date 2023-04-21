package study.t0420;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/t0420/SuOk2")
public class SuOk2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String a[] = request.getParameterValues("su");
		int su[] = new int[a.length]; //문자형 배열을 정수형 배열로 담기 위해서 ~
		request.setAttribute("a", a);
		
		
		Arrays.sort(su); //정렬
		
		request.setAttribute("su", su);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0420/self/suRes.jsp");
		dispatcher.forward(request, response);
	}
}
