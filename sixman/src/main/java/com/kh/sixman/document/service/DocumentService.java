package com.kh.sixman.document.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sixman.addressBook.vo.AddressVo;
import com.kh.sixman.addressBook.vo.SortationVo;
import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.document.dao.DocumentDao;
import com.kh.sixman.document.dao.DocumentFileDao;
import com.kh.sixman.document.vo.Criteria;
import com.kh.sixman.document.vo.DocumentSaveVo;
import com.kh.sixman.document.vo.DocumentVo;



@Service
public class DocumentService {

   @Autowired
   private SqlSessionTemplate sst;
   @Autowired
   private DocumentDao dao;
   @Autowired
   private DocumentFileDao fdao;
   
  
   
   //게시글 작성
   @Transactional
   public int write(DocumentVo dvo) {
      
      int result1 = dao.write(sst, dvo);
//      int result2 = dao.send(sst,dvo);
      
      int result3 = dao.writesv(sst, dvo);
      
      String no = dao.getDocuementNo(sst, dvo);
      
      List<AttachmentVo> fileLists = dvo.getFileList();
      int result2 = 1;
      if(fileLists != null) {
         for(AttachmentVo fv : fileLists) {
            fv.setSubNo(no);
         }
         
         Map<String, Object> map = new HashMap<>();
         map.put("list",fileLists);
         map.put("tableName","DOCUMENT");
         
         result2= fdao.uploadAll(sst,map);
      }
      	return result1  * result2 * result3;
//      	return result1  * result2;
   }



   public Map<String, DocumentVo> selectOne(String no) {
		
		dao.viewCount(sst, no);
		DocumentVo dvo = dao.selectOne(sst, no);
		
		if(dvo==null) return null;
		
		List<DocumentVo> list = dao.nextAndPre(sst, no);
		DocumentVo next = null;
		DocumentVo pre = null;
		
		if(list.size()>=1) {
			for(DocumentVo n : list) {
				int a = Integer.parseInt(n.getNo());
				int b = Integer.parseInt(no);
				if(a>b) {
					next  = n;
				}else {
					pre  = n;
				}
			}
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("no", no);
		map.put("tableName","DOCUMENT");
		
		List<AttachmentVo> fileList = fdao.selectFileList(sst, map);
		dvo.setFileList(fileList);
		
		Map<String, DocumentVo> resultMap = new HashMap<>();
		resultMap.put("dvo", dvo);
		resultMap.put("next", next);
		resultMap.put("pre", pre);
		
		return resultMap;
	}

public int countList(String keyword) {
	return dao.countList(sst, keyword);
}


public List<DocumentVo> selectList(String keyword, RowBounds rb) {
	return dao.selectList(sst, keyword, rb);
}



public List<DocumentVo> selectDocumentList() {
	
	return dao.selectDcList(sst);
}



public List<DocumentVo> selectdsList() {
	return dao.selectdsList(sst);
}



//결재선페이지 APP_NO 불러오기
public List<DocumentVo> selectapList() {
	return dao.selectapList(sst);
}



public Object delete(String no) {
	return dao.delete(sst, no);
}



public int countingList(Map<String, String> search) {
	return dao.countingList(sst, search);
}



public List<DocumentVo> selectDocumentList(RowBounds rb, Map<String, String> search) {
	return dao.selectDocumentList(sst,rb,search);
}
















}