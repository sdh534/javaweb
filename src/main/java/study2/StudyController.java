package study2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study2.password.PassOk1Commond;
import study2.password.PassOk2Commond;
import study2.pdstest.FileUpLoad1OkCommand;
import study2.pdstest.FileUpLoad2OkCommand;
import study2.pdstest.FileUpLoad3OkCommand;
import study2.pdstest.FileUpLoad4OkCommand;
import study2.uuid.UuidCommand;

@SuppressWarnings("serial")
@WebServlet("*.st")
public class StudyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String viewPage = "/WEB-INF/study2";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		// 세션이 끈겼다고한다면 작업의 진행을 중지시키고 홈으로 전송한다.
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
				
		if(level > 4) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}
		
		else if(com.equals("/Password")) {
			viewPage += "/password/password.jsp";
		}
		else if(com.equals("/PassOk1")){
			command = new PassOk1Commond();
			command.execute(request, response);
			viewPage += "/password/password.jsp";
		}
		else if(com.equals("/PassOk2")){
			command = new PassOk2Commond();
			command.execute(request, response);
			viewPage += "/password/password2.jsp";
		}
		else if(com.equals("/UuidForm")){
			viewPage += "/uuid/uuidForm.jsp";
		}
		else if(com.equals("/Uuid")){
			command = new UuidCommand();
			command.execute(request, response);
			viewPage += "/uuid/uuidOk.jsp";
		}
		else if(com.equals("/AjaxTest1")){
			viewPage += "/ajax/ajaxTest1.jsp";
		}
		else if(com.equals("/UserList")){
			command = new UserListCommand();
			command.execute(request, response);
			viewPage += "/ajax2/userList.jsp";
		}
		else if(com.equals("/UserInput")){
			command = new UserInputCommand();
			command.execute(request, response);
			return; //백단에서 처리하고 끝내야함 
		}
		else if(com.equals("/UserDel")){
			command = new UserDeleteCommand();
			command.execute(request, response);
			return; //백단에서 처리하고 끝내야함 
		}
		else if(com.equals("/UserSearch")){
			command = new UserSearchCommand();
			command.execute(request, response);
			return; //백단에서 처리하고 끝내야함 
		}
		else if(com.equals("/UserUpdate")){
			command = new UserUpdateCommand();
			command.execute(request, response);
			return; //백단에서 처리하고 끝내야함 
		}
		else if(com.equals("/FileUpload1")){
			viewPage += "/pdstest/upLoad1.jsp";
		}
		else if(com.equals("/FileUpload1OK")){
			command = new FileUpLoad1OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileUpload2")){
			viewPage += "/pdstest/upLoad2.jsp";
		}
		else if(com.equals("/FileUpload2OK")){
			command = new FileUpLoad2OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileUpload3")){
			viewPage += "/pdstest/upLoad3.jsp";
		}
		else if(com.equals("/FileUpLoad3Ok")){
			command = new FileUpLoad3OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/FileUpLoad4")){
			viewPage += "/pdstest/upLoad4.jsp";
		}
		else if(com.equals("/FileUpLoad4Ok")){
			command = new FileUpLoad4OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/DownLoad")){
			command = new DownLoadCommand();
			command.execute(request, response);
			viewPage += "/pdstest/downLoad.jsp";
		}
		else if(com.equals("/DownLoad")){
			command = new DownLoadCommand();
			command.execute(request, response);
			viewPage += "/pdstest/downLoad.jsp";
		}
		else if(com.equals("/FileDownLoad")){
			command = new FileDownLoadCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/FileDelete")){
			command = new FileDeleteCommand();
			command.execute(request, response);
			return;
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
