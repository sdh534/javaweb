package study2;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import study2.ajax2.UserDAO;
import study2.ajax2.UserVO;

public class UserSearchCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		UserDAO dao = new UserDAO();
		String str = "";
		UserVO vo = dao.getUserSearch(idx);
		
		HashMap<String, String> map = new HashMap<>();
		
		map.put("mid", vo.getMid());
		map.put("name", vo.getName());
		map.put("age", vo.getAge()+"");
		map.put("address", vo.getAddress());

		HttpSession session = request.getSession();
		session.setAttribute("sMid", vo.getMid());
		
		JSONObject memberObj= new JSONObject(map);
		
		str = memberObj.toJSONString();
		
		response.getWriter().write(str);
	}

}
