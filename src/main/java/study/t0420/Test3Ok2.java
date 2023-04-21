package study.t0420;
//서블릿에서 뷰까지 처리 
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Test3Ok2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		
		String[] hobbys = request.getParameterValues("hobby");
		String strHobby ="";
		for(String hobby: hobbys) strHobby+=hobby + "/";
		strHobby=strHobby.substring(0,strHobby.length()-1);
		
		System.out.println("성명: " + name);
		System.out.println("나이: " + age);
		System.out.println("성별: " + gender);
		System.out.println("취미: " + strHobby);
		
		//DB에 자료 저장후 view로 이동 
		PrintWriter out = response.getWriter();
		out.print("<script>");
		out.print("alert('자료가 저장되었습니다!');");
		out.print("location.href='"+request.getContextPath()+"/study/0420/test3.jsp';");
		out.print("</script>");
	}
}
