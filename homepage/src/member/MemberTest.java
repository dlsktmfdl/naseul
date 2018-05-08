package member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemberTest {

	public static void main(String[] args) {
		MemberDAO dao=new MemberDAO();
		//duplicateId(dao);
		//duplicateEmail(dao);
		//create(dao);
		//list(dao);
		//total(dao);
		//read(dao);
		//updatePw(dao);
		//update(dao);
		//getFname(dao);
		//delete(dao);
		//loginCheck(dao);
		getGrade(dao);

	}

	private static void getGrade(MemberDAO dao) {
		p("등급 : "+dao.getGrade("user2"));
		
	}

	private static void loginCheck(MemberDAO dao) {
		Map map=new HashMap();
		map.put("id", "user1");
		map.put("passwd", "1234");
		
		if(dao.loginCheck(map)) {
			p("등록된 회원입니다.");
		}else{
			p("ID나 P/W가 정확하지 않거나, 등록되지 않은 회원입니다.");
		}
		
	}

	private static void delete(MemberDAO dao) {
		String id="user1";
		if(dao.delete(id)) {
			p("삭제성공");
		}else {
			p("삭제실패");
		}
		
	}

	private static void getFname(MemberDAO dao) {
		p("파일명 : "+dao.getFname("user1"));
		
	}

	private static void update(MemberDAO dao) {
		MemberDTO dto=dao.read("user1");
		dto.setTel("000-0000-0000");
		dto.setZipcode("00000");
		dto.setAddress1("경기도 하남시");
		dto.setAddress2("덕풍동");
		dto.setEmail("user1@mail.net");
		dto.setJob("A07");
		
		if(dao.update(dto)) {
			p("수정성공");
		}else {
			p("수정실패");
		}
		
	}

	private static void updatePw(MemberDAO dao) {
		Map map=new HashMap();
		map.put("id", "54528");
		map.put("passwd", "1234");
		
		
		if(dao.updatePw(map)) {
			p("변경성공");
		}else {
			p("변경실패");
		}
		
	}

	private static void read(MemberDAO dao) {
		MemberDTO dto=dao.read("user1");
			p(dto);		
	}

	private static void total(MemberDAO dao) {
		Map map=new HashMap();
		map.put("col", "mname");
		map.put("word", "개발자" );
		p("레코드 개수 : "+dao.total(map));
		
	}

	private static void list(MemberDAO dao) {
		Map map=new HashMap();	
		map.put("col", "mname");
		map.put("word", "개발자");
		map.put("sno", 1);
		map.put("eno", 5);
		
		List<MemberDTO> list=dao.list(map);
		for(int i=0; i<list.size(); i++) {
			MemberDTO dto=list.get(i);
			p(dto);
			p("-------------------------------");
		}
		
	}

	private static void p(MemberDTO dto) {
		p("아이디 : "+dto.getId());
		p("이름 : "+dto.getMname());
		p("전화번호 : "+dto.getTel());
		p("이메일 : "+dto.getEmail());
		p("우편번호 : "+dto.getZipcode());
		p("주소 : "+dto.getAddress1());
		p("상세주소 : "+dto.getAddress2());
		p("직업 : "+dto.getJob());
		p("사진 : "+dto.getFname());
		p("가입날짜 : "+dto.getMdate());
		
	}

	private static void create(MemberDAO dao) {
		MemberDTO dto=new MemberDTO();
		dto.setId("test");
		dto.setPasswd("1234");
		dto.setMname("이나슬이");
		dto.setTel("010-1111-1111");
		dto.setEmail("sktmf@nate.com");
		dto.setJob("A01");
		dto.setZipcode("11111");
		dto.setAddress1("서울시");
		dto.setAddress2("종로구");
		dto.setFname("aaa.jpg");
		
		if(dao.create(dto)) {
			p("등록 성공");
		}else {
			p("등록 실패");
		}
	}

	private static void duplicateEmail(MemberDAO dao) {
		String email="email11@mail.com";
		
		if(dao.duplicateEmail(email)) {
			p("사용 중인 이메일입니다.");
		}else
			p("사용 가능한 이메일입니다.");
		
	}

	private static void duplicateId(MemberDAO dao) {
		String id="user11";
		
		if(dao.duplicateId(id)) {
			p("사용 중인 아이디입니다.");
		}else {
			p("사용 가능한 아이디입니다.");
		}
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}
