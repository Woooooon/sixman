package com.kh.sixman.notice.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.notice.vo.NoticeVo;

@Repository
public class NoticeDao {

	public int countList(SqlSessionTemplate sst, String keyword) {
		return sst.selectOne("noticeMapper.countList", keyword);
	}

	public List<NoticeVo> selectList(SqlSessionTemplate sst, String keyword, RowBounds rb) {
		return sst.selectList("noticeMapper.selectList", keyword, rb);
	}
}
