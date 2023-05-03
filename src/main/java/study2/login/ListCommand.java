package study2.login;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ListCommand implements LoginInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LoginDAO dao = new LoginDAO();
		 // 1 현재 페이지 번호 구하기 / 기본값은 1
    int pag = request.getParameter("pag")==null ? 1: Integer.parseInt(request.getParameter("pag")); 
    
    // 2 한 페이지에 띄울 내용의 수 정하기 / 기본값은 5 
    int pageSize = request.getParameter("pageSize")==null ? 3: Integer.parseInt(request.getParameter("pageSize")); 
    
    // 3 총 레코드 수 구하기
    int totRecCnt = dao.getTotRecCnt();
    
    
    // 4 총 페이지의 수 구하기 - 총 레코드 수 / 한 페이지에 띄울 컨텐트의 수를 했을 때 나머지가 0이면 그 값을, 나머지가 0이 아니라면 그 값에 +1 한 값이 전체 페이지의 수 
    int totPage = (totRecCnt % pageSize)==0 ? totRecCnt/pageSize :  totRecCnt/pageSize + 1;
    
    // 5 현재 페이지의 시작 인덱스 번호 구하기
    // pageSize가 3인 경우  페이지 번호는 1,2,3 / 4,5,6 / 7,8,9... 가 된다
    //                     인덱스 번호는 "0",1,2 / "3",4,5 / "6",7,8 
    // 인덱스 값을 기준으로 pageSize만큼 가져오면 됨
    int startIndexNo = (pag - 1) * pageSize;
    
    // 내일 삭제 구현하면..
//    int screenNo = totRecCnt - startIndex;
    
    //지정 페이지의 자료를 원하는 만큼만 가져온다
    
    ArrayList<LoginVO> vos = dao.getLoginList(startIndexNo, pageSize);
    
    //블록 페이징 처리 << 1 2 3 >> 
    //1 블록 크기 결정 
    int blockSize = 3;
    //2 현재 페이지가 위치한 블록 번호 구하기
    //ex - 1~3페이지: 0블록, 4~6페이지: 1블록
    int nowBlock = (pag - 1)/blockSize;
    //3 마지막 블록 구하기
    int lastBlock = (totPage - 1)/blockSize;
    System.out.println(pageSize + "/"+ totPage+ "/"+ nowBlock + "/"+ lastBlock);
    request.setAttribute("vos", vos);
    request.setAttribute("pag", pag);
    request.setAttribute("pageSize", pageSize);
    request.setAttribute("totRecCnt", totRecCnt);
    request.setAttribute("totPage", totPage);
    request.setAttribute("startIndex", startIndexNo);
    request.setAttribute("blockSize", blockSize);
    request.setAttribute("lastBlock", lastBlock);
    request.setAttribute("nowBlock", nowBlock);
	}

}
