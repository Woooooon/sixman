package com.kh.sixman.position.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.member.vo.MemberVo;
import com.kh.sixman.position.vo.PositionVo;

@Repository
public class PositionDao {
	public List<PositionVo> positionList(SqlSessionTemplate sst) {
		return sst.selectList("positionMapper.positionList");
	}

	public int deletePosition(SqlSessionTemplate sst, String no) {
		return sst.delete("positionMapper.deletePosition", no);
	}

	public int positionReset(SqlSessionTemplate sst, String no) {
		return sst.delete("positionMapper.positionReset", no);
	}

	public List<MemberVo> positionNullCheck(SqlSessionTemplate sst, String no) {
		return sst.selectList("positionMapper.positionNullCheck", no);
	}

	public int insertPosition(SqlSessionTemplate sst, String name) {
		return sst.insert("positionMapper.insertPosition", name);
	}

	public PositionVo selectPosition(SqlSessionTemplate sst, String name) {
		return sst.selectOne("positionMapper.selectPosition", name);
	}
}
