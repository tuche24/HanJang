package com.mycompany.myapp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.myapp.service.CommunityReplyService;
import com.mycompany.myapp.service.CommunityService;
import com.mycompany.myapp.vo.CommunityReplyVO;
import com.mycompany.myapp.vo.CommunityVO;
import com.mycompany.myapp.vo.PageVO;
import com.mycompany.myapp.vo.PagingObject;

@Controller
public class CommunityController {
	
	// 책 추천 게시판
	@Resource(name = "community1Service")
	private CommunityService service1;
	
	// 책 요청 게시판
	@Resource(name = "community2Service")
	private CommunityService service2;
	
	// 댓글
	@Resource(name = "replyService")
	private CommunityReplyService replyservice;
	
	/* *** 여기서부터 이 책 추천해요 게시판 컨트롤러 *** */
	
	// 게시물 목록 조회 + 페이징
	@RequestMapping(value="/recommendList.do")
	public String getRecommendPostList(PageVO pv, Model model) {
		
		List<CommunityVO> list = service1.getPostListPaging(pv);
		System.out.println("페이지 번호 : "+pv.getPage());
		
		PagingObject po = new PagingObject();
		po.setPaging(pv);
		po.setPostTotalCount(service1.countPosts());
		
		model.addAttribute("list", list);
		model.addAttribute("po", po);
		
		System.out.println(list);
		System.out.println(po);
		
		return "community/recommend_list";
	}
	
	// 게시물 상세 조회 + 조회수 카운트
	@RequestMapping(value="/recommendPost.do")
	public String getRecommendPost(int boardNo, Model model) {
		service1.updateViewCnt(boardNo);
		model.addAttribute("post", service1.getPost(boardNo));
		model.addAttribute("reply", replyservice.getReplyList(boardNo));
		return "community/recommend_post";
	}
	
	// 게시물 등록 화면
	@RequestMapping(value="/recommendInsertForm.do")
	public String getRecommendInsertForm() {
		return "community/recommend_postInsertForm";
	}
	
	// 게시물 등록 처리
	@RequestMapping(value="/recommendInsert.do")
	public String insertRecommendPost(CommunityVO post) {
		service1.insertPost(post);
		return "redirect:recommendList.do";
	}
	
	// 게시물 수정 화면
	@RequestMapping(value="/recommendUpdateForm.do")
	public String getRecommendUpdateForm(int boardNo, Model model) {
		model.addAttribute("post", service1.getPost(boardNo));
		return "community/recommend_postUpdateForm";
	}
	
	// 게시물 수정 처리
	@RequestMapping(value="/recommendUpdate.do")
	public String updateRecommendPost(CommunityVO post, RedirectAttributes ra) {
		service1.updatePost(post);
		ra.addFlashAttribute("msg", "updateSuccess");
		return "redirect:recommendList.do";
	}
	
	// 게시물 삭제 처리
	@RequestMapping(value="recommendDelete.do")
	public String deleteRecommendPost(int boardNo, RedirectAttributes ra) {
		service1.deletePost(boardNo);
		ra.addFlashAttribute("msg", "deleteSuccess");
		return "redirect:recommendList.do";
	}
	
	// 댓글 등록
	@RequestMapping(value="recommendReplyInsert.do")
	public String insertRecommendReply(CommunityReplyVO rv, int boardNo) {
		System.out.println(rv);
		replyservice.insertReply(rv);
		return "redirect:recommendPost.do?boardNo="+boardNo;
	}
	
	// 댓글 수정
	@RequestMapping(value="recommendReplyUpdate.do")
	public String updateRecommendReply(CommunityReplyVO rv) {
		replyservice.updateReply(rv);
		return "redirect:commnuity/recommend_post";
	}
	
	// 댓글 삭제
	@RequestMapping(value="recommendReplyDelete.do")
	public String deleteRecommendReply(int replyNo) {
		return "redirect:community/recommend_post";
	}
	
	/* *** 여기까지 이 책 추천해요 게시판 컨트롤러 *** */
	
	/******************************************************************/
	
	/* *** 여기서부터 없는 책 요청해요 게시판 컨트롤러 *** */
	
	// 게시물 목록 조회 + 페이징
	@RequestMapping(value="/requestList.do")
	public String getRequestPostList(PageVO pv, Model model) {
		
		List<CommunityVO> list = service2.getPostListPaging(pv);
		System.out.println("페이지 번호 : "+pv.getPage());
		
		PagingObject po = new PagingObject();
		po.setPaging(pv);
		po.setPostTotalCount(service2.countPosts());
		
		model.addAttribute("list", list);
		model.addAttribute("po", po);
		
		System.out.println(list);
		System.out.println(po);
		
		return "community/request_list";
	}
	
	// 게시물 상세 조회 + 조회수 카운트
	@RequestMapping(value="/requestPost.do")
	public String getRequestPost(int boardNo, Model model) {
		service2.updateViewCnt(boardNo);
		model.addAttribute("post", service2.getPost(boardNo));
		model.addAttribute("reply", replyservice.getReplyList(boardNo));
		return "community/request_post";
	}
	
	// 게시물 등록 화면
	@RequestMapping(value="/requestInsertForm.do")
	public String getRequestInsertForm() {
		return "community/request_postInsertForm";
	}
	
	// 게시물 등록 처리
	@RequestMapping(value="/requestInsert.do")
	public String insertRequestPost(CommunityVO post) {
		service2.insertPost(post);
		return "redirect:requestList.do";
	}
	
	// 게시물 수정 화면
	@RequestMapping(value="/requestUpdateForm.do")
	public String getRequestUpdateForm(int boardNo, Model model) {
		model.addAttribute("post", service2.getPost(boardNo));
		return "community/request_postUpdateForm";
	}
	
	// 게시물 수정 처리
	@RequestMapping(value="/requestUpdate.do")
	public String updateRequestPost(CommunityVO post, RedirectAttributes ra) {
		service2.updatePost(post);
		ra.addFlashAttribute("msg", "updateSuccess");
		return "redirect:requestList.do";
	}
	
	// 게시물 삭제 처리
	@RequestMapping(value="requestDelete.do")
	public String deleteRequestPost(int boardNo, RedirectAttributes ra) {
		service2.deletePost(boardNo);
		ra.addFlashAttribute("msg", "deleteSuccess");
		return "redirect:requestList.do";
	}
	
	// 댓글 등록
	@RequestMapping(value="requestReplyInsert.do")
	public String insertRequestReply(CommunityReplyVO rv) {
		replyservice.insertReply(rv);
		System.out.println(rv);
		return "redirect:community/request_post";
	}
	
	// 댓글 수정
	@RequestMapping(value="requestReplyUpdate.do")
	public String updateRequestReply(CommunityReplyVO rv) {
		replyservice.updateReply(rv);
		return "redirect:commnuity/request_post";
	}
	
	// 댓글 삭제
	@RequestMapping(value="requestReplyDelete.do")
	public String deleteRequestReply(int replyNo) {
		replyservice.deleteReply(replyNo);
		return "redirect:community/request_post";
	}
	
	/* *** 여기까지 없는 책 요청해요 게시판 컨트롤러 *** */

}
