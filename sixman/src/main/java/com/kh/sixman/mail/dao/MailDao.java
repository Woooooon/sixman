package com.kh.sixman.mail.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.mail.vo.MailVo;

@Repository
public class MailDao {

	public int write(SqlSessionTemplate sst, MailVo vo) {
		return sst.insert("mailMapper.write", vo);
	}

	public int send(SqlSessionTemplate sst, MailVo vo) {
		return sst.update("mailMapper.send", vo);
	}

	public int countList(SqlSessionTemplate sst, MailVo vo) {
		return sst.selectOne("mailMapper.countList", vo);
	}

	public List<MailVo> selectList(SqlSessionTemplate sst, MailVo vo, RowBounds rb) {
		return sst.selectList("mailMapper.selectList", vo, rb);
	}

	public MailVo selectOne(SqlSessionTemplate sst, String no) {
		return sst.selectOne("mailMapper.selectOne", no);
	}


	public int delete(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.update("mailMapper.delete", map);
	}

	public int updateRead(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.update("mailMapper.updateRead", map);
	}

//	
	public int changeCategory(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.update("mailMapper.changeCategory", map);
	}

	public int createCategory(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.insert("mailMapper.createCategory", map);
	}

	public List<Map<String, String>> categoryList(SqlSessionTemplate sst, String no) {
		return sst.selectList("mailMapper.categoryList", no);
	}

//	
	public int restore(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.update("mailMapper.restore", map);
	}

//	
	public int realDelete(SqlSessionTemplate sst, Map<String, Object> map) {
		return sst.update("mailMapper.realDelete", map);
	}

}
