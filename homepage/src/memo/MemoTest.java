package memo;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class MemoTest {

	public static void main(String[] args) {
		MemoDAO dao=new MemoDAO();
		//list(dao);
		total(dao);

	}

	private static void total(MemoDAO dao) {
		Map map=new HashMap();
		map.put("col", "title");
		map.put("word", "?");
		int total=dao.total(map);
		p("레코드 개수 : "+total);
		
	}

	private static void list(MemoDAO dao) {
		
		Map map=new HashMap();
		map.put("col", "title");
		map.put("word", "");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<MemoDTO> list=dao.list(map);
		Iterator<MemoDTO> iter=list.iterator();
		while(iter.hasNext()) {
			MemoDTO dto=iter.next();
			p(dto);
			p("-----------------------------");
			
		}
	
	}

	private static void p(MemoDTO dto) {
		p("번       호 : "+dto.getMemono());
		p("제       목 : "+dto.getTitle());
		p("등록 날짜 : "+dto.getWdate());
		p("조  회  수 : "+dto.getViewcnt());
		p("grpno  : "+dto.getGrpno());
		p("indent : "+dto.getIndent());
		p("ansnum : "+dto.getAnsnum());
		
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}
