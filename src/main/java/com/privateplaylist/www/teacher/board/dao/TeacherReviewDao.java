package com.privateplaylist.www.teacher.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Review;

import common.util.Paging;

@Repository
public class TeacherReviewDao {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Review> selectReviewList(Paging paging) {
		return sqlSession.selectList("TeacherReview.selectReviewList",paging);
	}

	public int selectCntReviewAll() {
		return sqlSession.selectOne("TeacherReview.selectCntReviewAll");
	}

}