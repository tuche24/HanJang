package com.spring.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mycompany.myapp.service.dao.BoardDAO;
import com.mycompany.myapp.vo.PageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class CommunityPagingTest {
	
	@Autowired
	private BoardDAO dao;
	
	@Test
	public void pagingTest() {
		
		System.out.println("총 게시물 수 : "+dao.countPosts());
		
		PageVO pv = new PageVO();
		pv.setPage(5);
		int pageBtn = 10;
		int lastPage = (pv.getPage()/pageBtn)*pageBtn;
		System.out.println("마지막 페이지 번호 : "+lastPage);
		
		int firstPage = (lastPage-pageBtn)+1;
		System.out.println("시작 페이지 번호 : "+firstPage);
		
		boolean isPrev = firstPage == 1 ? false : true;
		System.out.println("이전 버튼 활성화 여부 : "+isPrev);
		
		boolean isNext = (dao.countPosts() <= (lastPage*pv.getCountPerPage())) ? false : true;
		System.out.println("다음 버튼 활성화 여부 : "+isNext);
		
		if(!isNext) {
			lastPage = dao.countPosts()/pv.getCountPerPage();
			System.out.println("다음 버튼이 없을 때의 마지막 페이지 번호 : "+lastPage);
		}
	}
	
	@Test // 안됨
	public void pagingTest2() {
		
		PageVO pv = new PageVO();
		pv.setPage(1);
		pv.setCountPerPage(10);
		System.out.println(dao.getPostListPaging(pv));
		System.out.println("-----------------------------------------");
		dao.getPostListPaging(pv).forEach(b -> System.out.println(b));
		System.out.println("-----------------------------------------");
		
	}

}
