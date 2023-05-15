package study2.pdstest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpLoad1OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * COS라이브러리에서 제공해주는 객체 : MultipartRequest() / DefaultFileRenamePolicy() <- 파일명 중복 제거(자동수정)
		 * 사용법 : MultipartRequest(저장소명(request), "서버에 저장될 파일의 경로", "서버에 저장될 파일의 최대 용량", "코드변환방식", 기타옵션(파일명중복방지처리))
		 * 
		 * ServletContext application = request.getServletContext();
		 * String realPath = request.getServletContext().getRealPath("/");
		 * */
		
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		
		int maxSize = 1024 * 1024 * 10; // 서버에 저장할 최대용량을 10MB로 저장한다. (1회 저장 용량)
		String encoding = "utf-8";
		
		//파일 업로드 처리 (객체가 생성되면서 파일이 자동업로드)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		
//		String fName = request.getParameter("fName")==null ? "" : request.getParameter("fName");
//		System.out.println("pdsTest에서 넘어온 파일 명 : " + fName);
		
		String originalFileName = multipartRequest.getOriginalFileName("fName");
		String filesystemName = multipartRequest.getFilesystemName("fName");
		
		System.out.println("원본 파일명: " + originalFileName);
		System.out.println("서버의 저장 경로 : "+realPath);
		System.err.println("서버에 저장된 파일명 : " + filesystemName);
		if (!originalFileName.equals("")) {
			request.setAttribute("msg", "파일이 업로드 되었습니다.");
			System.out.println(filesystemName);
		}
		
		else {
			request.setAttribute("msg", "파일 업로드 실패!");
		}
		request.setAttribute("url", request.getContextPath()+"/pdstest/FileUpload1.st");
	}

}
