package com.kh.sixman.addressBook.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sixman.addressBook.dao.AddressDao;
import com.kh.sixman.addressBook.vo.AddressVo;
import com.kh.sixman.addressBook.vo.SortationVo;
import com.kh.sixman.member.vo.MemberVo;

@Service
public class AddressService {

	@Autowired
	private AddressDao addressDao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public int countList(Map<String, String> search) {
		return addressDao.countList(sst, search);
	}

	public List<AddressVo> selectAddressList(RowBounds rb, Map<String, String> search) {
		
		return addressDao.selectAddressList(sst, rb, search);
	}

	public List<SortationVo> sortationList(String no) {
		return addressDao.sortationList(sst,no);
	}

	public List<AddressVo> selectAddressListAll(String no) {
		// TODO Auto-generated method stub
		return null;
	}

}
