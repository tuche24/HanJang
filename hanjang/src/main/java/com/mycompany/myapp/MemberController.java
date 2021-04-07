package com.mycompany.myapp;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.myapp.service.BestSellerService;
import com.mycompany.myapp.service.KakaoService;
import com.mycompany.myapp.service.MemberService;
import com.mycompany.myapp.service.OrderListService;
import com.mycompany.myapp.vo.BookVO;
import com.mycompany.myapp.vo.MemberVO;
import com.mycompany.myapp.vo.OrderListVO;
import com.mycompany.myapp.vo.PageVO;
import com.mycompany.myapp.vo.PagingObject;

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
	@RequestMapping(value="/loginform.do")
	public String goToLogin() {
		return "member/LoginForm";
	}
	//회원가입
	@RequestMapping(value="/JoinPro.do")
	public String InsertMember(MemberVO membervo,RedirectAttributes ra) throws Exception {
		memberservice1.MemberInsert(membervo);
		ra.addFlashAttribute("msg", "signupSuccess");
		return "redirect:/loginform.do";
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
		session.setAttribute("loginPassword", membervo2.getPassword());
		session.setAttribute("loginName", membervo2.getName());
		session.setAttribute("loginEmail", membervo2.getEmail());
		session.setAttribute("loginPhone", membervo2.getPhone());
		session.setAttribute("loginAddress", membervo2.getAddress());
		
		return "redirect:mainAll.do";
	} else {
		out.println("<script>alert(\"아이디나 비밀번호가 틀렸습니다.\")</script>");
		out.flush();
		return "member/LoginForm";
			}
	}
	
	//로그아웃
	@RequestMapping(value = "/Logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session,HttpServletResponse response)throws Exception{
		session.removeAttribute("memberVO"); // 
		session.removeAttribute("loginVO");
		session.removeAttribute("loginNick");
		session.invalidate(); // 모두 초기화
		/*memberservice1.logout(response);*/
		return "redirect:/mainAll.do";
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
    		System.out.println(vo.getId());
    		System.out.println(vo.getAddress());
    	   session.setAttribute("memberVO", vo);
   		session.setAttribute("loginVO", vo.getId());
   		session.setAttribute("loginNick", vo.getNickname());
   		session.setAttribute("loginPassword", vo.getPassword());
   		session.setAttribute("loginName", vo.getName());
   		session.setAttribute("loginEmail", vo.getEmail());
   		session.setAttribute("loginPhone", vo.getPhone());
   		session.setAttribute("loginAddress", vo.getAddress());
   		return "redirect:/mainAll.do";
    	   
       }else {
		session.setAttribute("loginNick", nickname);
        return "member/kakaojoin";
       }
    }

	// 아이디 찾기
	@RequestMapping(value = "/gotofindpw.do")
	public String goToFindPw() {
		return "test/findpw";
	}
	
	// 비밀번호 찾기
	@RequestMapping(value = "findpw.do") 
	public void findPwPOST (@ModelAttribute MemberVO member, HttpServletResponse response)  throws Exception { 
		memberservice1.findPw (response, member); 
	}
	
	/* *** 마이페이지 관련 컨트롤러 *** */
	
	@Resource(name = "orderListService")
	private OrderListService orderlistservice;
	
	// 마이페이지 주문내역 페이지 조회 + 페이징
	@RequestMapping(value="mypageOrderList.do")
	public String getMyOrderList(HttpSession session, Model model, PageVO pv) {
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		int userNo = memberVO.getUserNo();
		System.out.println("현재 접속한 사용자 번호 : "+userNo);
		System.out.println("현재 페이지 정보 : "+pv);
		
		List<OrderListVO> list = orderlistservice.getOrderedList(userNo, pv);
		System.out.println("리스트 사이즈 : "+list.size());
		
		PagingObject po = new PagingObject();
		po.setPaging(pv);
		po.setPostTotalCount(orderlistservice.countPosts(userNo));
		System.out.println("총 주문 개수 : "+orderlistservice.countPosts(userNo));
		System.out.println("현재 페이징 정보 :"+po);		
		
		model.addAttribute("orderlist", list);
		model.addAttribute("po", po);
		model.addAttribute("cnt", orderlistservice.countPosts(userNo));
		return "member/mypage_orderlist";
	}
	
	// 마이페이지 회원정보수정 페이지
	@RequestMapping(value="mypageMyInfo.do")
	public String getMyInfo() {
		return "member/mypage_myinfo";
	}
	
	// 마이페이지 회원정보수정 처리
	@RequestMapping(value="updateMyInfo.do")
	public String updateMyInfo(MemberVO membervo, RedirectAttributes ra) throws Exception {
		memberservice1.MemberUpdate(membervo);
		ra.addFlashAttribute("msg", "updateSuccess");
		return "redirect:mypageMyInfo.do";
	}
	
	// 마이페이지 회원 탈퇴 처리
	@RequestMapping(value="deleteMyInfo.do")
	public String deleteMyInfo(MemberVO membervo, RedirectAttributes ra) throws Exception {
		System.out.println(membervo.getId());
		memberservice1.MemberDelete(membervo);
		ra.addFlashAttribute("msg", "withdrawalSuccess");
		return "redirect:mainAll.do";
	}
	
	// 장바구니에서 배송지변경 popup 수정 처리
	@RequestMapping(value="/updateAddress.do")
	@ResponseBody
	public Map<String,Object> updateAddress(MemberVO memberVO, HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		memberservice1.updateAddress(memberVO);
		session.setAttribute("loginAddress", memberVO.getAddress());
		result.put("code", "서버동기화");
		return result;
	}
	
}