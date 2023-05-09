package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardGoodCheckCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		BoardDAO dao = new BoardDAO();
		
	// 글 조회수 1증가시키기- 중복방지: 세션을 하나만 발생시켜서 들어간 정보를 전부 저장(객체배열)
		// ArrayList로 선언해서 세션에 저장 - 'board'+고유번호 값을 객체 배열(ArrayList)에 저장한다
		HttpSession session = request.getSession();
		
		//객체배열에 게시글의 Idx 번호를 저장, 없을시 생성
		ArrayList<String> contentIdx= (ArrayList) session.getAttribute("sContentIdx");
		if(contentIdx == null) { //세션에 존재하지 않을경우 새로 생성해줌
			contentIdx = new ArrayList<>();
		}
		String imsiContentIdx = "boardGood" + idx; //게시판의 좋아요 값을 저장해주는 임시변수
		
		if(!contentIdx.contains(imsiContentIdx)) { //해당 임시변수가 배열에 존재하지 않으면 
			dao.setGoodUpdate(idx);
			contentIdx.add(imsiContentIdx); //객체 배열에 board+idx 를 집어넣음 
			session.setAttribute("sContentIdx", contentIdx);  
		}
			
			
		//현재 선택된 게시글(idx)에 전체내용 가져오기
		BoardVO vo = dao.getBoardContent(idx);
			
		
		
		request.setAttribute("vo", vo);
	}

}
