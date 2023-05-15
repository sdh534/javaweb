package study2.pdstest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class FileUpLoad2OkCommand2 implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		int maxSize = 1024 * 1024 * 10; // 서버에 저장할 최대용량을 10MB로 저장한다. (1회 저장 용량)
		String encoding = "utf-8";
		
		//파일 업로드 처리 (객체가 생성되면서 파일이 자동업로드)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		String originalFileName = "";
		String filesystemName = "";
		for(int i=1; i<=3; i++) {
			originalFileName = multipartRequest.getOriginalFileName("fName"+i);
			filesystemName = multipartRequest.getFilesystemName("fName"+i);
			System.out.println("원본 파일명: " + originalFileName);
			System.out.println("서버의 저장 경로 : "+realPath);
			System.err.println("서버에 저장된 파일명 : " + filesystemName);
		}
		
		if (!originalFileName.equals("")) {
			request.setAttribute("msg", "파일이 업로드 되었습니다.");
			System.out.println(filesystemName);
		}
		
		else {
			request.setAttribute("msg", "파일 업로드 실패!");
		}
		request.setAttribute("url", request.getContextPath()+"/pdstest/FileUpload2.st");
	}

}
