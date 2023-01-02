package com.kh.sixman.addressBook.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.addressBook.vo.AddressVo;
import com.kh.sixman.addressBook.vo.SortationVo;

@Repository
public class AddressDao {

	public int countList(SqlSessionTemplate sst, Map<String, String> search) {
		return sst.selectOne("addressMapper.countAddress", search);
	}

	public List<AddressVo> selectAddressList(SqlSessionTemplate sst, RowBounds rb, Map<String, String> search) {
		return sst.selectList("addressMapper.selectAddressList", search, rb);
	}

	public List<SortationVo> sortationList(SqlSessionTemplate sst, String no) {
		return sst.selectList("addressMapper.sortationList", no);
	}

	public List<AddressVo> selectAddressListAll(SqlSessionTemplate sst, String no) {
		return sst.selectList("addressMapper.selectAddressList", no);
	}

}
