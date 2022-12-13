package com.kh.sixman.mail.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.mail.vo.MailVo;
import com.kh.sixman.notice.vo.NoticeVo;

@Repository
public class MailDao {

	public int write(SqlSessionTemplate sst, MailVo vo) {
		return sst.insert("mailMapper.write", vo);
	}

	public int send(SqlSessionTemplate sst, MailVo vo) {
		return sst.insert("mailMapper.send", vo);
	}

	public int countList(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("mailMapper.countList", map);
	}

	public List<NoticeVo> selectList(SqlSessionTemplate sst, Map<String, String> map, RowBounds rb) {
		return sst.selectList("mailMapper.selectList", map, rb);
	}

	public MailVo selectOne(SqlSessionTemplate sst, String no) {
		return sst.selectOne("mailMapper.selectOne", no);
	}

}
