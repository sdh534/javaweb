package study.t0420;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/t0420/SuOk")
public class SuOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String a[] = request.getParameterValues("su");
		int su[] = new int[a.length];
		
		String sort_before_su="";
		for(String atom : a) sort_before_su += atom+" / ";
		sort_before_su = sort_before_su.substring(0,sort_before_su.length()-3);
		request.setAttribute("sort_before_su", sort_before_su);
		
		for(int i=0; i<a.length; i++) {
			su[i] = Integer.parseInt(a[i]);
		}
		
		Arrays.sort(su); //정렬
		
		String sort_su="";
		for(int su_atom : su) sort_su+=su_atom+" / ";
		sort_su = sort_su.substring(0,sort_su.length()-3);
		System.out.println(sort_su);
		request.setAttribute("sort_su", sort_su);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/0420/self/suRes.jsp");
		dispatcher.forward(request, response);
	}
}
