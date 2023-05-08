package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BoardListSearch implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		String mid = request.getParameter("mid");
		
		
		// 페이징처리...
    int pag = request.getParameter("pag")==null ? 1: Integer.parseInt(request.getParameter("pag")); 
    int pageSize = request.getParameter("pageSize")==null ? 3: Integer.parseInt(request.getParameter("pageSize")); 
    int totRecCnt = dao.getTotRecCnt();
    int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize :  totRecCnt/pageSize + 1;
    int startIndexNo = (pag - 1) * pageSize;
//    int screenNo = totRecCnt - startIndex;
    ArrayList<BoardVO> vos = dao.getBoardListSearch(startIndexNo, pageSize, mid);
    
   
    request.setAttribute("vos", vos);
    request.setAttribute("pag", pag);
    request.setAttribute("pageSize", pageSize);
    request.setAttribute("totRecCnt", totRecCnt);
    request.setAttribute("totPage", totPage);
    request.setAttribute("startIndex", startIndexNo);
		// 블록페이징처리...
    int blockSize = 3;
    int nowBlock = (pag - 1)/blockSize;
    int lastBlock = (totPage - 1)/blockSize;
    //블록 페이징 처리 << 1 2 3 >> 
    System.out.println(pageSize + "/"+ totPage+ "/"+ nowBlock + "/"+ lastBlock);

    request.setAttribute("blockSize", blockSize);
    request.setAttribute("lastBlock", lastBlock);
    request.setAttribute("nowBlock", nowBlock);
	}

}
