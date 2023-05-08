package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class BoardDAO {
	// 싱클톤으로 선언된 DB연결객체(GetConn)을 연결한다.
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	BoardVO vo = null;

	// 게시글 전체 조회처리
	public ArrayList<BoardVO> getBoardList(int startIndexNo, int pageSize) {
		ArrayList<BoardVO> vos = new ArrayList<>();
		try {
//			sql = "select * from board order by idx desc limit ?, ?";
			sql = "select *, datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff "
					+ "from board order by idx desc limit ?,?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
				
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDay_diff(rs.getInt("day_diff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

	//게시글 저장하기
	public int setBoardInputOk(BoardVO vo) {
		int res = 0;
		
		try {
			sql = "insert into board values (default, ?, ?, ?, ?, ?, ?,default,?,?,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getHomePage());
			pstmt.setString(6, vo.getContent());
			pstmt.setString(7, vo.getHostIp());
			pstmt.setString(8, vo.getOpenSw());
			pstmt.executeUpdate();
			res=1;
		} catch(SQLException e) {
			
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	public int getTotRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt");
		}catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

	//게시글 1건 가져오기 
	public BoardVO getBoardContent(int idx) {
		BoardVO vo = new BoardVO();
		try {
			sql = "select * from board where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			
			vo.setIdx(rs.getInt("idx"));
			vo.setMid(rs.getString("mid"));
			vo.setNickName(rs.getString("nickName"));
			vo.setTitle(rs.getString("title"));
			vo.setEmail(rs.getString("email"));
			vo.setHomePage(rs.getString("homePage"));
			vo.setContent(rs.getString("content"));
			vo.setReadNum(rs.getInt("readNum"));
			vo.setHostIp(rs.getString("hostIp"));
			vo.setOpenSw(rs.getString("openSw"));
			vo.setwDate(rs.getString("wDate"));
			vo.setGood(rs.getInt("good"));
			
		}catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return vo;
	}

	//조회수
	public void setReadNumUpdate(int idx) {
		try {
			sql = "update board set readNum = readNum+1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			getConn.pstmtClose();
		}
	}
	//좋아요 
	public void setGoodUpdate(int idx) {
		try {
			sql = "update board set good = good+1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			getConn.pstmtClose();
		}
		
	}

	public int getWriteNum(String mid, String nickName) {
		int res = 0;
		try {
			sql = "select count(*) as cnt from board where (mid=? or nickName=?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, nickName);
			rs = pstmt.executeQuery();
			rs.next();
			
			res = rs.getInt("cnt");
		}catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return res;
	}

	public ArrayList<BoardVO> getBoardListSearch(int startIndexNo, int pageSize, String mid) {
		ArrayList<BoardVO> vos = new ArrayList<>();
		try {
//			sql = "select * from board order by idx desc limit ?, ?";
			sql = "select *, datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff "
					+ "from board where mid=? order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			System.out.println(mid);
			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
				
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDay_diff(rs.getInt("day_diff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}
	
	
}
