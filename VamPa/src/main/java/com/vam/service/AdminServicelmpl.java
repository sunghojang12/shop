package com.vam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.AdminMapper;
import com.vam.model.BookVO;
import com.vam.model.CateVO;
import com.vam.model.Criteria;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServicelmpl implements AdminService {  //adminService 선언한 메서드를 오버라이딩(=재정의) 구현
	
	@Autowired
	private AdminMapper adminMapper;

	@Override //상품등록
	public void bookEnroll(BookVO book) {
		log.info("(service)bookEnroll.............");
		adminMapper.bookEnroll(book);
		
	}

	@Override // 카테고리 리스트
	public List<CateVO> cateList() {
		log.info("(service)cateList.......");
		
		return adminMapper.cateList();
	}

	@Override // 상품 리스트
	public List<BookVO> goodsGetList(Criteria cri) {
	   log.info(("goodsGetTotalList().............."));
		return adminMapper.goodsGetList(cri);
	}

	@Override //상품 총 갯수
	public int goodsGetTotal(Criteria cri) {
		log.info("goodsGetTotal().................");
		return adminMapper.goodsGetTotal(cri);
	}

	@Override //상품 조회 페이지
	public BookVO goodsGetDetail(int bookId) {
		
		log.info("(service)bookGetDetail........." + bookId);
		
		return adminMapper.goodsGetDetail(bookId);
	}

	@Override //상품 정보 수정
	public int goodsModify(BookVO vo) {
		
	   log.info("goodsModify...........");
		
		return adminMapper.goodsModify(vo);
	}

	@Override //상품 삭제
	public int goodsDelete(int bookId) {
		log.info("goodsDelet...........");
		return adminMapper.goodsDelete(bookId);
	}
	

}
