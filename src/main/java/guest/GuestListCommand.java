package guest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuestListCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		
		// 1 . 현재 페이지 번호를 구한다. 
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		// 2 . 한 페이지의 분량을 결정 - 실습예제: 5회
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		
		// 3. 총 레코드 건수를 구한다
		int totRecCnt = dao.getTotRecCnt();
		
		// 4. 총 페이지 건수를 구한다
		int totPage = (totRecCnt % pageSize)==0 ? (totRecCnt/pageSize) : (totRecCnt/pageSize)+1;
		
		// 5. 현재 페이지의 "시작 인덱스" 번호 구하기 
		int startIndexNo = (pag - 1) * pageSize;
		
//		// 6. 현재 화면에 표시할 시작 번호를 구한다 (얘는 삭제 구현할 때) 
		int curScrStartNo = totRecCnt - startIndexNo;
		
		// 지정된 페이지의 자료를 요청한 한 페이지 분량만큼 가져온다 
		ArrayList<GuestVO> vos = dao.getGuestList(startIndexNo, pageSize);
		
		
		//블록 페이징 처리 << 1 2 3 >> 블록의 시작번호를 0부터 처리한다
		// 1. 블록의 크기를 결정한다 - 실습예제: 1 block 크기는 3
		int blockSize = 3;
		
		// 2. 현재 페이지가 속한 블록번호를 구한다. (예: 1페이지-0블록, 2페이지-0블록, 4~6페이지-1블록...)
		int curBlock = (pag - 1) / blockSize;
		
		// 3. 마지막 블록을 구한다.
		int lastBlock = (totPage - 1) / blockSize;
		
		
		request.setAttribute("vos", vos);
		request.setAttribute("pag", pag); //다음 페이지 누를 때 필요하도록
		request.setAttribute("pageSize", pageSize); //다음 페이지 누를 때 필요하도록
		request.setAttribute("totPage", totPage); //전체 페이지가 몇인지 알 수 있도록
		request.setAttribute("curScrStartNo", curScrStartNo); //화면에 몇 페이지부터 뿌릴지 알아야 하므로 
		request.setAttribute("curBlock", curBlock); //화면에 몇 페이지부터 뿌릴지 알아야 하므로 
		request.setAttribute("lastBlock", lastBlock); //화면에 몇 페이지부터 뿌릴지 알아야 하므로 
		request.setAttribute("blockSize", blockSize); //화면에 몇 페이지부터 뿌릴지 알아야 하므로 
		
	}

}
