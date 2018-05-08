package gust;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;

public class GustDAO {
	//자식이 상속받고 있으면 부모글을 지울 수없게 하는 메소드 
	public boolean checkRefnum(int gustno){
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(refnum) from gust  ");
		sql.append(" where refnum = ? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1,gustno);
			rs=pstmt.executeQuery();
			if(rs.next()){
				int cnt = rs.getInt(1);
				if(cnt>0) flag = true;///부모글이다
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		return flag;
	}
	
	//utility에서 페이징을 위해 계산할 메소드 
	public int total(Map map){
		int total = 0;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) as cnt from gust  ");
		if(word.trim().length()>0)
		sql.append(" where "+col+" like '%'||?||'%' ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			if(word.trim().length()>0)
				pstmt.setString(1, word);
			rs=pstmt.executeQuery();
			if(rs.next()){
				total = rs.getInt("cnt");
		}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt, rs);
		}
		 
		
		return total;
		
	}
 	
	
	public GustDTO readReply(int gustno){
		GustDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select gustno, grpno, indent, ansnum, title ");
		sql.append(" from gust ");
		sql.append(" where gustno =? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, gustno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new GustDTO();
				dto.setGustno(rs.getInt("gustno"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setTitle(rs.getString("title"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		
		return dto;
	}
	
//등록 메소드
	public boolean create(GustDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("  insert into gust(gustno, title, content, fname, wdate, grpno) " );
		sql.append("  values(gust_seq.nextval,?,?,?,sysdate, " );
		sql.append("  (select nvl(max(grpno),0) +1 from gust)) " );
	
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getFname());
		
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) 
				flag= true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(con,pstmt);
		}
		
		return flag;
	}
		
	//read 메소드 
	public GustDTO read(int gustno) {
		
		GustDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" SELECT gustno, title, content, fname, ");
		sql.append(" to_char(wdate, 'yyyy-mm-dd') wdate, viewcnt ");
		sql.append(" FROM gust ");
		sql.append(" WHERE gustno = ?");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, gustno);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				dto = new GustDTO();
				dto.setFname(rs.getString("fname"));
				dto.setContent(rs.getString("content"));
				dto.setTitle(rs.getString("title"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setGustno(rs.getInt("gustno"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con,pstmt,rs);
		}
		
		
		return dto;
	}
	
	public boolean update(GustDTO dto) {
	//업데이트 메소드
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("  update gust      ");
		sql.append("  set title = ?,   ");
		sql.append("     content = ?,   ");
		sql.append("     fname=?        ");
		sql.append("     where          ");
		sql.append("     gustno= ?     ");
		
		try {
			pstmt= con.prepareStatement(sql.toString());
			pstmt.setString(1,dto.getTitle());
			pstmt.setString(2,dto.getContent());
			pstmt.setString(3,dto.getFname());
			pstmt.setInt(4,dto.getGustno());
			
			
			int cnt= pstmt.executeUpdate();
			
			if(cnt>0)flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con,pstmt);
		}
		
		return flag;
	}

	//삭제 메소드
	public boolean delete(int gustno) {
		boolean flag = false;
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from gust ");
		sql.append(" where gustno=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, gustno);
			int cnt = pstmt.executeUpdate();	
			if(cnt>0)flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}
	
	//리스트 메소드
	public List<GustDTO> list(Map map){
		List<GustDTO> list = new ArrayList<GustDTO>();
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		StringBuffer sql = new StringBuffer();
		
		sql.append(" SELECT gustno, title, wdate,fname, viewcnt, grpno, indent, ansnum, r  ");
		sql.append(" from(  ");
		sql.append(" 	SELECT gustno, title, wdate,fname, viewcnt, grpno, indent, ansnum, rownum r  ");
		sql.append(" 	from(  ");
		sql.append(" 	select gustno, title, ");
		sql.append(" 	to_char(wdate,'yyyy-mm-dd') wdate,fname, viewcnt,  ");
		sql.append(" 	grpno, indent, ansnum  ");
		sql.append(" 	from gust ");
		
		if(word.trim().length()>0)
			sql.append(" where "+col+" like '%'||?||'%'  ");
		
		sql.append("	 order by grpno DESC,ansnum ");
		
		sql.append(" 		) ");
		sql.append("    ) ");
		sql.append(" 	where r>=? and r<=? ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			int i=0;
			if(word.trim().length()>0)
				pstmt.setString(++i, word);	
				pstmt.setInt(++i, sno);
				pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();
			while(rs.next()){
				GustDTO dto = new GustDTO();
				dto.setGustno(rs.getInt("gustno"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setFname(rs.getString("fname"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				
				list.add(dto);//빠지지마라
			}
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}
	//조회수 증가 메소드
	public void upViewcnt(int gustno){
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();

		sql.append(" UPDATE gust ");
		sql.append(" SET viewcnt = viewcnt + 1");
		sql.append(" WHERE gustno = ?");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1,gustno);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt);
		}
		
	}
	//답변 생성 메소드 
	public boolean createReply(GustDTO dto){

		boolean flag = false;
		 
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO gust(gustno, title, content,fname, wdate, grpno, indent, ansnum, refnum)  ");
		sql.append(" VALUES((select nvl(max(gustno),0) +1 from gust), ?, ?,?, sysdate, ?, ?, ?, ?)  ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getFname());
			pstmt.setInt(4, dto.getGrpno());
			pstmt.setInt(5, dto.getIndent()+1);
			pstmt.setInt(6, dto.getAnsnum()+1);
			pstmt.setInt(7, dto.getGustno());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0)flag=true;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt);
		}
		
		
		return flag;
	}
	
	//
	public void upAnsnum(Map map){
		int grpno = (Integer)map.get("grpno");
		int ansnum = (Integer)map.get("ansnum");
		
		Connection con = DBOpen.open();
		PreparedStatement pstmt = null;
		
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update gust  ");
		sql.append(" set ansnum = ansnum + 1 ");
		sql.append(" where grpno=?  ");
		sql.append(" and ansnum > ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt);
		}
	}
}