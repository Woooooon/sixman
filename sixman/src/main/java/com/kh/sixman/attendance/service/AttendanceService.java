package com.kh.sixman.attendance.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
		
		List<AttendanceVo> qwer = dao.selectList(sst,loginMember ,rb);
		
		SimpleDateFormat f = new SimpleDateFormat("HH:mm");
		
//		String result2 = null;
//		
//		for (int i = 0; i < qwer.size(); i++) {
//			
//			if(qwer.get(i).getEnd() != null) {
//				String d1 = qwer.get(i).getStart();
//				String d2 = qwer.get(i).getEnd();
//				
//				try {
//					Date date2 = f.parse(d2);
//					Date date1 = f.parse(d1);
//					
//					long timeMil1 = date1.getTime();
//		    		long timeMil2 = date2.getTime();
//		    		
//		    		long diff = timeMil2 - timeMil1;
//		    		
//		    		long diffMin = diff / (1000 * 60);
//		    		
//		    		int result = Math.round(diffMin/60);
//		    		
//		    		result2 = Integer.toString(result);
//		    		
//		    		
//				} catch (ParseException e) {
//					e.printStackTrace();
//				}
//				
//				AttendanceVo vo = new AttendanceVo();
//				vo.setWorkTime(result2);
//			}
//				
//			
//		}
		
		
		return qwer;
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
	public List<AttendanceVo> searchList(AttendanceVo vo) {
		return dao.searchList(sst,vo);
	}
/////////////////////////////////////////위에는 board 아래는 admin
	
	public List<MemberVo> ListMember() {
		return dao.ListMember(sst);
	}

	public List<AttendanceVo> selectMemberList(AttendanceVo vo, RowBounds rb) {
		return dao.selectMemberList(sst,vo,rb);
	}

	public WorkTimeVo AdminTodayWork(WorkTimeVo workVo) {
		return dao.AdminTodayWork(sst,workVo);
	}

	public int adminCountList(AttendanceVo vo) {
		return dao.adminCountList(sst, vo);
		
	}


}
