package team.elite.management;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import team.elite.db.DataBaseConnection; // 1,2 단계 로그인

public class ControlDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	/*
	 * public static Connection getConnection() throws Exception { Context ctx = new
	 * InitialContext(); Context j = (Context) ctx.lookup("java:comp/env");
	 * DataSource ds = (DataSource) j.lookup("jdbc/orcl"); Connection conn =
	 * ds.getConnection(); return conn; }------------------- 1,2단계 로그인을 import 했으니까
	 * 이부분은 주석처리.
	 */

	private static ControlDAO instance = new ControlDAO();

	public static ControlDAO getInstance() {
		return instance;
	}

	private ControlDAO() {

	}

	// 학생 DB 전송
	public void insert(Student_MembersDTO dto) {
		try {
			conn = DataBaseConnection.getConnection();
			String sql = "insert into student_members values(?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getStudent_id());
			pstmt.setString(2, dto.getStudent_name());
			pstmt.setString(3, dto.getPassword());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getStudent_pic());
			pstmt.executeUpdate(); // DB 에 업에이트
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
	}

	// 강사 DB 전송
	public void insert(Teacher_MembersDTO dto) {
		try {
			conn = DataBaseConnection.getConnection();
			String sql = "insert into teacher_members values(?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTeacher_id());
			pstmt.setString(2, dto.getTeacher_name());
			pstmt.setString(3, dto.getPassword());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getTeacher_pic());
			pstmt.executeUpdate(); // DB 에 업에이트
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
	}

	// 행정 DB 전송
	public void insert(Admin_MembersDTO dto) {
		try {
			conn = DataBaseConnection.getConnection();
			String sql = "insert into admin_members values(?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getAdmin_id());
			pstmt.setString(2, dto.getAdmin_name());
			pstmt.setString(3, dto.getPassword());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPhone());
			pstmt.setString(6, dto.getAdmin_pic());
			pstmt.executeUpdate(); // DB 에 업에이트
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
	}

	// Q&A DB 전송
	public void insert(QNADTO dto) {
		try {
			conn = DataBaseConnection.getConnection();
			String sql = "insert into qna values(?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getQna_seqno());
			pstmt.setString(2, dto.getUser_id());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContents());
			pstmt.setInt(5, dto.getRead_count());
			pstmt.setString(6, dto.getReg_ip());
			pstmt.setString(7, dto.getReg_id());

			pstmt.executeUpdate(); // DB 에 업에이트
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
	}

	// Notice DB 전송
	public void insert(NoticeDTO dto) {
		try {
			conn = DataBaseConnection.getConnection();
			String sql = "insert into notice values(?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNotice_seqno());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContents());
			pstmt.setInt(4, dto.getRead_count());
			pstmt.setString(5, dto.getReg_ip());
			pstmt.setString(6, dto.getReg_id());

			pstmt.executeUpdate(); // DB 에 업에이트
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
	}

	// Note DB 전송
	public void insert(NoteDTO dto) {
		try {
			conn = DataBaseConnection.getConnection();
			String sql = "insert into note values(?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getSeqno());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContents());

			pstmt.executeUpdate(); // DB 에 업에이트
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
	}

	// Lecture_Information DB 전송
	public void insert(Lecture_InformationDTO dto) {
		try {
			conn = DataBaseConnection.getConnection();
			String sql = "insert into lecture_information values(?,?,sysdate,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getInfo_seqno());
			pstmt.setString(2, dto.getReg_id());
			pstmt.setString(3, dto.getLecture());

			pstmt.executeUpdate(); // DB 에 업에이트
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException e) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException e) {
				}
		}
	}

	// 학생 로그인 db와 맞는지 확인하는 메서드.
	public int studentCheck(Student_MembersDTO dto) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpassword = "";
		int x = -1;
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("select * from student_members where student_id = ?");
			pstmt.setString(1, dto.getStudent_id());
			rs = pstmt.executeQuery(); // 아이디를 검색

			if (rs.next()) {
				dbpassword = rs.getString("password");
				if (dbpassword.equals(dto.getPassword())) {
					x = 1;
				} else {
					x = 0;
				}
			} else {
				x = -1; // DB검색 없음.
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
		return x;
	}

	// 강사 로그인 db와 맞는지 확인하는 메서드.
	public int teacherCheck(Teacher_MembersDTO dto) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpassword = "";
		int x = -1;

		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("select password from teacher_members where teacher_id=?");
			pstmt.setString(1, dto.getTeacher_id());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbpassword = rs.getString("password");
				if (dbpassword.equals(dto.getPassword())) {
					x = 1;
				} else {
					x = 0;
				}
			} else {
				x = -1; // DB검색 없음.
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
		return x;
	}

	// 행정 로그인 db와 맞는지 확인하는 메서드.
	public int adminCheck(Admin_MembersDTO dto) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpassword = "";
		int x = -1;

		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("select password from admin_members where admin_id=?");
			pstmt.setString(1, dto.getAdmin_id());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbpassword = rs.getString("password");
				if (dbpassword.equals(dto.getPassword())) {
					x = 1;
				} else {
					x = 0;
				}
			} else {
				x = -1; // DB검색 없음.
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
		return x;
	}

	// 학생리스트를 만드는? 메서드 studentList에서 사용됩니다. 미완성임.
	public ArrayList studentAll() {
		ArrayList list = new ArrayList();
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("select * from student_members");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Student_MembersDTO sdto = new Student_MembersDTO();
				sdto.setStudent_id(rs.getString("student_id"));
				sdto.setStudent_name(rs.getString("student_name"));
				sdto.setPassword(rs.getString("password"));
				sdto.setEmail(rs.getString("email"));
				sdto.setStudent_pic(rs.getString("student_pic"));
				sdto.setReg_date(rs.getTimestamp("reg_date"));
				list.add(sdto);
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
		return list;
	}

	/*
	 * //SQL close 메서드 private void closeAll() { if(rs != null) { try { rs.close();
	 * }catch(SQLException s ) {} } if(pstmt != null) { try { pstmt.close();
	 * }catch(SQLException s ) {} } if(conn != null) { try { conn.close();
	 * }catch(SQLException s ) {} } }
	 */

	// 강사 sessionID 확인 후 개인 정보 뜨기
	public Teacher_MembersDTO teacherInfo(String sessionId) {
		Teacher_MembersDTO dto = new Teacher_MembersDTO();
		try {
			conn = DataBaseConnection.getConnection();
			String sql = "select * from teacher_members where Teacher_id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sessionId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setTeacher_id(rs.getString("teacher_id"));
				dto.setTeacher_name(rs.getString("teacher_name"));
				dto.setPassword(rs.getString("password"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setTeacher_pic(rs.getString("teacher_pic"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException s) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException s) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException s) {
				}
			}
		}
		return dto;
	}

	// 강사 정보 수정내
	public void teacherUpdate(Teacher_MembersDTO dto) {

		try {
			conn = DataBaseConnection.getConnection(); // 클래스 메서드를 호출하여 연결객체를 받는다.
			String sql = "update teacher_members set teacher_name=?, password=?, email=?, phone=?, teacher_pic=? where Teacher_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTeacher_name());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getTeacher_pic());
			pstmt.setString(6, dto.getTeacher_id());
			pstmt.executeUpdate();
			System.out.println(dto.getTeacher_name());
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {try {rs.close();}catch(SQLException s) {}}
			if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
			if(conn != null) {try {conn.close();}catch(SQLException s) {}}
		}
	}

	private void closeAll() {
		// TODO Auto-generated method stub

	}
	
	//관리자 adminID 학인후 개인정보
	public Admin_MembersDTO managementInfo(String sessionId) {
		Admin_MembersDTO dto = new Admin_MembersDTO();
		try {
			conn = DataBaseConnection.getConnection();
			String sql = "select * from Admin_members where Admin_id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sessionId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setAdmin_id(rs.getString("Admin_id"));
				dto.setAdmin_name(rs.getString("Admin_name"));
				dto.setPassword(rs.getString("password"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setAdmin_pic(rs.getString("Admin_pic"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException s) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException s) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException s) {
				}
			}
		}
		return dto;
	}
	
	// 관리자 정보 수정
		public void maupdatePro(Admin_MembersDTO dto) {

			try {
				conn = DataBaseConnection.getConnection(); // 클래스 메서드를 호출하여 연결객체를 받는다.
				String sql = "update Admin_members set admin_name=?, password=?, email=?, phone=?, admin_pic=? where admin_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getAdmin_name());
				pstmt.setString(2, dto.getPassword());
				pstmt.setString(3, dto.getEmail());
				pstmt.setString(4, dto.getPhone());
				pstmt.setString(5, dto.getAdmin_pic());
				pstmt.setString(6, dto.getAdmin_id());
				pstmt.executeUpdate();
				System.out.println(dto.getAdmin_name());
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null) {try {rs.close();}catch(SQLException s) {}}
				if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
				if(conn != null) {try {conn.close();}catch(SQLException s) {}}
			}
		}

		//학생ID 학인후 개인정보
		public Student_MembersDTO studentInfo(String sessionId) {
			Student_MembersDTO dto = new Student_MembersDTO();
			try {
				conn = DataBaseConnection.getConnection();
				String sql = "select * from Student_members where Student_id=? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, sessionId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					dto.setStudent_id(rs.getString("Student_id"));
					dto.setStudent_name(rs.getString("Student_name"));
					dto.setPassword(rs.getString("password"));
					dto.setEmail(rs.getString("email"));
					dto.setPhone(rs.getString("phone"));
					dto.setStudent_pic(rs.getString("Student_pic"));
					dto.setReg_date(rs.getTimestamp("reg_date"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException s) {
					}
				}
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException s) {
					}
				}
				if (conn != null) {
					try {
						conn.close();
					} catch (SQLException s) {
					}
				}
			}
			return dto;
		}
		
		// 학생 정보 수정
			public void studentUpdate(Student_MembersDTO dto) {

				try {
					conn = DataBaseConnection.getConnection(); // 클래스 메서드를 호출하여 연결객체를 받는다.
					String sql = "update Student_members set Student_name=?, password=?, email=?, phone=?, Student_pic=? where Student_id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dto.getStudent_name());
					pstmt.setString(2, dto.getPassword());
					pstmt.setString(3, dto.getEmail());
					pstmt.setString(4, dto.getPhone());
					pstmt.setString(5, dto.getStudent_pic());
					pstmt.setString(6, dto.getStudent_id());
					pstmt.executeUpdate();
					System.out.println(dto.getStudent_name());
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					if(rs != null) {try {rs.close();}catch(SQLException s) {}}
					if(pstmt != null) {try {pstmt.close();}catch(SQLException s) {}}
					if(conn != null) {try {conn.close();}catch(SQLException s) {}}
				}
			}
}
