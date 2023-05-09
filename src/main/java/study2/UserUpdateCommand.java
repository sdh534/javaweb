package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study2.ajax2.UserDAO;
import study2.ajax2.UserVO;

public class UserUpdateCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		
		//세션에서 아이디 가져오기 (조회한 값이랑 같은지)
		HttpSession session = request.getSession();
		String sMid = (String) session.getAttribute("sMid");
		
		UserVO vo = new UserVO();
		
		vo.setMid(mid);
		vo.setName(name);
		vo.setAge(age);
		vo.setAddress(address);
		
		UserDAO dao = new UserDAO();
		String res = dao.getMidSearch(mid); //아이디 중복검사
		//수정을 위해 사용자가 입력한 값과 sMid가 같은 경우 
		if(sMid.equals(mid)) {
			//아이디 중복검사를 했을 때 동일 아이디가 존재하면 빠꾸
			if(res.equals("0")) response.getWriter().write("아이디가 중복되었습니다.");
			//없으면 갱신해주기
			else {
				dao.setUserUpdate(vo);
				response.getWriter().write("수정이 완료되었습니다.");
			}
		}
		
		
	}

}
