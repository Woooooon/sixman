package com.kh.sixman.document.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sixman.common.AttachmentVo;
import com.kh.sixman.common.FileUnit;
import com.kh.sixman.common.PageVo;
import com.kh.sixman.document.service.DocumentBoardService;
import com.kh.sixman.document.service.DocumentService;
import com.kh.sixman.document.vo.DocumentVo;
import com.kh.sixman.member.vo.MemberVo;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@RequestMapping("document")
@Controller
public class DocumentController {

   
   @Autowired
   private DocumentService ds;
   @Autowired
   private DocumentBoardService dbs;
   


   

   @GetMapping("first")
   public String list(HttpSession session,Model model, String page, String keyword ) {
      //로그인한 유저의 세션 가져오기
      MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");

      //로그인 유저의 seqNo 가져오기
      String no = loginMember.getNo();
      
      //page요청이 없으면 기본값으로 1설정
      if(page == null) {
         page = "1";
      }
      
      log.info(keyword);

      //로그인 유저마다 주소록이 별개이므로 검색 시 userNo 추가 WHERE문
      Map<String, String> search = new HashMap<String, String>();
      search.put("keyword", keyword);
      search.put("no", no);
      
      //페이징 셋
      int pageLimit = 5;
      int boardLimit = 10;
      
      //총 주소록 개수
      int listCount = ds.countingList(search);
      
      log.info("listCount : " + listCount);
      
       int offset = (Integer.parseInt(page)-1) * boardLimit;
       
       PageVo pv = new PageVo(listCount,Integer.parseInt(page),pageLimit,boardLimit);
       RowBounds rb = new RowBounds(offset , boardLimit);

       //각페이지마다 리스트 8개씩 
      List<DocumentVo> documentList = ds.selectDocumentList(rb, search);
      log.info("documentList" + documentList);
      

      model.addAttribute("keyword", keyword);
      model.addAttribute("pv", pv);
      
      model.addAttribute("dvo", documentList);

      
      return "document/first";
   }
  
    
   
   //기안문서함(화면)
   @GetMapping("page")
//   public String First(String listType,Model model) {
   public String First(Model model ,HttpServletRequest request ) {
      
   
      List<DocumentVo> dvo = ds.selectDocumentList();
      model.addAttribute("dvo", dvo);
      
      
      
      
     

      return "document/first";
   }
  
   
//   //기안문서함 (찐)
//   @ResponseBody
//   @PostMapping(value="document/first", produces = "application/json; charset=utf8")
//   public String First(int page ,String keyword){
//      
//      int pageLimit = 5;
//      int boardLimit = 10;
//      int listCount = ds.countList(keyword);
//      
//       int offset = (page-1) * boardLimit;
//       RowBounds rb = new RowBounds(offset , boardLimit);
//       
//       PageVo pv = new PageVo(listCount,page,pageLimit,boardLimit);
//       List<DocumentVo> list = ds.selectList(keyword, rb);
//       
//
//      Map<String, Object> map = new HashMap<>();
//      
//      map.put("pv", pv);
//      map.put("dvo", list);
//      map.put("listCount", listCount);
//      
//      Gson gson = new GsonBuilder().create();
//      String json = gson.toJson(map);
//      return json;
//     
//   }

   //게시글 상세보기
//   @RequestMapping(value = "document/detail" , method= RequestMethod.GET)
//   public String getdetail(Model model ,int no) throws Exception{
//      
//      DocumentVo data = dbs.detail(no);
//      model.addAttribute("data", data);
//      
//      return "document/d";
//   }
 
   //상세보기 
   @RequestMapping(value="detail",method = RequestMethod.GET)
   public void detail(@RequestParam("no") int no,Model model) throws Exception{
      
      
     DocumentVo dvo =  dbs.detail(no);
      model.addAttribute("dvo", dvo);
      
   }
   
   //게시글 수정
   @RequestMapping(value ="modify", method = RequestMethod.GET)
   public void Modify(@RequestParam("no") int no,Model model) throws Exception{
      
      DocumentVo dvo = dbs.detail(no);
      model.addAttribute("detail",dvo);
      
   }
   // 게시물 수정
   @RequestMapping(value = "modify", method = RequestMethod.POST)
   public String postModify(DocumentVo dvo, HttpSession session) throws Exception {
   
    dbs.modify(dvo);

    return "redirect:/document/detail?no=" + dvo.getNo();
   }
   
   @PostMapping("modifyData")
   public String modifyData(DocumentVo dvo, HttpSession session) {
      
       MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");      
         String rootPath = session.getServletContext().getRealPath("/");
         List<AttachmentVo> fileList = FileUnit.uploadFile(dvo.getFile(), rootPath, "upload/document");
         
         dvo.setNo(loginMember.getNo());
         dvo.setFileList(fileList);
         
         
         int result = ds.write(dvo);
      
      return "document/detail";
   }
   
   

    //게시물 삭제
   @RequestMapping(value = "firstdelete", method = RequestMethod.GET)
   public String postdelete(String no) throws Exception {
         ds.delete(no);
      return "document/first";
   }

//   //게시물 선택삭제
//   @RequestMapping(value = "deletecheck", method = RequestMethod.GET)
//   public String ajaxTest(HttpServletRequest request) throws Exception {
//
//       String[] valueArr = request.getParameterValues("valueArr");
//       int size = valueArr.length;
//       for(int i=0; i<size; i++) {
//         ds.delete(valueArr[i]);
//       }
//       return "document/first";
//   }
   
   @PostMapping("first")
   public String delete(Model model,HttpServletRequest request ) throws Exception {
      

      String[] valueArr = request.getParameterValues("valueArr");
       int size = valueArr.length;
       System.out.println(valueArr[0]);
       for(int i=0; i<size; i++) {
          ds.delete(valueArr[i]);
       }
      
      
      return "document/first";
   }
   
   
   //결재상신(화면)
   @GetMapping("approve")
   public String Approve(Model model) {

      return "document/approve";
   }
   //결재상신 (찐)
   @PostMapping("approve")
   public String Approve(DocumentVo dvo) {
      

      return "document/approve";
   }
   
   
   
   
   //결재상신(mypage)(화면)
   @GetMapping("approvemy")
   public String ApproveMyPage(Model model) {
//      List<DocumentVo> dvo = ds.selectdsList();
//      model.addAttribute("dvo",dvo);
//      
//      List<DocumentVo> dvoap = ds.selectapList();
//      model.addAttribute("dvo",dvoap);
      return "document/approvemy";
   }
   
   //결재상신(mypage) (찐)
   @RequestMapping(value="document/approvemy",method = RequestMethod.POST)
   @ResponseBody
   @PostMapping("approvemy")
   public String ApproveMyPage(@RequestParam(value="apprmyArr") List<String> approvemy,DocumentVo dvo) {
        
      return "document/approvemy";
   }
   
   //결재문서함(화면)
   @GetMapping("payment")
   public String mainDocu() {
      return "document/payment";
   }
   //결재문서함 (찐)
   @PostMapping("payment")
   public String mainDocu(DocumentVo dvo) {
      return "";
   }
   
   //참조문서함(화면)
   @GetMapping("reference")
   public String Reference() {
      return "document/reference";
   }
   //참조문서함 (찐)
   @PostMapping("reference")
   public String Reference(DocumentVo dvo) {
      return "";
   }

   
   //임시보관함(화면)
   @GetMapping("keep")
   public String Keep() {
      return "document/keep";
   }
   //임시보관함 (찐)
   @PostMapping("keep")
   public String Keep(DocumentVo dvo) {
      return "";
   }
   

   //결재선 작성(화면)
   @GetMapping("write")
//   public String Write(String sendPay, Model model){
   public String write( Model model,HttpSession session,DocumentVo dvo){


      
      
      
      return "document/write";
   }

   
   /*
    * //결재선 작성 (찐)
    * 
    * @PostMapping("write") public String write(DocumentVo dvo , HttpSession
    * session ) {
    * 
    * MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
    * 
    * 
    * String rootPath = session.getServletContext().getRealPath("/");
    * List<AttachmentVo> fileList = FileUnit.uploadFile(dvo.getFile(), rootPath,
    * "upload/document");
    * 
    * 
    * 
    * dvo.setSendPay(loginMember.getNo()); dvo.setSendName(loginMember.getName());
    * dvo.setFileList(fileList);
    * 
    * 
    * 
    * int result = ds.write(dvo);
    * 
    * if(result > 0) { return "document/first"; }else { return "에러페이지"; }
    * 
    * }
    */
   
   
   //state 값 넣는거 해야함
   //결재선 작성 (찐)
   @PostMapping("write")
   public String write(DocumentVo dvo , HttpSession session) {
      
      
      
      MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");      
      String rootPath = session.getServletContext().getRealPath("/");
      List<AttachmentVo> fileList = FileUnit.uploadFile(dvo.getFile(), rootPath, "upload/document");
      
      dvo.setSendPay(loginMember.getNo());
      dvo.setFileList(fileList);
      
      
      int result = ds.write(dvo);
      
      if(result > 0) {
         return "document/write";
      }else {
         return "에러페이지";
      }
      
   }
   
   
   


   
   

   
}