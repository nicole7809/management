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
			String sql = "insert into qna values(?,?,?,?,?,?,sysdate,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getPassword());
			pstmt.setInt(7, dto.getReadcount());
			pstmt.setString(8, dto.getIp());
			pstmt.setInt(9, dto.getRef());
			pstmt.setInt(10, dto.getRe_step());
			pstmt.setInt(11, dto.getRe_level());

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
	public void insertNotice(NoticeDTO notice) {
		int num = notice.getNum();
		String sql = "";

		try {
			conn = DataBaseConnection.getConnection();
			sql = "insert into notice(num,writer,subject,reg_date,";
			sql += "content,ip) values(notice_seq.nextval,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getWriter());
			pstmt.setString(2, notice.getSubject());
			pstmt.setTimestamp(3, notice.getReg_date());
			pstmt.setString(4, notice.getContent());
			pstmt.setString(5, notice.getIp());

			pstmt.executeUpdate(); // DB 에 업에이트
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
	}

	// notice 전체글 갯수를 보고 목록 번호를 1부터 시작하는 것.
	public int getNoticeCount() throws Exception {
		int x = 0;
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("select count(*) from notice");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
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

	// 공지사항 목록을 보는 것.
	public List getNotice(int start, int end) throws Exception {
		List noticeList = null;
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn
					.prepareStatement("select * from (select num,writer,subject,reg_date,content,ip,readcount,rownum r "
							+ "from (select * from notice order by reg_date desc)) where r >= ? and r <= ? ");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				noticeList = new ArrayList(end);
				do {
					NoticeDTO notice = new NoticeDTO();
					notice.setNum(rs.getInt("num"));
					notice.setWriter(rs.getString("writer"));
					notice.setSubject(rs.getString("subject"));
					notice.setReg_date(rs.getTimestamp("reg_date"));
					notice.setContent(rs.getString("content"));
					notice.setIp(rs.getString("ip"));
					notice.setReadcount(rs.getInt("readcount"));

					noticeList.add(notice);
				} while (rs.next());
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
		return noticeList;
	}

	// notice 내용 확인과 조회수 올려주는 메서드. ( content에서 사용함.)
	public NoticeDTO getNotice(int num) throws Exception {
		NoticeDTO notice = null;
		try {
			conn = DataBaseConnection.getConnection();

			// 글 클릭 시 조회수 1 올라감
			pstmt = conn.prepareStatement("update notice set readcount=readcount+1 where num=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			// 선택한 num의 모든 정보 읽기 가능하게함.
			pstmt = conn.prepareStatement("select * from notice where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				notice = new NoticeDTO();
				notice.setNum(rs.getInt("num"));
				notice.setWriter(rs.getString("writer"));
				notice.setSubject(rs.getString("subject"));
				notice.setReg_date(rs.getTimestamp("reg_date"));
				notice.setContent(rs.getString("content"));
				notice.setIp(rs.getString("ip"));
				notice.setReadcount(rs.getInt("readcount"));
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
		return notice;
	}

	// notice 글 수정하기 위해 내용 확인하는 메서드
	public NoticeDTO updateGetNotice(int num) throws Exception {
		NoticeDTO notice = null;
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("select * from notice where num=?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				notice = new NoticeDTO();
				notice.setNum(rs.getInt("num"));
				notice.setWriter(rs.getString("writer"));
				notice.setSubject(rs.getString("subject"));
				notice.setReg_date(rs.getTimestamp("reg_date"));
				notice.setContent(rs.getString("content"));
				notice.setIp(rs.getString("ip"));
				notice.setReadcount(rs.getInt("readcount"));
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
		return notice;
	}

	// notice 글 수정 메서드
	public void updateArticle(NoticeDTO notice) throws Exception {
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("update notice set writer=?,subject=?,content=? where num=?");
			pstmt.setString(1, notice.getWriter());
			pstmt.setString(2, notice.getSubject());
			pstmt.setString(3, notice.getContent());
			pstmt.setInt(4, notice.getNum());

			pstmt.executeUpdate();
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
	}

	// notice 글 삭제 메서드
	public int deleteNotice(int num) throws Exception {
		int x = -1;
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("delete from notice where num=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			x = 1; // ------------------- 글 삭제 성공.
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

	/*
	 * // Note DB 전송 public void insert(NoteDTO note) { int seqno = note.getSeqno();
	 * String sql = ""; try { conn = DataBaseConnection.getConnection(); sql =
	 * "insert into note(seqno,writer,subject,content,reg_date) values(note_seq.nextval,?,?,?,?)"
	 * ; pstmt = conn.prepareStatement(sql); pstmt.setString(1, note.getWriter());
	 * pstmt.setString(2, note.getSubject()); pstmt.setString(3, note.getContent());
	 * pstmt.setTimestamp(4, note.getReg_date()); pstmt.executeUpdate(); // DB 에
	 * 업에이트 } catch(Exception ex) { ex.printStackTrace(); } finally { if (rs !=
	 * null) try { rs.close(); } catch(SQLException ex) {} if (pstmt != null) try {
	 * pstmt.close(); } catch(SQLException ex) {} if (conn != null) try {
	 * conn.close(); } catch(SQLException ex) {} } } //note 전체글 갯수를 보고 목록 번호를 1부터
	 * 시작하는 것. public int getNoteCount() throws Exception { int x =0; try { conn =
	 * DataBaseConnection.getConnection(); pstmt =
	 * conn.prepareStatement("select count(*) from note"); rs =
	 * pstmt.executeQuery(); if(rs.next() ) { x = rs.getInt(1); } }catch(Exception
	 * ex) { ex.printStackTrace(); } finally { if (rs != null) try { rs.close(); }
	 * catch(SQLException ex) {} if (pstmt != null) try { pstmt.close(); }
	 * catch(SQLException ex) {} if (conn != null) try { conn.close(); }
	 * catch(SQLException ex) {} } return x; } // 노트 목록을 보는 것. public ArrayList
	 * getNote() throws Exception { ArrayList noteList = new ArrayList(); try { conn
	 * = DataBaseConnection.getConnection(); pstmt=
	 * conn.prepareStatement("select * from note order by reg_date desc"); rs =
	 * pstmt.executeQuery();
	 * 
	 * while (rs.next()){ NoteDTO note = new NoteDTO();
	 * note.setSeqno(rs.getInt("seqno")); note.setWriter(rs.getString("writer"));
	 * note.setSubject(rs.getString("subject"));
	 * note.setContent(rs.getString("content"));
	 * note.setReg_date(rs.getTimestamp("reg_date")); noteList.add(note); }
	 * }catch(Exception ex) { ex.printStackTrace(); } finally { if (rs != null) try
	 * { rs.close(); } catch(SQLException ex) {} if (pstmt != null) try {
	 * pstmt.close(); } catch(SQLException ex) {} if (conn != null) try {
	 * conn.close(); } catch(SQLException ex) {} } return noteList; }
	 * 
	 * // note 내용 확인 메서드. public NoteDTO getNote(int seqno) throws Exception {
	 * NoteDTO note = null; try { conn = DataBaseConnection.getConnection();
	 * 
	 * // 선택한 seqno의 모든 정보 읽기 가능하게함. pstmt =
	 * conn.prepareStatement("select * from note where seqno=?"); pstmt.setInt(1,
	 * seqno); rs = pstmt.executeQuery(); if(rs.next()) { note = new NoteDTO();
	 * note.setSeqno(rs.getInt("seqno")); note.setWriter(rs.getString("writer"));
	 * note.setSubject(rs.getString("subject"));
	 * note.setContent(rs.getString("content"));
	 * note.setReg_date(rs.getTimestamp("reg_date")); } }catch(Exception ex) {
	 * ex.printStackTrace(); } finally { if (rs != null) try { rs.close(); }
	 * catch(SQLException ex) {} if (pstmt != null) try { pstmt.close(); }
	 * catch(SQLException ex) {} if (conn != null) try { conn.close(); }
	 * catch(SQLException ex) {} } return note; } //note 글 수정 메서드 public void
	 * updateArticle(NoteDTO note) // 오버라이딩 throws Exception { try { conn =
	 * DataBaseConnection.getConnection(); pstmt = conn.
	 * prepareStatement("update note set writer=?,subject=?,content=? where seqno=?"
	 * ); pstmt.setString(1, note.getWriter()); pstmt.setString(2,
	 * note.getSubject()); pstmt.setString(3, note.getContent()); pstmt.setInt(4,
	 * note.getSeqno()); pstmt.executeUpdate(); }catch(Exception ex) {
	 * ex.printStackTrace(); } finally { if (rs != null) try { rs.close(); }
	 * catch(SQLException ex) {} if (pstmt != null) try { pstmt.close(); }
	 * catch(SQLException ex) {} if (conn != null) try { conn.close(); }
	 * catch(SQLException ex) {} } }
	 * 
	 * //note 글 삭제 메서드 public int deleteNote(int seqno) throws Exception { int x =
	 * -1; try { conn = DataBaseConnection.getConnection(); pstmt =
	 * conn.prepareStatement("delete from note where seqno=?"); pstmt.setInt(1,
	 * seqno); pstmt.executeUpdate(); x = 1; //------------------- 글 삭제 성공.
	 * }catch(Exception ex) { ex.printStackTrace(); } finally { if (rs != null) try
	 * { rs.close(); } catch(SQLException ex) {} if (pstmt != null) try {
	 * pstmt.close(); } catch(SQLException ex) {} if (conn != null) try {
	 * conn.close(); } catch(SQLException ex) {} } return x; }
	 */

	// Note DB 전송
	public void insert(NoteDTO note) {
		int seqno = note.getSeqno();
		String sql = "";
		try {
			conn = DataBaseConnection.getConnection();
			sql = "insert into note(seqno,writer,subject,content,reg_date) values(note_seq.nextval,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, note.getWriter());
			pstmt.setString(2, note.getSubject());
			pstmt.setString(3, note.getContent());
			pstmt.setTimestamp(4, note.getReg_date());
			pstmt.executeUpdate(); // DB 에 업에이트
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
	}

	// note 전체글 갯수를 보고 목록 번호를 1부터 시작하는 것.
	public int getNoteCount() throws Exception {
		int x = 0;
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("select count(*) from note");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
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

	// 노트 목록을 보는 것.
	public ArrayList getNote(int start, int end) throws Exception {
		ArrayList noteList = new ArrayList();
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("select * from (select seqno,writer,subject,content,reg_date,rownum r "
					+ "from(select * from note order by reg_date desc)) where r >= ? and r <=?");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				noteList = new ArrayList(end);
				do {
					NoteDTO note = new NoteDTO();
					note.setSeqno(rs.getInt("seqno"));
					note.setWriter(rs.getString("writer"));
					note.setSubject(rs.getString("subject"));
					note.setContent(rs.getString("content"));
					note.setReg_date(rs.getTimestamp("reg_date"));
					noteList.add(note);
				} while (rs.next());
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
		return noteList;
	}

	// note 내용 확인 메서드.
	public NoteDTO getNote(int seqno) throws Exception {
		NoteDTO note = null;
		try {
			conn = DataBaseConnection.getConnection();

			// 선택한 seqno의 모든 정보 읽기 가능하게함.
			pstmt = conn.prepareStatement("select * from note where seqno=?");
			pstmt.setInt(1, seqno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				note = new NoteDTO();
				note.setSeqno(rs.getInt("seqno"));
				note.setWriter(rs.getString("writer"));
				note.setSubject(rs.getString("subject"));
				note.setContent(rs.getString("content"));
				note.setReg_date(rs.getTimestamp("reg_date"));
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
		return note;
	}

	// note 글 수정 메서드
	public void updateArticle(NoteDTO note) throws Exception {
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("update note set subject=?,content=? where seqno=?");
			pstmt.setString(1, note.getSubject());
			pstmt.setString(2, note.getContent());
			pstmt.setInt(3, note.getSeqno());
			pstmt.executeUpdate();
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
	}

	// note 글 삭제 메서드
	public int deleteNote(int seqno) throws Exception {
		int x = -1;
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("delete from note where seqno=?");
			pstmt.setInt(1, seqno);
			pstmt.executeUpdate();
			x = 1; // ------------------- 글 삭제 성공.
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

	// Lecture_Information DB 전송
	public void insert(Lecture_InformationDTO dto) {
		try {
			conn = DataBaseConnection.getConnection();
			String sql = "insert into lecture_information values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getLecture_name());
			pstmt.setString(2, dto.getLecture_course());
			pstmt.setString(3, dto.getLecture_room());
			pstmt.setString(4, dto.getTeacher());

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

	// 학생리스트를 만드는? 메서드 studentList에서 사용됩니다.
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
			String sql = "select * from teacher_members where teacher_id=? ";
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
			String sql = "update teacher_members set teacher_name=?, password=?, email=?, phone=?, teacher_pic=? where teacher_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTeacher_name());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getTeacher_pic());
			pstmt.setString(6, dto.getTeacher_id());
			pstmt.executeUpdate();

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
	}

	// 강사 이미지
	public String selectImg(String teacher_id) {
		String img = null;
		try {
			conn = DataBaseConnection.getConnection();
			String sql = "select Teacher_pic from Teacher_Members where teacher_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, teacher_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				img = rs.getString("img");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return img;
	}

	private void closeAll() {
		// TODO Auto-generated method stub

	}

	// 관리자 adminID 학인후 개인정보
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
	}

	// 관리자가 학생ID 확인후 개인정보
	public Student_MembersDTO studentInfo(String studentId) {
		Student_MembersDTO dto = new Student_MembersDTO();
		try {
			conn = DataBaseConnection.getConnection();
			String sql = "select * from student_members where Student_id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setStudent_id(rs.getString("student_id"));
				dto.setStudent_name(rs.getString("student_name"));
				dto.setPassword(rs.getString("password"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setStudent_pic(rs.getString("student_pic"));
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

	// 학생ID 확인후 개인정보
	public Student_MembersDTO studentInfoList(String student_id) {
		Student_MembersDTO dto = new Student_MembersDTO();
		try {
			conn = DataBaseConnection.getConnection();
			String sql = "select * from student_members where Student_id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setStudent_id(rs.getString("student_id"));
				dto.setStudent_name(rs.getString("student_name"));
				dto.setPassword(rs.getString("password"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setStudent_pic(rs.getString("student_pic"));
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
	}

	public void insertArticle(QNADTO article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int num = article.getNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		int number = 0;
		String sql = "";

		try {
			conn = DataBaseConnection.getConnection();

			pstmt = conn.prepareStatement("select max(num) from qna");
			rs = pstmt.executeQuery();

			if (rs.next())
				number = rs.getInt(1) + 1;
			else
				number = 1;

			if (num != 0) //
			{
				sql = "update qna set re_step=re_step+1 where ref= ? and re_step> ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step = re_step + 1;
				re_level = re_level + 1;
			} else {
				ref = number;
				re_step = 0;
				re_level = 0;
			}
			// 쿼리를 작성
			sql = "insert into qna(num,writer,subject,email,password,reg_date,";
			sql += "ref,re_step,re_level,content,ip) values(qna_seq.nextval,?,?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getSubject());
			pstmt.setString(3, article.getEmail());
			pstmt.setString(4, article.getPassword());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());

			pstmt.executeUpdate();
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
	}

	public int getArticleCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		try {
			conn = DataBaseConnection.getConnection();

			pstmt = conn.prepareStatement("select count(*) from qna");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
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

	public int getArticleCount(String writer) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		try {
			conn = DataBaseConnection.getConnection();

			pstmt = conn.prepareStatement("select count(*) from qna where writer=?");
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
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

	public List getArticles(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		try {
			conn = DataBaseConnection.getConnection();

			pstmt = conn.prepareStatement(
					"select num,writer,email,subject,password,reg_date,ref,re_step,re_level,content,ip,readcount,r "
							+ "from (select num,writer,email,subject,password,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r "
							+ "from (select num,writer,email,subject,password,reg_date,ref,re_step,re_level,content,ip,readcount "
							+ "from qna order by ref desc, re_step asc) order by ref desc, re_step asc ) where r >= ? and r <= ? ");
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(end);
				do {
					QNADTO article = new QNADTO();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPassword(rs.getString("password"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));

					articleList.add(article);
				} while (rs.next());
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
		return articleList;
	}

	public List getArticles(int start, int end, String writer) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		try {
			conn = DataBaseConnection.getConnection();

			pstmt = conn.prepareStatement(
					"select num,writer,email,subject,password,reg_date,ref,re_step,re_level,content,ip,readcount,r "
							+ "from (select num,writer,email,subject,password,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r "
							+ "from (select num,writer,email,subject,password,reg_date,ref,re_step,re_level,content,ip,readcount "
							+ "from qna where writer=? order by ref desc, re_step asc) order by ref desc, re_step asc ) where r >= ? and r <= ? ");
			pstmt.setString(1, writer);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				articleList = new ArrayList(end);
				do {
					QNADTO article = new QNADTO();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPassword(rs.getString("password"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));

					articleList.add(article);
				} while (rs.next());
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
		return articleList;
	}

	public QNADTO getArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QNADTO article = null;
		try {
			conn = DataBaseConnection.getConnection();

			pstmt = conn.prepareStatement("update qna set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			pstmt = conn.prepareStatement("select * from qna where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new QNADTO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPassword(rs.getString("password"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
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
		return article;
	}

	public QNADTO updateGetArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		QNADTO article = null;
		try {
			conn = DataBaseConnection.getConnection();

			pstmt = conn.prepareStatement("select * from qna where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new QNADTO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPassword(rs.getString("password"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
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
		return article;
	}

	public int updateArticle(QNADTO article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpasswd = "";
		String sql = "";
		int x = -1;
		try {
			conn = DataBaseConnection.getConnection();

			pstmt = conn.prepareStatement("select password from qna where num = ?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(article.getPassword())) {
					sql = "update qna set writer=?,email=?,subject=?,password=?";
					sql += ",content=? where num=?";
					pstmt = conn.prepareStatement(sql);

					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
					pstmt.setString(4, article.getPassword());
					pstmt.setString(5, article.getContent());
					pstmt.setInt(6, article.getNum());
					pstmt.executeUpdate();
					x = 1;
				} else {
					x = 0;
				}
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

	public int deleteArticle(int num, String password) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		try {
			conn = DataBaseConnection.getConnection();

			pstmt = conn.prepareStatement("select password from qna where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("password");
				if (dbpasswd.equals(password)) {
					pstmt = conn.prepareStatement("delete from qna where num=?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x = 1; // 글삭제 성공
				} else
					x = 0; // 비밀번호 틀림
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

	public int deleteArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = -1;
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("delete from qna where num=?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			x = 1; // 글삭제 성공
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

	public void delete(QNADTO dto) {
		try {
			conn = DataBaseConnection.getConnection();
			String sql = "delete from qna where num=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNum());

			pstmt.executeUpdate();
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
	}

	// 강의 리스트
	public ArrayList lectureAll() {
		ArrayList list = new ArrayList();
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("select * from lecture_information");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Lecture_InformationDTO dto = new Lecture_InformationDTO();
				dto.setLecture_name(rs.getString("lecture_name"));
				dto.setLecture_course(rs.getString("lecture_course"));
				dto.setLecture_room(rs.getString("lecture_room"));
				dto.setTeacher(rs.getString("teacher"));

				list.add(dto);
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

	// 강사 리스트
	public ArrayList teacherAll() {
		ArrayList list = new ArrayList();
		try {
			conn = DataBaseConnection.getConnection();
			pstmt = conn.prepareStatement("select * from teacher_members");
			rs = pstmt.executeQuery();
			while (rs.next()) {

				Teacher_MembersDTO dto = new Teacher_MembersDTO();
				dto.setTeacher_id(rs.getString("teacher_id"));
				dto.setTeacher_name(rs.getString("teacher_name"));
				dto.setPassword(rs.getString("password"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setTeacher_pic(rs.getString("teacher_pic"));
				dto.setReg_date(rs.getTimestamp("reg_date"));

				list.add(dto);
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

}
