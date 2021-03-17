package com.mycompany.myapp;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycompany.myapp.service.BoardService;
import com.mycompany.myapp.vo.BoardVO;
import com.mycompany.myapp.vo.PageVO;

@Controller
public class BoardController {
	
	@Resource(name = "boardService")
	private BoardService service;
	
	/* *** 여기서부터 이 책 추천해요 게시판 컨트롤러 *** */
	
	// 게시물 목록 조회 + 페이징
	@RequestMapping(value="/recommendList.do")
	public String getPostList(PageVO pv, Model model) {
		
		List<BoardVO> list = service.getPostListPaging(pv);
		System.out.println("페이지 번호 : "+pv.getPage());
		
		PagingObject po = new PagingObject();
		po.setPaging(pv);
		po.setPostTotalCount(service.countPosts());
		
		model.addAttribute("list", list);
		model.addAttribute("po", po);
		
		System.out.println(list);
		System.out.println(po);
		
		return "community/recommend_list";
	}
	
	// 게시물 상세 조회
	@RequestMapping(value="/recommendPost.do")
	public String getPost(int boardNo, Model model) {
		service.updateViewCnt(boardNo);
		model.addAttribute("post", service.getPost(boardNo));
		return "community/recommend_post";
	}
	
	// 게시물 등록 화면
	@RequestMapping(value="/recommendInsertForm.do")
	public String postInsertForm() {
		return "community/recommend_postInsertForm";
	}
	
	// 게시물 등록 처리
	@RequestMapping(value="/recommendInsert.do")
	public String postInsert(BoardVO post) {
		service.insertPost(post);
		return "redirect:recommendList.do";
	}
	
	// 게시물 수정 화면
	@RequestMapping(value="/recommendUpdateForm.do")
	public String postUpdateForm(int boardNo, Model model) {
		model.addAttribute("post", service.getPost(boardNo));
		return "community/recommend_postUpdateForm";
	}
	
	// 게시물 수정 처리
	@RequestMapping(value="/recommendUpdate.do")
	public String postUpdate(BoardVO post, RedirectAttributes ra) {
		service.updatePost(post);
		ra.addFlashAttribute("msg", "updateSuccess");
		return "redirect:recommendList.do";
	}
	
	// 게시물 삭제 처리
	@RequestMapping(value="recommendDelete.do")
	public String postDelete(int boardNo, RedirectAttributes ra) {
		service.deletePost(boardNo);
		ra.addFlashAttribute("msg", "deleteSuccess");
		return "redirect:recommendList.do";
	}
	
	/* *** 여기까지 이 책 추천해요 게시판 컨트롤러 *** */
	
	/* *** 여기서부터 없는 책 요청해요 게시판 컨트롤러 *** */
	
	/* *** 여기까지 없는 책 요청해요 게시판 컨트롤러 *** */

}
