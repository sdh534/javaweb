package study2.pdstest;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpLoad2OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		int maxSize = 1024 * 1024 * 10; // 서버에 저장할 최대용량을 10MB로 저장한다. (1회 저장 용량)
		String encoding = "utf-8";
		
		//파일 업로드 처리 (객체가 생성되면서 파일이 자동업로드)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		//열거형 형식으로 데이터를 따로따로 꺼내보기 
		Enumeration fileNames = multipartRequest.getFileNames();
		String originalFileName = "";
		String filesystemName = "";
		String file = "";
		
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			originalFileName = multipartRequest.getOriginalFileName(file);
			filesystemName =  multipartRequest.getFilesystemName(file);
			System.out.println("원본 파일명: " + originalFileName);
			System.out.println("서버의 저장 경로 : "+realPath);
			System.err.println("서버에 저장된 파일명 : " + filesystemName);
		}
		
		if (!originalFileName.equals("")) {
			request.setAttribute("msg", "파일이 업로드 되었습니다.");
		}
		
		else {
			request.setAttribute("msg", "파일 업로드 실패!");
		}
		request.setAttribute("url", request.getContextPath()+"/pdstest/FileUpload2.st");
	}

}
