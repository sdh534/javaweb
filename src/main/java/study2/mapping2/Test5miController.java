package study2.mapping2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.mapping.Test5Service;

@SuppressWarnings("serial")
@WebServlet("*.mi")
public class Test5miController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Test5miInterface command = null;
		String viewPage = "/WEB-INF/study2/mapping2";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		
		if(com.equals("/Test5")) {
			viewPage += "/test5.jsp";
		}
		else if(com.equals("/Test5_2")) {
			viewPage += "/test5_2.jsp";
		}
		else if(com.equals("/Test5_3")) {
			command = new Test5danCommand();
			command.execute(request, response);
			viewPage += "/test5_3.jsp";
		}
		else if(com.equals("/Test5_4")) {
			//메시지 처리하는 작업을 진행
			command = new Test5MsgCommand(); //가운데만 필요한 이름으로 바꿔주는 식으로 무한객체뽑기이
			command.execute(request, response);
			viewPage += "/test5_4.jsp";
		}
		else if(com.equals("/Test5_5")) {
			command = new Test5miCommand();  //인터페이스의 구현객체가 됨
			command.execute(request, response);
			viewPage += "/test5_5.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
