package com.privateplaylist.www.teacher.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.privateplaylist.www.dto.Review;
import com.privateplaylist.www.teacher.board.service.TeacherReviewService;

import common.util.Paging;

@Controller
@RequestMapping("/teacher/review")
public class TeacherReviewController {
	
	@Autowired
	private TeacherReviewService teacherReviewService;
	
	//후기게시판 정보 전체 조회
			@RequestMapping("/list")
			public String questionList(Model model,HttpServletRequest req) {
				
				//요청 파라미터를 전달하여 paging 객체 생성하기
				Paging paging = teacherReviewService.reviewListPaging(req);
						
				//공지사항 정보 전체 조회 list
				List<Review> reviewList = teacherReviewService.selectReviewList(paging);
				
				//모델값 전달
				model.addAttribute("reviewList", reviewList);
				
				//페이징 결과 전달
				model.addAttribute("paging", paging);
				System.out.println(reviewList);
				
//				System.out.println(questionList);
				return "teacher/board/review/list";
		
			}
}