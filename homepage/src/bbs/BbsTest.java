package bbs;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BbsTest {

	public static void main(String[] args) {
		BbsDAO dao=new BbsDAO();
		//list(dao);
		//read(dao);
		//create(dao);
		//update(dao);
		//delete(dao);
		//upViewcnt(dao);
		//pwCheck(dao);
		total(dao);
	}

	private static void total(BbsDAO dao) {
		Map map=new HashMap();
		map.put("col","wname");
		map.put("word","나");
		
		int total=dao.total(map);
		p("레코드 개수 : "+ total);
	}

	private static void pwCheck(BbsDAO dao) {
		Map map=new HashMap();
		map.put("bbsno", 2);
		map.put("passwd", "456");

		if(dao.pwCheck(map)) {
			p("올바른 비번입니다.");
		}else
			p("잘못 된 비번입니다.");
		
	}

	private static void upViewcnt(BbsDAO dao) {
		BbsDTO dto=dao.read(2);
		p("조회수 : "+dto.getViewcnt());
		p("조회수 증가합니다.");
		dao.upViewcnt(3);
		dto=dao.read(3);
		p("변경된 조회수 : "+dto.getViewcnt());
		
	}

	private static void delete(BbsDAO dao) {
		if(dao.delete(4)) {
			p("데이터가 삭제되었습니다.");
		}else
			p("데이터 삭제에 실패했습니다.");
	}

	private static void update(BbsDAO dao) {
		BbsDTO dto=new BbsDTO();
		dto.setWname("이나슬이2");
		dto.setTitle("제목입니당");
		dto.setContent("내용입니당");
		dto.setBbsno(4);
		if(dao.update(dto)) {
			p("데이터가 수정되었습니다.");
		}else
			p("데이터 수정에 실패했습니다.");
		
	}

	private static void create(BbsDAO dao) {
		BbsDTO dto=new BbsDTO();
		dto.setWname("이나슬이");
		dto.setTitle("제목");
		dto.setContent("내용");
		dto.setPasswd("1234");
		if(dao.create(dto)) {
			p("데이터가 등록되었습니다.");
		}else
			p("데이터 등록에 실패했습니다.");
		
	}

	private static void read(BbsDAO dao) {
		BbsDTO dto = dao.read(2);
		p(dto);
		p("------------------------");
	}

	private static void list(BbsDAO dao) {
		Map map=new HashMap();
		map.put("col", "wname");
		map.put("word", "나");
		map.put("sno", 1);		
		map.put("eno", 5);		
		
		List<BbsDTO> list=dao.list(map);
		for(int i=0; i<list.size(); i++) {
			BbsDTO dto=list.get(i);
			p(dto);
			p("------------------------"); 
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

	private static void p(BbsDTO dto) {
		System.out.println("번    호 : "+ dto.getBbsno());
		System.out.println("이    름 : "+ dto.getWname());
		System.out.println("제    목 : "+ dto.getTitle());
		System.out.println("내    용 : "+ dto.getContent());
		System.out.println("등록날짜 : "+ dto.getWdate());
		System.out.println("조 회 수 : "+ dto.getViewcnt());
		System.out.println("패스워드 : "+ dto.getPasswd());
		System.out.println("grpno  : "+ dto.getGrpno());
		System.out.println("ansnum : "+ dto.getAnsnum());
		System.out.println("indent : "+ dto.getIndent());
		
	}
	

}
