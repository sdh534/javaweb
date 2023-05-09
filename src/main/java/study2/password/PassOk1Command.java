package study2.password;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class PassOk1Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd").toUpperCase();
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		System.out.println("==원본 자료==");
		System.out.println("mid : " + mid);
		System.out.println("pwd : " + pwd);
		System.out.println("idx : " + idx);
		System.out.println();
		
		if(idx  == 1) {
			// 숫자만을 암호화 하는 경우 
			// 암호화를 위한 키 설정(0x1234ABCD)
			int key = 0x1234ABCD;
			
			// 암호화 ....(EOR(^) 암호화) 
			int encPwd, decPwd; //인코딩(암호화), 디코딩(복호화)
		
			encPwd = Integer.parseInt(pwd) ^ key;
			System.out.println("==암호화된 자료==");
			System.out.println("encPwd : " + encPwd);
			System.out.println("~~~~~~~~DB에 암호화된 비밀번호 저장~~~~~~~");
			System.out.println("암호화된 비밀번호를 DB에 저장시킨 후 ... 인증을 위해 다시 불러와서 디코딩처리한다");
			System.out.println();
			
			decPwd = encPwd ^ key;
			System.out.println("==복호화된 자료==");
			System.out.println("decPwd : " + decPwd);
			System.out.println();
			
		}
		else {
			System.out.println("1. 원본 비밀번호 : " + pwd);
			long longPwd;
			String strPwd = "";
			// 숫자/문자 복합 암호화...(영문 소문자 입력시 대문자로 변경해서 처리
			for(int i=0; i<pwd.length(); i++) {
				longPwd = pwd.charAt(i);
				strPwd += longPwd;
			}
			System.out.print("2.  아스키코드 문자로 변환된 비밀번호 : ");
			System.out.println("strPwd : " + strPwd);
			
			longPwd = Long.parseLong(strPwd);
			long encPwd, decPwd;
			long key = 0x1234ABCD;
			
			encPwd = longPwd ^ key;
			strPwd= String.valueOf(encPwd);
			System.out.println("3. 인코딩된 비밀번호로 DB에 저장시킬 비밀번호가 됨(DB 저장시 숫자로 해도 되지만 너무 길어지니까..)");
			System.out.println("~~~~~~~~~~~~~~~DB 저장중~~~~~~~~~~~~~~~");
			System.out.println("encPwd : " + encPwd);
			
			//DB에 저장된 암호를 다시 불러와서 복호화시키기 
			longPwd = Long.parseLong(strPwd);
			decPwd = longPwd ^ key;
			System.out.println("==복호화된 자료==");
			System.out.println("decPwd : " + decPwd);
			
			//복원된 비밀번호는 숫자니까 문자로 변환 후 2자리씩 분리 처리 시켜준다 
			strPwd = String.valueOf(decPwd);
			
			String res = "";
			char ch;
			for(int i=0; i<strPwd.length(); i=i+2) {
				ch = (char)Integer.parseInt(strPwd.substring(i, i+2));
				res += ch;
			}
			
			System.out.println("5. 최종적으로 복호화된 비밀번호 : " + res);
		}
	}

}
