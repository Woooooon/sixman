package com.kh.sixman.attendance.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.attendance.dao.AttendanceDao;
import com.kh.sixman.attendance.vo.AttendanceVo;
import com.kh.sixman.attendance.vo.WorkTimeVo;
import com.kh.sixman.member.vo.MemberVo;

@Service
public class AttendanceService {
	
	@Autowired
	private SqlSessionTemplate sst;
	@Autowired
	private AttendanceDao dao;

	public List<AttendanceVo> selectList(MemberVo loginMember, RowBounds rb) {
		return dao.selectList(sst,loginMember ,rb);
	}

	public int insertStart(MemberVo loginMember) {
		return dao.insertStart(sst, loginMember);
	}

	public int countList(MemberVo loginMember) {
		return dao.countList(sst, loginMember);
	}

	public int updateEnd(AttendanceVo vo) {
		return dao.updateEnd(sst, vo);
	}

	public WorkTimeVo todayWork(WorkTimeVo workVo) {
		return dao.todayWork(sst, workVo);
	}
/////////////////////////////////////////위에는 board 아래는 admin
	
	public List<MemberVo> ListMember() {
		return dao.ListMember(sst);
	}

	public List<AttendanceVo> selectMemberList(AttendanceVo vo) {
		return dao.selectMemberList(sst,vo);
	}

}
