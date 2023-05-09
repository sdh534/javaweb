package study2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.password.PassOk1Commond;
import study2.password.PassOk2Commond;
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
		
		if(com.equals("/Password")) {
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
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
