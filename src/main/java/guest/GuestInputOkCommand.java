package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestInputOkCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String homePage = request.getParameter("homePage")==null ? "" : request.getParameter("homePage");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");

		name = name.replace("<", "&lt;");
		name = name.replace(">", "&gt;");
		
		GuestVO vo = new GuestVO();
		
		vo.setName(name);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		GuestDAO dao = new GuestDAO();
		int res = dao.setGuestInputOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "정상 등록 되었습니다.");
			request.setAttribute("url", request.getContextPath()+"/GuestList.gu");
		}
		else {
			request.setAttribute("msg", "등록 실패! 다시 시도해주세요.");
			request.setAttribute("url", request.getContextPath()+"/GuestInput.gu");
		}
	}

}
