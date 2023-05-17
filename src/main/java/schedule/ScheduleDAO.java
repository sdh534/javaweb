package schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
import pds.PdsVO;

public class ScheduleDAO {
	// 싱클톤으로 선언된 DB연결객체(GetConn)을 연결한다.
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	ScheduleVO vo = null;

	// 선택된 날짜(년/월)의 개별회원에 대한 스케줄의 모든 정보를 가져오기
	public ArrayList<ScheduleVO> getSchedule(String mid, String ym, int sw) {
		ArrayList<ScheduleVO> vos = new ArrayList<>();
		try {
			if(sw == 0) {
			  sql = "select * from schedule where mid=? and date_format(sDate, '%Y-%m')=? order by sDate, part";
			}
			else {
				sql = "select * from schedule where mid=? and date_format(sDate, '%Y-%m-%d')=?";				
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, ym);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ScheduleVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setsDate(rs.getString("sDate"));
				vo.setPart(rs.getString("part"));
				vo.setContent(rs.getString("content"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

}
