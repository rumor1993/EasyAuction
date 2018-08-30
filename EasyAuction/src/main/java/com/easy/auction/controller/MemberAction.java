package com.easy.auction.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.easy.auction.dao.MemberService;
import com.easy.auction.model.MemberBean;

@Controller
public class MemberAction {
	
	@Autowired
	private MemberService memberService;
	
//	private String saveFolder = 
//			"C:/Program Files/Apache Software Foundation/Tomcat 8.5/webapps/EasyAuction/resources/upload";

	private String saveFolder = "D:\\sts\\EasyAuction\\EasyAuction\\src\\main\\webapp\\resources\\upload";

//	private String saveFolder = "/Users/shane/eclipseworkspace/EasyAuction/src/main/webapp/resources/upload";
	
	
	/*약관 동의*/
	@RequestMapping(value="/member_agree.nhn")
	public String member_agree(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		return "member/member_agree";
	}
	
	/*회원가입 폼*/
	@RequestMapping(value="/member_join.nhn")
	public String member_join(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		return "member/member_join";
	}
	
	/*회원가입*/
	@RequestMapping(value="/member_join_ok.nhn", method=RequestMethod.POST)
	public void member_join_ok(
			MemberBean m,
			HttpServletResponse response,
			HttpServletRequest request) throws Exception{	
		response.setContentType("text/html; charset=UTF-8");

		String em_phone = m.getEm_phone1()+"-"+m.getEm_phone2()+"-"+m.getEm_phone3();
		String em_email = m.getEm_mailid()+"@"+m.getEm_maildomain(); //메일주소
		String em_post = m.getEm_post();
		String em_bank = request.getParameter("em_bank");
		
		m.setEm_post(em_post);
		m.setEm_phone(em_phone);
		m.setEm_email(em_email);
		m.setEm_bank(em_bank);
		this.memberService.insertMember(m);
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('회원가입을 축하합니다.');");
		out.println("</script>");
		//로그인 페이지로 이동
		response.sendRedirect("main.nhn");
		
	}
	
	//ID중복검사 ajax함수로 처리부분
	@RequestMapping(value="/member_idcheck.nhn", method=RequestMethod.POST)
	public void member_idcheck(
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			
		PrintWriter out = response.getWriter();
		String id=request.getParameter("em_id");
		int re = memberService.checkMemberId(id);
		out.print(re);
		}
	
	/*로그인폼 이동*/
	@RequestMapping(value="/member_login.nhn")
	public ModelAndView member_login(
			ModelAndView mv,
			HttpServletRequest request,
			HttpServletResponse response,
		@CookieValue(value="saveid", required=false)Cookie readCookie)throws Exception {
		
		if(readCookie != null) {
			mv.addObject("saveid", readCookie.getValue());
		}
		mv.setViewName("member/member_login");
		return mv;
	}
	
	/*로그인*/
	@RequestMapping(value="member_login_ok.nhn", 
			method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView member_login_ok(
			HttpServletRequest request,
			HttpServletResponse response
			) throws Exception{
		
		//HttpSession 클래스는 세션객체를 생성해서 로그인 인증 처리를 하기 위해서입니다.
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter(); //출력스트림 객체 생성
		HttpSession session = request.getSession();//세션 객체 생성
		
		String id=request.getParameter("em_id").trim();
		String pwd=request.getParameter("em_pass").trim();
		
		MemberBean m = this.memberService.userCheck(id);
		
		if(m==null) { //등록되지 않은 회원일때
			out.println("<script>");
			out.println("alert('존재하지 않는 아이디입니다.');");
			out.println("history.back()");
			out.println("</script>");
		} else { //등록된 회원일때
			if(m.getEm_pass().equals(pwd)){	//비번이 같을때
				session.setAttribute("id", id);
				
				String em_name = m.getEm_name();
				session.setAttribute("em_name", em_name);
				
				//"saveid"라는 이름의 쿠키에 id의 값을 저장한 쿠키를 생성합니다.
				Cookie savecookie = new Cookie("saveid", id);
				if(request.getParameter("saveid")!= null) {
					savecookie.setMaxAge(60*60);
				} else {
					System.out.println("쿠키저장 : 0");
					savecookie.setMaxAge(0);
				}
				response.addCookie(savecookie);
				//jsp폴더의 view.jsp로 이동
				ModelAndView loginM = new ModelAndView("redirect:/main.nhn");
				return loginM;
			} else { //비번이 다를때
				out.println("<script>");
				out.println("alert('비밀번호가 틀렸습니다.')");
				out.println("history.go(-1)");
				out.println("</script>");
			}
		}
		return null;
	}
	/*아이디찾기 폼*/
	@RequestMapping(value="/member_id_find.nhn")
	public String member_id_find(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		return "member/member_id_find";
	}
	/*비번찾기 폼*/
	@RequestMapping(value="/member_pwd_find.nhn")
	public String member_pwd_find(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		return "member/member_pwd_find";
	}
	
	/*아이디 찾기 확인
	@RequestMapping(value="/member_id_ok.nhn", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView member_id_ok(
			HttpServletRequest request,
			HttpServletResponse response ) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String em_name= request.getParameter("em_name").trim();
		String em_email= request.getParameter("em_mailid")+"@"+ request.getParameter("em_maildomain");
		String em_phone = request.getParameter("em_phone1")+"-"
						  +request.getParameter("em_phone2")+"-"
						  +request.getParameter("em_phone3");
		Map am =new HashMap();
		//컬렉션 Map에 키와 값 저장합니다
		am.put("em_name", em_name);
		am.put("em_email", em_email);
		am.put("em_phone", em_phone);
		
		MemberBean member = this.memberService.findid(am);
		if(member == null) {//맞지 않는 경우
			out.println("<script>");
			out.println("alert('입력된 정보가 맞지 않습니다!')");
			out.println("history.go(-1)");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원님의 아이디는 "+member.getEm_id()+" 입니다.')");
			out.println("location.href='main.nhn';");
			out.println("</script>");
		}
		return null;
		
	}*/
	
	/*아이디 찾기 확인*/
	@RequestMapping(value="/member_id_ok.nhn", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView member_id_ok(
			HttpServletRequest request,
			HttpServletResponse response ) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String em_name= request.getParameter("em_name").trim();
		String em_email= request.getParameter("em_email").trim();
		String em_phone = request.getParameter("em_phone").trim();
						  
		Map am =new HashMap();
		//컬렉션 Map에 키와 값 저장합니다
		am.put("em_name", em_name);
		am.put("em_email", em_email);
		am.put("em_phone", em_phone);
		
		MemberBean member = this.memberService.findid(am);
		if(member == null) {//맞지 않는 경우
			out.println("<script>");
			out.println("alert('입력된 정보가 맞지 않습니다!')");
			out.println("history.go(-1)");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원님의 아이디는 "+member.getEm_id()+" 입니다.')");
			out.println("location.href='main.nhn';");
			out.println("</script>");
		}
		return null;
		
	}
	
	/*비밀번호 찾기 확인*/
	@RequestMapping(value="/member_pwd_ok.nhn", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView member_pwd_ok(
			HttpServletRequest request,
			HttpServletResponse response ) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String em_id=request.getParameter("em_id").trim();
		String em_name=request.getParameter("em_name").trim();
		String em_phone = request.getParameter("em_phone").trim();
		
		Map pm =new HashMap();
		//컬렉션 Map에 키와 값 저장합니다
		pm.put("em_id", em_id);
		pm.put("em_name", em_name);
		pm.put("em_phone", em_phone);
		
		MemberBean member = this.memberService.findpwd(pm);
		if(member == null) {//맞지 않는 경우
			out.println("<script>");
			out.println("alert('입력된 정보가 맞지 않습니다!')");
			out.println("history.go(-1)");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원님의 비밀번호는 "+member.getEm_pass()+" 입니다.')");
			out.println("location.href='main.nhn';");
			out.println("</script>");
		}
		return null;
	}
	
	/*회원정보 수점폼*/
	@RequestMapping(value="/member_edit.nhn")
	public ModelAndView member_edit(HttpServletRequest request) throws Exception{
		
		HttpSession session=request.getSession();
		
		String id=(String)session.getAttribute("id");
		
		MemberBean editm=this.memberService.userCheck(id);
		String em_phone=editm.getEm_phone();
		String em_email=editm.getEm_email();
		//java.util 패키지의 StringTokenizer 클래스는 첫번째 전달인자를
		//두번째 -를 기준으로 문자열을 파싱해 줍니다.
		//휴대폰 번호 저장
		
		StringTokenizer st02 = new StringTokenizer(em_phone, "-");
		String em_phone1=st02.nextToken(); //첫번쨰
		String em_phone2=st02.nextToken(); //두번째
		String em_phone3=st02.nextToken(); //세번째
		
		StringTokenizer st03=new StringTokenizer(em_email,"@");
		String em_mailid=st03.nextToken();
		String em_maildomain=st03.nextToken();
		
		String em_address1= editm.getEm_address1();
		String em_address2= editm.getEm_address2();
		
		ModelAndView m = new ModelAndView("member/member_edit");
		m.addObject("editm", editm);
		
		m.addObject("em_phone1", em_phone1);
		m.addObject("em_phone2", em_phone2);
		m.addObject("em_phone3", em_phone3);
		
		m.addObject("em_mailid", em_mailid);
		m.addObject("em_maildomain", em_maildomain);
		
		m.addObject("em_address1", em_address1);
		m.addObject("em_address2", em_address2);
		
		return m;
	}
	
	@RequestMapping(value ="/member_edit_ok.nhn",
			method= {RequestMethod.POST,RequestMethod.GET})
	public ModelAndView member_edit_ok(MemberBean m, HttpServletRequest request,
										HttpServletResponse response) throws Exception{
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		String em_pass2 = request.getParameter("em_pass2");
		
		String em_phone = m.getEm_phone1()+"-"+m.getEm_phone2()+"-"+m.getEm_phone3();
		String em_email = m.getEm_mailid()+"@"+m.getEm_maildomain(); //메일주소
		
		m.setEm_id(id);
		m.setEm_pass(em_pass2);
		m.setEm_phone(em_phone);
		m.setEm_email(em_email);
		//MemberBean editm=this.memberService.userCheck(id);
	    
		this.memberService.updateMember(m); //수정 메서드 호출
		
		
		out.println("<script>");
		out.println("alert('회원수정이 완료되었습니다.');");
		out.println("</script>");
		
	      ModelAndView mv=new ModelAndView("main/main");
	      mv.addObject("em_name",m.getEm_name());
	      mv.addObject("state","edit");
	      return mv;
	}
	
	/*회원정보 삭제 폼*/
	@RequestMapping(value="/member_del.nhn")
	public ModelAndView member_del(
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();// 세션객체를 만듬
		
		String id=(String)session.getAttribute("id");
		
		MemberBean deleteM=this.memberService.userCheck(id);
		
		ModelAndView dm=new ModelAndView("member/member_del");
		dm.addObject("d_id", id);
		dm.addObject("d_name", deleteM.getEm_name());
		
		return dm;
	}
	
	/*회원정보 삭제 완료*/
	@RequestMapping(value="/member_del_ok.nhn",
			method= {RequestMethod.POST, RequestMethod.GET})
	public void member_del_ok(
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		
		String id=(String)session.getAttribute("id");
		String pass=request.getParameter("pwd").trim();
		
		MemberBean member = this.memberService.userCheck(id);
		
		if(id==null) {	//세션 아이디 값이 없는 경우
		out.println("<script>");
		out.println("alert('다시 로그인 해주세요!')");
		out.println("location='main.nhn");
		out.println("</script>");
		}
		
		if(!member.getEm_pass().equals(pass)) {
			out.println("<script>");
			out.println("alert('비번이 다릅니다!')");
			out.println("history.back()");
			out.println("</script>");
		}
		member.setEm_id(id);
		this.memberService.deleteMember(id);//삭제 메서드 호출
		out.println("<script>");
		out.println("alert('탈퇴완료 되었습니다.!')");
		out.println("</script>");
		
		session.invalidate();//세션만료
		response.sendRedirect("main.nhn");
	}
	
	/*로그아웃 폼*/
	@RequestMapping(value="/member_logout.nhn")
	public String member_logout() {
		return "member/member_logout";
		//member 폴더의 member_logout.jsp 뷰 페이지 실행
	}
}
	
