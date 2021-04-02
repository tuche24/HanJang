package com.mycompany.myapp;


import java.io.PrintWriter;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.myapp.service.BestSellerService;
import com.mycompany.myapp.service.KakaoService;
import com.mycompany.myapp.service.MemberService;
import com.mycompany.myapp.service.dao.MemberDAO;
import com.mycompany.myapp.vo.BookVO;
import com.mycompany.myapp.vo.MemberVO;



@Controller
public class MemberController {
	
	@Resource(name = "memberService")
	private MemberService memberservice1;
	
	
	@Autowired
	private BestSellerService service;
	@Autowired
	private BookDBController dbcontroller;
	@Autowired
    private KakaoService kakaoService;
	@RequestMapping("mainAll.do")
	public ModelAndView bookList(@RequestParam(required=false) String categoryId) {
		ModelAndView mav = new ModelAndView();
		
		// xml 파싱 후 VO로 값을 받음
		List<BookVO> bookList = service.searchBook(categoryId);
		
		// DB에 VO 반복해 넣는 메소드
		for(BookVO vo: bookList) {
			dbcontroller.DBinsert(vo);
		}
		
		
		mav.addObject("bookList", bookList);
		mav.setViewName("main");
		return mav;
	}
	//회원가입
	@RequestMapping(value="/JoinPro.do")
	public String InsertMember(MemberVO membervo) throws Exception {
		
		memberservice1.MemberInsert(membervo);
		return "LoginForm";
		
	}
	
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String loginMember(MemberVO membervo,HttpSession session, HttpServletResponse res) throws Exception {
	MemberVO membervo2 = null;
	membervo2 = memberservice1.LoginCheck(membervo);
	res.setContentType("text/html; charset=UTF-8");
	PrintWriter out = res.getWriter();
	
	//로그인체크
	if(membervo2!=null) {
		// memberVO 키에 MemberVO VO값을 넣음
		session.setAttribute("memberVO", membervo2);
		session.setAttribute("loginVO", membervo2.getId());
		session.setAttribute("loginNick", membervo2.getNickname());
		
		return "redirect:mainAll.do";
	} else {
		out.println("<script>alert(\"아이디나 비밀번호가 틀렸습니다.\")</script>");
		out.flush();
		return "LoginForm";
			}
	
	}
	
	//로그아웃

	@RequestMapping(value = "/Logout.do", method = RequestMethod.GET)
	public void logout(HttpSession session,HttpServletResponse response)throws Exception{
		session.removeAttribute("memberVO"); // 
		session.removeAttribute("loginVO");
		session.removeAttribute("loginNick");
		session.invalidate(); // 모두 초기화
		memberservice1.logout(response);
	}
	
	//회원가입 아이디 중복확인
	@ResponseBody
	@RequestMapping(value="/idcheck.do", method=RequestMethod.POST)
	public int IdCheck(@RequestParam("id") String param) throws Exception{
		
		int result = memberservice1.IdCheck(param);
		System.out.println(result);
	
		return result;
		
	}
	/*@ResponseBody
	@RequestMapping(value="/idcheck.do",produces="text/plane")
	public String IDCheck(@RequestBody String paramData) throws ParseException{=
		String ID = paramData.trim();
		System.out.println(ID);
		MemberVO mvo = memberservice1.Id_Check(ID);
	}*/
	
	
	
	
	
	/* *** 여기서부터 이 책 추천해요 게시판 컨트롤러 *** */
	
	// 게시물 목록 조회 + 페이징

	@RequestMapping("/kakaologin.do")
    public String home(@RequestParam(value = "code", required = false) String code,HttpSession session) throws Exception{
        System.out.println("#########" + code);
        String access_Token = kakaoService.getAccessToken(code);
        HashMap<String, Object> userInfo = kakaoService.getUserInfo(access_Token);
        String nickname= (String) userInfo.get("nickname");
        
       int result =  memberservice1.kakaoidfind(nickname);
       System.out.println(result);
        
       if(result==1) {
    	   MemberVO vo = memberservice1.findoneinfo(nickname);
    	   session.setAttribute("memberVO", vo);
    	   session.setAttribute("loginVO", vo.getId());
   		session.setAttribute("loginNick", nickname);
   		return "redirect:/mainAll.do";
    	   
       }else {
		session.setAttribute("loginNick", nickname);
        return "kakaojoin";
       }
        
    }

	@RequestMapping (value = "findpw.do") 
	public  void  findPwPOST (@ModelAttribute MemberVO member, HttpServletResponse response)  throws Exception { 
		memberservice1.findPw (response, member); 
	}
	
	@RequestMapping (value = "/gotofindpw.do")
	public String goToFindPw() {
		
		return "test/findpw";
	}
	
	
	
	
}
