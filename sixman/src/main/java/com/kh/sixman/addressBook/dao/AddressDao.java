package com.kh.sixman.addressBook.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.addressBook.vo.AddressVo;
import com.kh.sixman.addressBook.vo.ReciverVo;
import com.kh.sixman.addressBook.vo.SortationVo;
import com.kh.sixman.common.AttachmentVo;

@Repository
public class AddressDao {

	public int countList(SqlSessionTemplate sst, Map<String, String> search) {
		return sst.selectOne("addressMapper.countAddress", search);
	}

	public List<AddressVo> selectAddressList(SqlSessionTemplate sst, RowBounds rb, Map<String, String> search) {
		return sst.selectList("addressMapper.selectAddressList", search, rb);
	}

	public List<AddressVo> selectDlelteAddressList(SqlSessionTemplate sst, RowBounds rb, Map<String, String> search) {
		return sst.selectList("addressMapper.selectDlelteAddressList", search, rb);
	}
	
	public List<SortationVo> sortationList(SqlSessionTemplate sst, String no) {
		return sst.selectList("addressMapper.sortationList", no);
	}

	public List<AddressVo> selectAddressListAll(SqlSessionTemplate sst, String no) {
		return sst.selectList("addressMapper.selectAddressList", no);
	}
	
	public List<AddressVo> selectDlelteAddressListAll(SqlSessionTemplate sst, String no) {
		return sst.selectList("addressMapper.selectDlelteAddressList", no);
	}

	public int insertAddress(SqlSessionTemplate sst, AddressVo vo) {
		return sst.insert("addressMapper.insertAddress", vo);
	}

	public String getNo(SqlSessionTemplate sst) {
		return sst.selectOne("addressMapper.getNo");
	}

	public int upload(SqlSessionTemplate sst, AttachmentVo cardFile) {
		return sst.insert("addressMapper.upload", cardFile);
	}

	public int updateDeleteAddress(SqlSessionTemplate sst, List<String> no) {
		return sst.update("addressMapper.updateDeleteAddressAll", no);
	}

	public int deleteAddress(SqlSessionTemplate sst, List<String> no) {
		return sst.update("addressMapper.deleteAddress", no);
	}

	
	public AddressVo getAddress(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("addressMapper.getAddress", map);
	}

	public int updateThumb(SqlSessionTemplate sst, String no) {
		return sst.update("addressMapper.updateThumb", no);
	}

	public int updateAddress(SqlSessionTemplate sst, AddressVo vo) {
		return sst.update("addressMapper.updateAddress", vo);
	}

	public int restore(SqlSessionTemplate sst, List<String> no) {
		return sst.update("addressMapper.restore", no);
	}

	public int sendAddress(SqlSessionTemplate sst, List<ReciverVo> voList) {
		return sst.insert("addressMapper.sendAddress", voList);
	}

	public int countReciveList(SqlSessionTemplate sst, Map<String, String> search) {
		return sst.selectOne("addressMapper.countReciveAddress", search);
	}
	
	public List<ReciverVo> selectReciveList(SqlSessionTemplate sst, RowBounds rb, Map<String, String> search) {
		return sst.selectList("addressMapper.reciveAddressList", search, rb);
	}
	
	public List<AddressVo> getAddressAll(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("addressMapper.getAddressAll", map);
	}

	public int deleteReciveAddressAll(SqlSessionTemplate sst, List<String> no) {
		return sst.delete("addressMapper.deleteReciveAddressAll", no);
	}

	public List<AddressVo> selectReciveAddressList(SqlSessionTemplate sst, String addressNo) {
		return sst.selectList("addressMapper.selectReciveAddressList", addressNo);
	}

//	public int insertReciveAddress(SqlSessionTemplate sst, List<AddressVo> voList) {
//		return sst.insert("addressMapper.insertReciveAddress", voList);
//	}

	public int deleteReciveAddress(SqlSessionTemplate sst, String reciveNo) {
		return sst.delete("addressMapper.deleteReciveAddress", reciveNo);
	}

	public ReciverVo selectReciveInfo(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("addressMapper.selectReciveInfo", map);
	}

	public int updateReciveAddress(SqlSessionTemplate sst, ReciverVo vo) {
		return sst.update("addressMapper.updateReciveAddress", vo);
	}

	public int insertSortation(SqlSessionTemplate sst, SortationVo vo) {
		return sst.insert("addressMapper.insertSortation", vo);
	}

}
