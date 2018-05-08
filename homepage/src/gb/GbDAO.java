package gb;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map; 

import bbs.BbsDTO;
import db.DBClose;
import db.DBOpen;

public class GbDAO {
	public boolean delete(int gbno) {
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		sql.append(" delete from gb ");
		sql.append(" where gbno=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, gbno);
			
			int cnt=pstmt.executeUpdate();
			if(cnt>0) flag=true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
				
		return flag;
	}
	
	
	public boolean update(Map map) {
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		
		String content=(String) map.get("content");
		int gbno=(int) map.get("gbno");

		StringBuffer sql=new StringBuffer();
		sql.append(" update gb ");
		sql.append(" set content	=? ");
		sql.append(" where gbno=? ");

		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, content);
			pstmt.setInt(2, gbno);
			
			int cnt=pstmt.executeUpdate();
			if(cnt>0) flag=true;
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}	

		return flag;
	}
	
	public int total() {
		int total=0;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(*) as cnt from gb ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());

			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				total=rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return total;
	}
	
	public List<GbDTO> list(Map map){
		List<GbDTO> list=new ArrayList();
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int sno=(int) map.get("sno");		
		int eno=(int) map.get("eno");	
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select gbno, mname, content, wdate, fname , r ");
		sql.append(" from( ");
		sql.append(" 	select gbno, mname, content, wdate, fname, rownum r ");
		sql.append(" 	from( ");
		sql.append(" 		select gbno, mname, content, wdate, fname  ");
		sql.append(" 		from gb order by gbno desc ");
		sql.append(" 	) ");
		sql.append(" ) ");
		sql.append(" where r>=? and r<=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			
			int i=0;
				
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
				
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				GbDTO dto=new GbDTO();
				dto.setGbno(rs.getInt("gbno"));
				dto.setMname(rs.getString("mname"));
				dto.setFname(rs.getString("fname"));
				dto.setContent(rs.getString("content"));
				dto.setWdate(rs.getString("wdate"));
				
				
				list.add(dto);//한건의 데이터를 list에 저장
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt, rs);
		}

		
		return list;
	}
	public boolean create(GbDTO dto){
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into gb(gbno, mname, content, wdate, fname) ");
		sql.append(" values((select nvl(max(gbno),0)+1 as gbno from gb),  ");
		sql.append(" ?,?,sysdate, ?) ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMname());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getFname());
			
			int cnt=pstmt.executeUpdate();
			if(cnt>0) flag=true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBClose.close(con, pstmt);
		}
		
		return flag;
	}
}
