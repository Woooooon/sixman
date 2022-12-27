package com.kh.sixman.document.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
   
   //게시글 작성
   public int write(DocumentVo dvo) {
      
      int result1 = dao.write(sst, dvo);
//      int result2 = dao.send(sst,dvo);
      
      String no = Integer.toString(result1);
      List<AttachmentVo> fileLists = dvo.getFileList();
      int result3 = 1;
      if(fileLists != null) {
         for(AttachmentVo fv : fileLists) {
            fv.setSubNo(no);
         }
         
         Map<String, Object> map = new HashMap<>();
         map.put("list",fileLists);
         map.put("tableName","AP_NO");
         
         result3= fdao.uploadAll(sst,map);
      }
      
//      return result1 * result2 * result3;
      	return result1  * result3;
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