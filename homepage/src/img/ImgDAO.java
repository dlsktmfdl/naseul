package img;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import db.DBClose;
import db.DBOpen;
import member.MemberDTO;

public class ImgDAO {
	public boolean update(ImgDTO dto){
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" update img ");
		sql.append(" set	fname=?, ");
		sql.append(" 		title=?, ");
		sql.append(" 		content=? ");
		sql.append(" where 	inum=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getFname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getInum());
			
			int cnt=pstmt.executeUpdate();
			
			if(cnt>0)flag=true;
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}
	
	public boolean delete(int inum){
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		StringBuffer sql=new StringBuffer();
		sql.append(" delete from img ");
		sql.append(" where inum=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, inum);
			
			int cnt=pstmt.executeUpdate();
			if(cnt>0) flag=true;
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}

		return flag;
	}
	
	public boolean mypwCheck(Map map){
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		int inum=(int) map.get("inum");
		String pw=(String) map.get("pw");
		
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(inum) as cnt ");
		sql.append(" from img ");
		sql.append(" where inum=? and pw=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, inum);
			pstmt.setString(2, pw);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int cnt=rs.getInt("cnt");
				if(cnt>0) flag=true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return flag;
	}
	
	public boolean create(ImgDTO dto) {
		boolean flag=false;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" insert into img(inum, mname, title, content, fname, pw, wdate, filesize) ");
		sql.append(" values((select nvl(max(inum),0)+1 as inum from img),  ");
		sql.append(" 		  ?, ?, ?, ?, ?, sysdate, ?) ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getMname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getFname());
			pstmt.setString(5, dto.getPw());
			pstmt.setInt(6, dto.getFilesize());
			
			int cnt=pstmt.executeUpdate();
			if(cnt>0) flag=true;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
		
		return flag;
	}
	
	public void upViewcnt(int inum) {
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		
		StringBuffer sql=new StringBuffer();
		sql.append(" update img ");
		sql.append(" set viewcnt=viewcnt+1 ");
		sql.append(" where inum=? ");
		
		try {
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, inum);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBClose.close(con, pstmt);
		}
	}
	
	public List imgRead(int inum){
		List list = new ArrayList();
		Connection con = DBOpen.open();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT * FROM  ");
		sql.append("   (  ");
		sql.append("      select    ");
		sql.append("          lag(inum,2)     over (order by inum) pre_inum2,    ");
		sql.append("          lag(inum,1)     over (order by inum ) pre_inum1,   ");
		sql.append("          inum,  ");
		sql.append("          lead(inum,1)    over (order by inum) nex_inum1,    ");
		sql.append("          lead(inum,2)    over (order by inum) nex_inum2,    ");
		sql.append("          lag(fname,2)  over (order by inum) pre_file2,     ");
		sql.append("          lag(fname,1)  over (order by inum ) pre_file1,  ");
		sql.append("          fname,   ");
		sql.append("          lead(fname,1) over (order by inum) nex_file1,  ");
		sql.append("          lead(fname,2) over (order by inum) nex_file2   ");
		sql.append("          from (  ");
		sql.append("               SELECT inum, fname   ");
		sql.append("               FROM img ");
		sql.append("               ORDER BY inum DESC  ");
		sql.append("          )  ");
		sql.append("   )  ");
		sql.append("   WHERE inum = ? ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, inum); 
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				int[] noArr = 
					   {
						rs.getInt("pre_inum2"),
						rs.getInt("pre_inum1"),
						rs.getInt("inum"),
						rs.getInt("nex_inum1"),
						rs.getInt("nex_inum2")
					    };
				String[] files = 
					    {
						rs.getString("pre_file2"),
						rs.getString("pre_file1"),
						rs.getString("fname"),
						rs.getString("nex_file1"),
						rs.getString("nex_file2")
						};
				
				list.add(files);
				list.add(noArr);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
				
		return list;
	}
	
	public ImgDTO read(int inum){
		ImgDTO dto = null;
		Connection con = DBOpen.open();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT inum, mname, title, content,fname,viewcnt,wdate FROM img ");
		sql.append(" WHERE inum=? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, inum);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new ImgDTO();
				dto.setInum(rs.getInt("inum"));
				dto.setMname(rs.getString("mname"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setFname(rs.getString("fname"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(con, pstmt, rs);
		}
		
		
		return dto;
	}
	
	public int total(Map map){
		int total=0;
		Connection con=DBOpen.open();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String col=(String) map.get("col");
		String word=(String) map.get("word");
		
		StringBuffer sql=new StringBuffer();
		sql.append(" select count(*) as cnt from img ");
		if(word.trim().length()>0)
			sql.append(" where "+col+" like '%'||?||'%' ");

		try {
			pstmt=con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(1, word);
			
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
	
	public List<ImgDTO> list(Map map){
		List<ImgDTO> list=new ArrayList();
			Connection con=DBOpen.open();
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			String col=(String) map.get("col");
			String word=(String) map.get("word");
			int sno=(int) map.get("sno");
			int eno=(int) map.get("eno");
			
			StringBuffer sql=new StringBuffer();
			sql.append(" select inum, title, mname, fname, viewcnt, r ");
			sql.append(" from( ");
			sql.append(" 	select inum, title, mname, fname, viewcnt, rownum r ");
			sql.append(" 	from( ");
			sql.append(" 		select inum, title, mname, fname, viewcnt ");
			sql.append(" 		from img ");
			
			if(word.trim().length()>0)
				sql.append(" 		where "+col+" like '%'||?||'%' ");
			
			sql.append(" 		order by inum desc ");
			sql.append(" 	) ");
			sql.append(" ) ");
			sql.append(" where r>=? and r<=? ");
			sql.append("  ");
			
			try {
				pstmt=con.prepareStatement(sql.toString());
				int i=1;
				if(word.trim().length()>0)
					pstmt.setString(i++, word);
				
				pstmt.setInt(i++, sno);
				pstmt.setInt(i++, eno);

				rs=pstmt.executeQuery();
				while(rs.next()) {
					ImgDTO dto=new ImgDTO();
					dto.setInum(rs.getInt("inum"));
					dto.setTitle(rs.getString("title"));
					dto.setMname(rs.getString("mname"));
					dto.setFname(rs.getString("fname"));
					dto.setViewcnt(rs.getInt("viewcnt"));
					
					list.add(dto);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				DBClose.close(con, pstmt, rs);
			}
		return list;
	}
}
