package com.kh.sixman.notice.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.notice.vo.NoticeVo;
import com.kh.sixman.notice.vo.SearchVo;

@Repository
public class NoticeDao2 {

	public int countReseiveList(SqlSessionTemplate sst, SearchVo sv) {
		return sst.selectOne("noticeMapper.countReseiveList", sv);
	}

	public int countSendList(SqlSessionTemplate sst, SearchVo sv) {
		return sst.selectOne("noticeMapper.countSendList", sv);
	}

	public int countList(SqlSessionTemplate sst, SearchVo sv) {
		return sst.selectOne("noticeMapper.countList", sv);
	}
	
	public List<NoticeVo> selectReseiveList(SqlSessionTemplate sst, SearchVo sv, RowBounds rb) {
		return sst.selectList("noticeMapper.selectReseiveList", sv, rb);
	}

	public List<NoticeVo> selectSendList(SqlSessionTemplate sst, SearchVo sv, RowBounds rb) {
		return sst.selectList("noticeMapper.selectSendList", sv, rb);
	}

	public List<NoticeVo> selectList(SqlSessionTemplate sst, SearchVo sv, RowBounds rb) {
		return sst.selectList("noticeMapper.selectList", sv, rb);
	}

	public int countTempList(SqlSessionTemplate sst, SearchVo sv) {
		return sst.selectOne("noticeMapper.selectBoardList", sv);
	}

	public List<NoticeVo> selectTempList(SqlSessionTemplate sst, SearchVo sv, RowBounds rb) {
		return sst.selectList("noticeMapper.selectBoardList", sv, rb);
	}

	public int countDeleteList(SqlSessionTemplate sst, SearchVo sv) {
		return sst.selectOne("noticeMapper.selectBoardList", sv);
	}

	public List<NoticeVo> selectDeleteList(SqlSessionTemplate sst, SearchVo sv, RowBounds rb) {
		return sst.selectList("noticeMapper.selectBoardList", sv, rb);
	}


//    return ss.selectList("boardMapper.selectBoardList", null, rb);
}
