package com.privateplaylist.www.student.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.privateplaylist.www.dto.Review;
import com.privateplaylist.www.member.vo.Member;

import common.util.Paging;

@Repository
public class StudentReviewDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int selectReviewListCnt(int userNo) {
		return sqlSession.selectOne("StuReview.selectReviewListCnt", userNo);
	}

//	public Map<Object, String> selectReviewList(Map<String, Object> map) {
//		return sqlSession.selectList("StuReview.selectReviewList", map);
//	}

	public List<Map<String, Object>> selectReviewList(Paging paging) {
		Map<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		return sqlSession.selectList("StuReview.selectReviewList", map);
	}
	
	
}
