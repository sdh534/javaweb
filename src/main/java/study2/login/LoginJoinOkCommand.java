package study2.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.PasswordSecurity;

public class LoginJoinOkCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd").toUpperCase();
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		
		// 비밀번호 암호화해서 돌려받기
		LoginDAO dao = new LoginDAO();
		int hashKeyCount = dao.getHashKeyCount();
		
		int randomKey = (int)(Math.random()*hashKeyCount)+1;
		
		PasswordSecurity passwordSecurity = new PasswordSecurity();
		pwd = passwordSecurity.passwordEncryption(pwd, randomKey);
		// 키와 키값을 조합해서 pwd를 다시 만들었다.
		pwd = randomKey + "_" + pwd;
		
		LoginVO vo = new LoginVO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		
		LoginVO vo2 = dao.getMidCheck(mid);
		
		String msg = "", url = "";
		if(vo2.getMid() != null) {
			// 아이디가 중복되었음.
			msg = "아이디가 중복되었습니다.";
			url = "/Join.re";
		}
		else {
			// 아이디가 중복되어 있지 않기에 DB에 정보를 저장시킨다.
			dao.setJoinOk(vo);
			msg = "회원 가입되었습니다.";
			url = "/Login.re";
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", request.getContextPath()+url);
	}

}
