package com.kh.sixman.addressBook.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sixman.addressBook.dao.AddressDao;
import com.kh.sixman.addressBook.vo.AddressVo;
import com.kh.sixman.addressBook.vo.ReciverVo;
import com.kh.sixman.addressBook.vo.SortationVo;
import com.kh.sixman.common.AttachmentVo;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
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
	
	public int insertSortation(SortationVo vo) {
		return addressDao.insertSortation(sst, vo);
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
			String no = addressDao.getNo(sst);
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
		return addressDao.restore(sst, no);
	}

	public int sendAddress(List<ReciverVo> voList) {
		return addressDao.sendAddress(sst, voList);
	}

	public int countReciveList(Map<String, String> search) {
		return addressDao.countReciveList(sst, search);
	}

	public List<ReciverVo> selectReciveList(RowBounds rb, Map<String, String> search) {
		return addressDao.selectReciveList(sst, rb, search);
	}

	public List<AddressVo> getAddressAll(Map<String, String> map) {
		return addressDao.getAddressAll(sst, map);
	}

	public int deleteReciveAddressAll(List<String> no) {
		return addressDao.deleteReciveAddressAll(sst, no);
	}
	
	@Transactional
	public int insertReciveAddress(List<Map<String, String>> reciveDatalist, String no) {
		int insertAddress = 1;
		int deleteReciveAddress = 1;
		int cardFileResult = 1;
		
		for(Map<String, String> AddressMap : reciveDatalist) {
			String reciveNo = AddressMap.get("no");
			String addressNo = AddressMap.get("addressNo");
			
			List<AddressVo> voList = addressDao.selectReciveAddressList(sst, addressNo);
			for(AddressVo vo : voList) {
				vo.setUserNo(no);
				vo.setSortationNo("1");
				vo.setComment(null);
				log.info("AddressVo " + vo);
				
				insertAddress = addressDao.insertAddress(sst, vo);
				
				if(vo.getFileName() != null) {
					AttachmentVo cardFile = new AttachmentVo();
					String ano = addressDao.getNo(sst);
					cardFile.setSubNo(ano);
					cardFile.setChangeName(vo.getFileName());
					cardFile.setOriginName(vo.getFileName());
					cardFile.setFilePath("C:\\dev\\sixman\\sixman/src/main/webapp/resources/img/address/");
					log.info("cardFile : " + cardFile);
					cardFileResult = addressDao.upload(sst, cardFile);
				}
			}
			
			
			deleteReciveAddress = addressDao.deleteReciveAddress(sst, reciveNo);
		}
		
		log.info("result " + insertAddress * deleteReciveAddress * cardFileResult);
		return insertAddress * deleteReciveAddress * cardFileResult;
	}

	public List<AddressVo> reciveDetailList(String addressNo) {
		return addressDao.selectReciveAddressList(sst, addressNo);
	}

	public ReciverVo selectReciveInfo(Map<String, String> map) {
		return addressDao.selectReciveInfo(sst, map);
	}

	public int updateReciveAddress(ReciverVo vo) {
		int updateReciveAddress = 1;
		int deleteReciveAddress = 1;
		
		if(vo.getSendAddress() == "") {
			deleteReciveAddress = addressDao.deleteReciveAddress(sst, vo.getNo());
		}
		
		if(vo.getSendAddress() != "") {
			updateReciveAddress = addressDao.updateReciveAddress(sst, vo);
		}
		
		return deleteReciveAddress * updateReciveAddress;
	}

	public int insertReciveDetailAddress(ReciverVo vo, String insertNum) {
		int cardFileResult = 1;
		int insertAddress = 1;
		int deleteReciveAddress = 1;
		int updateReciveAddress = 1;
		
		List<AddressVo> voList = addressDao.selectReciveAddressList(sst, insertNum);
		
		for(AddressVo addressVo : voList) {
			addressVo.setUserNo(vo.getReciverNo());
			addressVo.setSortationNo("1");
			addressVo.setComment(null);
			
			log.info("AddressVo " + vo);
			
			insertAddress = addressDao.insertAddress(sst, addressVo);
			
			if(addressVo.getFileName() != null) {
				AttachmentVo cardFile = new AttachmentVo();
				String ano = addressDao.getNo(sst);
				cardFile.setSubNo(ano);
				cardFile.setChangeName(addressVo.getFileName());
				cardFile.setOriginName(addressVo.getFileName());
				cardFile.setFilePath("C:\\dev\\sixman\\sixman/src/main/webapp/resources/img/address/");
				log.info("cardFile : " + cardFile);
				cardFileResult = addressDao.upload(sst, cardFile);
			}
		}
		
		if(vo.getSendAddress() == "") {
			deleteReciveAddress = addressDao.deleteReciveAddress(sst, vo.getNo());
		}
		
		if(vo.getSendAddress() != "") {
			updateReciveAddress = addressDao.updateReciveAddress(sst, vo);
		}
		
		return updateReciveAddress * insertAddress * cardFileResult * deleteReciveAddress;
	}
}
