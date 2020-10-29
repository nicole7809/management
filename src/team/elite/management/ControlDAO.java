package team.elite.management;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.util.ArrayList;

import team.elite.db.DataBaseConnection;	// 1,2 �ܰ� �α���

public class ControlDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

/*	public static Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		Context j = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) j.lookup("jdbc/orcl");
		Connection conn = ds.getConnection();
		return conn;
	}------------------- 1,2�ܰ� �α����� import �����ϱ� �̺κ��� �ּ�ó��.
*/	
	private static ControlDAO instance = new ControlDAO();
	
	public static ControlDAO getInstance() {
		return instance;
	}
	private ControlDAO() {
		
	}
	
	// �л� DB ����
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
			pstmt.executeUpdate();		//DB �� ������Ʈ
		}catch(Exception e )  {
			e.printStackTrace();
		}finally {
			if (rs != null) try {rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try {pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try {conn.close(); } catch(SQLException e) {}	
		}
	}
	
	// ���� DB ����
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
				pstmt.executeUpdate();		//DB �� ������Ʈ
			}catch(Exception e )  {
				e.printStackTrace();
			}finally {
				if (rs != null) try {rs.close(); } catch(SQLException e) {}
				if (pstmt != null) try {pstmt.close(); } catch(SQLException e) {}
				if (conn != null) try {conn.close(); } catch(SQLException e) {}	
			}
		}
		
		//���� DB ����
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
				pstmt.executeUpdate();		//DB �� ������Ʈ
			}catch(Exception e )  {
				e.printStackTrace();
			}finally {
				if (rs != null) try {rs.close(); } catch(SQLException e) {}
				if (pstmt != null) try {pstmt.close(); } catch(SQLException e) {}
				if (conn != null) try {conn.close(); } catch(SQLException e) {}	
			}
		}
	
		//Q&A DB ����
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
				
				pstmt.executeUpdate();		//DB �� ������Ʈ
			}catch(Exception e )  {
				e.printStackTrace();
			}finally {
				if (rs != null) try {rs.close(); } catch(SQLException e) {}
				if (pstmt != null) try {pstmt.close(); } catch(SQLException e) {}
				if (conn != null) try {conn.close(); } catch(SQLException e) {}	
			}
		}
	
		//Notice DB ����
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
						
				pstmt.executeUpdate();		//DB �� ������Ʈ
			}catch(Exception e )  {
				e.printStackTrace();
			}finally {
				if (rs != null) try {rs.close(); } catch(SQLException e) {}
				if (pstmt != null) try {pstmt.close(); } catch(SQLException e) {}
				if (conn != null) try {conn.close(); } catch(SQLException e) {}	
			}
		}
		
		//Note DB ����
		public void insert(NoteDTO dto) {
			try {
				conn = DataBaseConnection.getConnection();
				String sql = "insert into note values(?,?,?,?,sysdate)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getSeqno());
				pstmt.setString(2, dto.getWriter());
				pstmt.setString(3, dto.getSubject());
				pstmt.setString(4, dto.getContents());
								
				pstmt.executeUpdate();		//DB �� ������Ʈ
			}catch(Exception e )  {
				e.printStackTrace();
			}finally {
				if (rs != null) try {rs.close(); } catch(SQLException e) {}
				if (pstmt != null) try {pstmt.close(); } catch(SQLException e) {}
				if (conn != null) try {conn.close(); } catch(SQLException e) {}	
			}
		}

		//Lecture_Information DB ����
		public void insert(Lecture_InformationDTO dto) {
			try {
				conn = DataBaseConnection.getConnection();
				String sql = "insert into lecture_information values(?,?,sysdate,?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getInfo_seqno());
				pstmt.setString(2, dto.getReg_id());
				pstmt.setString(3, dto.getLecture());
								
				pstmt.executeUpdate();		//DB �� ������Ʈ
			}catch(Exception e )  {
				e.printStackTrace();
			}finally {
				if (rs != null) try {rs.close(); } catch(SQLException e) {}
				if (pstmt != null) try {pstmt.close(); } catch(SQLException e) {}
				if (conn != null) try {conn.close(); } catch(SQLException e) {}	
			}
		}		
		
	
	
	// �л� �α��� db�� �´��� Ȯ���ϴ� �޼���.
	public int studentCheck(Student_MembersDTO dto)
	 throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpassword = "";
		int x = -1;
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement( "select * from student_members where student_id = ?");
			pstmt.setString(1, dto.getStudent_id());
			rs = pstmt.executeQuery();		//���̵� �˻�
			
			if(rs.next() ) {
				dbpassword = rs.getString("password") ;
				if(dbpassword.equals(dto.getPassword())) {
					x = 1;
				}else {
					x=0;
				}
			}else {
				x = -1;		//DB�˻� ����.
			}		
		}catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if (rs != null) try {rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try {pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try {conn.close(); } catch(SQLException ex) {}	
		}
		return x;
	}
	
	// ���� �α��� db�� �´��� Ȯ���ϴ� �޼���.
	public int teacherCheck(Teacher_MembersDTO dto)
	 throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpassword = "";
		int x = -1;
		
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("select password from teacher_members where teacher_id=?") ;
			pstmt.setString(1, dto.getTeacher_id());
			rs = pstmt.executeQuery();
			if(rs.next() ) {
				dbpassword = rs.getString("password") ;
				if(dbpassword.equals(dto.getPassword())) {
					x = 1;
				}else {
					x=0;
				}
			}else {
				x = -1;		//DB�˻� ����.
			}
		}catch (Exception ex ) {
			ex.printStackTrace();
		}finally {
			if (rs != null) try {rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try {pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try {conn.close(); } catch(SQLException ex) {}	
		}
		return x;
	}
	
	// ���� �α��� db�� �´��� Ȯ���ϴ� �޼���.
	public int adminCheck(Admin_MembersDTO dto)
	  throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpassword = "";
		int x = -1;
		
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("select password from admin_members where admin_id=?") ;
			pstmt.setString(1, dto.getAdmin_id());
			rs = pstmt.executeQuery();
			if(rs.next() ) {
				dbpassword = rs.getString("password") ;
				if(dbpassword.equals(dto.getPassword())) {
					x = 1;
				}else {
					x=0;
				}
			}else {
				x = -1;		//DB�˻� ����.
			}
		}catch (Exception ex ) {
			ex.printStackTrace();
		}finally {

			if (rs != null) try {rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try {pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try {conn.close(); } catch(SQLException ex) {}	
		}
		return x;
	}
	
	// �л�����Ʈ�� �����? �޼��� studentList���� ���˴ϴ�.  �̿ϼ���.
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
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			if (rs != null) try {rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try {pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) try {conn.close(); } catch(SQLException ex) {}	
		}
		return list;
	}
	
	
	/*
	 * //SQL close �޼��� private void closeAll() { if(rs != null) { try { rs.close();
	 * }catch(SQLException s ) {} } if(pstmt != null) { try { pstmt.close();
	 * }catch(SQLException s ) {} } if(conn != null) { try { conn.close();
	 * }catch(SQLException s ) {} } }
	 */

}
