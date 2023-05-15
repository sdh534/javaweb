package study2;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownLoadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		
		String[] files = new File(realPath).list(); //list로 쓰면 여러개, 배열로 불러와야 함 
		
		for(String file : files) {
			System.out.println("file : " + file);
		}
		
		request.setAttribute("files", files);
	}

}
