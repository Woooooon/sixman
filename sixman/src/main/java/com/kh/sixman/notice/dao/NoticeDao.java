package com.kh.sixman.notice.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.notice.vo.NoticeVo;

@Repository
public class NoticeDao {

	public int countList(SqlSessionTemplate sst, String keyword) {
		return sst.selectOne("noticeMapper.selectCount", keyword);
	}

	public List<NoticeVo> selectList(SqlSessionTemplate sst, String keyword, RowBounds rb) {
		return sst.selectList("noticeMapper.selectList", keyword, rb);
	}

	public int write(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.insert("noticeMapper.write", vo);
	}

	public String getNoticeNo(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.selectOne("noticeMapper.getNo", vo);
	}

	public NoticeVo selectOne(SqlSessionTemplate sst, String no) {
		return sst.selectOne("noticeMapper.selectOne", no);
	}

	public int delete(SqlSessionTemplate sst, String no) {
		return sst.update("noticeMapper.updateDelete", no);
	}

	public int update(SqlSessionTemplate sst, NoticeVo vo) {
		return sst.update("noticeMapper.updateOne", vo);
	}
}
