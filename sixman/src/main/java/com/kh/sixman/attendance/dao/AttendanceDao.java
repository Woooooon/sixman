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

	public List<AttendanceVo> selectList(SqlSessionTemplate sst, MemberVo loginMember, RowBounds rb) {
		return sst.selectList("attendanceMapper.selectList",loginMember, rb);
	}

	public int insertStart(SqlSessionTemplate sst, MemberVo loginMember) {
		return sst.insert("attendanceMapper.insertStart", loginMember);
	}

	public int countList(SqlSessionTemplate sst, MemberVo loginMember) {
		return sst.selectOne("attendanceMapper.countList", loginMember);
	}

	public int updateEnd(SqlSessionTemplate sst, AttendanceVo vo) {
		return sst.update("attendanceMapper.updateEnd", vo);
	}

	public WorkTimeVo todayWork(SqlSessionTemplate sst, WorkTimeVo workVo) {
		return sst.selectOne("attendanceMapper.todayWork", workVo);
	}
	
	public List<AttendanceVo> searchList(SqlSessionTemplate sst, AttendanceVo vo) {
		return sst.selectList("attendanceMapper.searchList", vo);
	}
/////////////////////////////////////////위에는 board 아래는 admin

	public List<MemberVo> ListMember(SqlSessionTemplate sst) {
		return sst.selectList("attendanceMapper.listMember");
	}

	public List<AttendanceVo> selectMemberList(SqlSessionTemplate sst, AttendanceVo vo, RowBounds rb) {
		return sst.selectList("attendanceMapper.selectMemberList",vo,rb);
	}

	public WorkTimeVo AdminTodayWork(SqlSessionTemplate sst, WorkTimeVo workVo) {
		return sst.selectOne("attendanceMapper.AdminTodayWork", workVo);
	}

	public int adminCountList(SqlSessionTemplate sst, AttendanceVo vo) {
		return sst.selectOne("attendanceMapper.adminCountList", vo);
	}

	public int updateMember(SqlSessionTemplate sst, AttendanceVo vo) {
		return sst.update("attendanceMapper.updateMember", vo);
	}



}
