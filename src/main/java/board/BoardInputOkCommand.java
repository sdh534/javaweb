package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardInputOkCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
		String nickName = session.getAttribute("sNickName")==null ? "" : (String) session.getAttribute("sNickName");
		
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage")==null ? "" : request.getParameter("homePage");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
		String openSw = request.getParameter("openSw")==null ? "" : request.getParameter("openSw");
		
		BoardVO vo = new BoardVO();
		
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setHostIp(hostIp);
		vo.setOpenSw(openSw);
		
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoardInputOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "게시글이 등록되었습니다.");
			request.setAttribute("url", request.getContextPath()+"/BoardList.bo");
		}
		else {
			request.setAttribute("msg", "게시글이 등록실패~~");
			request.setAttribute("url", request.getContextPath()+"/BoardInput.bo");
		}
	}

}
