package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/database/LoginOk")
public class LoginOk extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginCheck(mid, pwd);
		
		PrintWriter out = response.getWriter();
		
		if(vo.getName() != null) {
			// 회원 인증 성공시 처리...
			// 회원인증후 처리(1.자주사용하는자료를 세션에 저장(아이디,성명,닉네임))
			
			// 방문 포인트 처리하기('최종접속일처리'/'방문 카운트'도 함께)
			dao.setPointPlus(mid);
			
			// 1.세션처리
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sPoint", vo.getPoint()+10);
			session.setAttribute("sLastDate", vo.getLastDate());
			session.setAttribute("sTodayCount", vo.getTodayCount()+1);
			
			out.print("<script>");
			out.print("alert('"+mid+"님 로그인 되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/memberMain.jsp';");
			out.print("</script>");
		}
		else {
			// 회원 인증 실패시 처리...
			out.print("<script>");
			out.print("alert('로그인 실패~~');");
			out.print("location.href='"+request.getContextPath()+"/study/0428_database/login.jsp';");
			out.print("</script>");
		}
	}
}
