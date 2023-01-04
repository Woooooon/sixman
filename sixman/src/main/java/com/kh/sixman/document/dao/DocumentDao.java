package com.kh.sixman.document.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sixman.document.vo.DocumentSaveVo;
import com.kh.sixman.document.vo.DocumentVo;
import com.kh.sixman.notice.vo.NoticeVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class DocumentDao {

	

	public int send(SqlSessionTemplate sst, DocumentVo dvo) {
		return sst.update("documentMapper.send",dvo);
	}

	public int write(SqlSessionTemplate sst, DocumentVo dvo) {
		log.debug("dvo :" + dvo);
		return sst.insert("documentMapper.write",dvo);
	
		
	}


	public String getDocuementNo(SqlSessionTemplate sst, DocumentVo dvo) {
		return sst.selectOne("documentMapper.getNo",dvo);
	}

	public int countList(SqlSessionTemplate sst, String keyword) {
		return sst.selectOne("documentMapper.selectCount",keyword);
	}


	public List<DocumentVo> selectList(SqlSessionTemplate sst, String keyword, RowBounds rb) {
		return sst.selectList("documentMapper.selectList", keyword, rb);
	}


	public int viewCount(SqlSessionTemplate sst, String no) {
		return sst.update("DocumentMapper.viewCount", no);
		
	}


	public DocumentVo selectOne(SqlSessionTemplate sst, String no) {
		return sst.selectOne("DocumentMapper.selectOne", no);
	}


	public List<DocumentVo> nextAndPre(SqlSessionTemplate sst, String no) {
		return sst.selectList("DocumentMapper.nextAndPre", no);
	}

	public int writesv(SqlSessionTemplate sst, DocumentVo dvo) {
		return sst.insert("DocumentMapper.stateis",dvo);
	}

	public List<DocumentVo> selectDcList(SqlSessionTemplate sst) {
		return sst.selectList("documentMapper.docuselect");
	}

}
