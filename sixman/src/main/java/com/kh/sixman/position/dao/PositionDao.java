package com.kh.sixman.position.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.position.vo.PositionVo;

@Repository
public class PositionDao {
	public List<PositionVo> positionList(SqlSessionTemplate sst) {
		return sst.selectList("positionMapper.positionList");
	}
}
