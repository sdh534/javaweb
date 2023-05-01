package study2.mapping2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test5danCommand implements Test5miInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dan = request.getParameter("dan")==null ? 1 : Integer.parseInt(request.getParameter("dan"));
		String gugudan = "";
		for(int i=1; i<=9; i++) {
			gugudan += dan + " * " + i + " = " + dan*i + "<br/>";  
		}
		request.setAttribute("gugudan", gugudan);
	}

}
