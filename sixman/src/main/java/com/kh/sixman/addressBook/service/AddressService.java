package com.kh.sixman.addressBook.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sixman.addressBook.dao.AddressDao;
import com.kh.sixman.addressBook.vo.AddressVo;
import com.kh.sixman.addressBook.vo.SortationVo;
import com.kh.sixman.common.AttachmentVo;

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
		return addressDao.selectAddressListAll(sst,no);
	}
	
	@Transactional
	public int insertAddress(AddressVo vo) {
		
		int insertAddress = addressDao.insertAddress(sst, vo);
		
		
		AttachmentVo cardFile = vo.getCardFileInfo();
		
		int cardFileResult = 1;
		
		if(cardFile != null) {
			String no = addressDao.getNo(sst, vo);
			cardFile.setSubNo(no);
			
			cardFileResult = addressDao.upload(sst, cardFile);
		}
		
		
		return insertAddress * cardFileResult;
	}

	public int updateDeleteAddress(List<String> no) {
		return addressDao.updateDeleteAddress(sst, no);
	}
	
	public int deleteAddress(List<String> no) {
		return addressDao.deleteAddress(sst, no);
	}

	public AddressVo getAddress(Map<String, String> map) {
		return addressDao.getAddress(sst, map);
	}
	
	@Transactional
	public int updateAddress(AddressVo vo) {
		int insertAddress = addressDao.updateAddress(sst, vo);
		
		
		AttachmentVo cardFile = vo.getCardFileInfo();
		
		int cardFileResult = 1;
		int beforeCardFileThumb = 1;
		
		if(cardFile != null) {
			String no = vo.getNo();
			cardFile.setSubNo(no);
			
			beforeCardFileThumb = addressDao.updateThumb(sst, no);
			
			cardFileResult = addressDao.upload(sst, cardFile);
		}
		
		
		return insertAddress * cardFileResult * beforeCardFileThumb;
	}

	public List<AddressVo> selectDlelteAddressList(RowBounds rb, Map<String, String> search) {
		return addressDao.selectDlelteAddressList(sst, rb, search);
	}
	
	public List<AddressVo> selectDeleteAddressListAll(String no) {
		return addressDao.selectDlelteAddressListAll(sst,no);
	}

	public int restore(List<String> no) {
		return addressDao.restore(sst,no);
	}
}
