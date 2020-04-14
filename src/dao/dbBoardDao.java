package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.dbBoardDataBean;


public class dbBoardDao {

	private static dbBoardDao instance = new dbBoardDao();

	public static dbBoardDao getInstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Connection con = null;
		try {
			String jdbcUrl = "jdbc:mysql://localhost:3306/jspdb";
			String dbId = "scott";
			String dbPass = "1111";
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public void insertArticle(dbBoardDataBean article) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int num = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select ifnull(max(num)+1,1) from lecture");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}

			pstmt = conn.prepareStatement("insert into lecture values (?,?,?,?,?)");
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getTeacher());
			pstmt.setString(3, article.getSubject_name());
			pstmt.setString(4, article.getClass_name());
			pstmt.setString(5, article.getFilename());
			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
	}

	public int getArticleCount(String teacher,String subject_name) {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select ifnull(count(*),0) from lecture where teacher=? and subject_name= ?");
			pstmt.setString(1, teacher);
			pstmt.setString(2, subject_name);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return count;
	}

	public List<dbBoardDataBean> getArtcles(int startRow, int endRow,String teacher,String subject_name) {
		List articleList = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		startRow = startRow - 1;
		endRow = endRow - startRow;
		System.out.println("dao===" + startRow + ":" + endRow);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from lecture where teacher=? and subject_name= ? order by num desc limit ?, ?");
			pstmt.setString(1, teacher);
			pstmt.setString(2, subject_name);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList<dbBoardDataBean>();
				do {
					dbBoardDataBean article = new dbBoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setTeacher(rs.getString("teacher"));
					article.setSubject_name(rs.getString("subject_name"));
					article.setClass_name(rs.getString("class_name"));
					article.setFilename(rs.getString("filename"));
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		System.out.println(articleList);
		return articleList;
	}

	public String getTime(int num, String student_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbid = "";
		String time = "0";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select student_id from class where num = ? and student_id =?");
			pstmt.setInt(1, num);
			pstmt.setString(2, student_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbid = rs.getString("student_id");
				if (dbid.equals(student_id)) {
					pstmt = conn.prepareStatement("select video_time from class where student_id=? and num=?");
					pstmt.setString(1, student_id);
					pstmt.setInt(2, num);
					rs = pstmt.executeQuery();
					if (rs.next()) {
						time = rs.getString("video_time");
					}
				}
			} else {
				time = "0";
			}
		} catch (Exception ex) {
			ex.printStackTrace();

		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return time;
	}

	public String getVideo(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String filename = "";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select filename from lecture where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				filename = rs.getString("filename");
			}
		} catch (Exception ex) {
			ex.printStackTrace();

		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return filename;
	}
	
	public void insertTime(String video_time,int num, String student_id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select num,student_id from class where num = ? and student_id = ?");
			pstmt.setInt(1, num);
			pstmt.setString(2, student_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pstmt = conn.prepareStatement("update class set video_time=? where num = ? and student_id = ?");
				pstmt.setString(1, video_time);
				pstmt.setInt(2, num);
				pstmt.setString(3, rs.getString("student_id"));
				pstmt.executeUpdate();
			}else {
			pstmt = conn.prepareStatement("insert into class values (?,?,?)");
			pstmt.setInt(1, num);
			pstmt.setString(2, student_id);
			pstmt.setString(3, video_time);
			pstmt.executeUpdate();

		}} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
	}
}
