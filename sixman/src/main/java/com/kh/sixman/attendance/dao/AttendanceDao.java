package com.kh.sixman.attendance.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.attendance.vo.AttendanceVo;
import com.kh.sixman.attendance.vo.WorkTimeVo;
import com.kh.sixman.member.vo.MemberVo;

@Repository
public class AttendanceDao {

	public List<AttendanceVo> selectList(SqlSessionTemplate sst, RowBounds rb) {
		return sst.selectList("attendanceMapper.selectList",null, rb);
	}

	public int insertStart(SqlSessionTemplate sst) {
		return sst.insert("attendanceMapper.insertStart");
	}

	public int countList(SqlSessionTemplate sst) {
		return sst.selectOne("attendanceMapper.countList");
	}

	public int updateEnd(SqlSessionTemplate sst, AttendanceVo vo) {
		return sst.update("attendanceMapper.updateEnd", vo);
	}

	public WorkTimeVo todayWork(SqlSessionTemplate sst, WorkTimeVo workVo) {
		return sst.selectOne("attendanceMapper.todayWork", workVo);
	}
	
/////////////////////////////////////////위에는 board 아래는 admin

	public List<MemberVo> ListMember(SqlSessionTemplate sst) {
		return sst.selectList("attendanceMapper.listMember");
	}

	public List<AttendanceVo> selectMemberList(SqlSessionTemplate sst, AttendanceVo vo) {
		return sst.selectList("attendanceMapper.selectMemberList",vo);
	}

	

}
