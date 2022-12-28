package com.kh.sixman.document.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.document.dao.DocumentDao;
import com.kh.sixman.document.dao.DocumentFileDao;
import com.kh.sixman.document.vo.DocumentVo;

@Service
public class DocumentService {

   @Autowired
   private SqlSessionTemplate sst;
   @Autowired
   private DocumentDao dao;
   @Autowired
   private DocumentFileDao fdao;
   
   @Transactional
   //게시글 작성
   public int write(DocumentVo dvo) {
      
      int result1 = dao.write(sst, dvo);
//      String no = Integer.toString(result1);
      String no = dao.getDocNo(sst,dvo);
      
      
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
      	return result1  * result2;
   }

public int countList(DocumentVo dvo) {
	return dao.countList(sst,dvo);
}

public List<DocumentVo> selectList(DocumentVo dvo, RowBounds rb) {
	
	return null;
}

public List<Map<String, String>> typeList(String no) {
	// TODO Auto-generated method stub
	return null;
}

}