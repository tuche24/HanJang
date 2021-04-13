package com.mycompany.myapp;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.myapp.service.CommunityReplyService;
import com.mycompany.myapp.service.CommunityService;
import com.mycompany.myapp.utils.UploadFileUtils;
import com.mycompany.myapp.vo.CommunityReplyVO;
import com.mycompany.myapp.vo.CommunityVO;
import com.mycompany.myapp.vo.PageVO;
import com.mycompany.myapp.vo.PagingObject;

@Controller
public class CommunityController {
	
	// 추천 게시판 게시글
	@Resource(name = "community1Service")
	private CommunityService service1;
	
	// 추천 게시판 댓글
	@Resource(name = "reply1Service")
	private CommunityReplyService reply1service;
	
	// 요청 게시판 게시글
	@Resource(name = "community2Service")
	private CommunityService service2;
	
	// 요청 게시판 댓글
	@Resource(name = "reply2Service")
	private CommunityReplyService reply2service;
	
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
	public String getRecommendPost(CommunityVO vo, Model model) {
		service1.updateViewCnt(vo.getBoardNo());
		model.addAttribute("post", service1.getPost(vo.getBoardNo()));
		model.addAttribute("reply", reply1service.getReplyList(vo.getBoardNo()));
		return "community/recommend_post";
	}
	
	// 게시물 등록 화면
	@RequestMapping(value="/recommendInsertForm.do")
	public String getRecommendInsertForm() {
		return "community/recommend_postInsertForm";
	}
	
	// 게시물 등록 처리
	@RequestMapping(value="/recommendInsert.do")
	public String insertRecommendPost(CommunityVO post, MultipartFile file, HttpServletRequest req, RedirectAttributes ra) throws Exception {
		String fileUrl = UploadFileUtils.upload(file, req);
		post.setImgFile(fileUrl);
		System.out.println(post.getImgFile());
		service1.insertPost(post);
		ra.addFlashAttribute("msg", "insertSuccess");
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
	public String updateRecommendPost(CommunityVO post, RedirectAttributes ra) throws Exception {
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
		reply1service.insertReply(rv);
		return "redirect:recommendPost.do?boardNo="+boardNo;
	}
	
	// 댓글 삭제
	@RequestMapping(value="recommendReplyDelete.do")
	public String deleteRecommendReply(CommunityReplyVO rv, int boardNo) {
		System.out.println(rv);
		System.out.println(boardNo);
		reply1service.deleteReply(rv);
		return "redirect:recommendPost.do?boardNo="+boardNo;
	}
	
	/* *** 여기까지 이 책 추천해요 게시판 컨트롤러 *** */
	
	/******************************************************************************/
	
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
	public String getRequestPost(CommunityVO vo, Model model) {
		service2.updateViewCnt(vo.getBoardNo());
		model.addAttribute("post", service2.getPost(vo.getBoardNo()));
		model.addAttribute("reply", reply2service.getReplyList(vo.getBoardNo()));
		return "community/request_post";
	}
	
	// 게시물 등록 화면
	@RequestMapping(value="/requestInsertForm.do")
	public String getRequestInsertForm() {
		return "community/request_postInsertForm";
	}
	
	// 게시물 등록 처리
	@RequestMapping(value="/requestInsert.do")
	public String insertRequestPost(CommunityVO post, MultipartFile file, HttpServletRequest req, RedirectAttributes ra) throws Exception {
		String fileUrl = UploadFileUtils.upload(file, req);
		post.setImgFile(fileUrl);
		System.out.println(post.getImgFile());
		service2.insertPost(post);
		ra.addFlashAttribute("msg", "insertSuccess");
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
	public String insertRequestReply(CommunityReplyVO rv, int boardNo) {
		System.out.println(rv);
		reply2service.insertReply(rv);
		return "redirect:requestPost.do?boardNo="+boardNo;
	}
	
	// 댓글 삭제
	@RequestMapping(value="requestReplyDelete.do")
	public String deleteRequestReply(CommunityReplyVO rv, int boardNo) {
		reply2service.deleteReply(rv);
		return "redirect:requestPost.do?boardNo="+boardNo;
	}
	
	
	/* *** 여기까지 없는 책 요청해요 게시판 컨트롤러 *** */

}
