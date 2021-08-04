package com.camping.view.comment;


import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.camping.biz.comment.CommentService;
import com.camping.biz.comment.CommentVO;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@ResponseBody
	@RequestMapping(value="/comment.do", method=RequestMethod.POST)
	public String insertComment(@RequestParam("memId") String memId,@RequestParam("memNo") int memNo ,@RequestParam("rvNo") int rvNo, CommentVO vo) {
		System.out.println("댓글 등록 처리중");
			//현재 날짜
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
			Date now = new java.sql.Date(System.currentTimeMillis());
		
			vo.setComDate(now);
			System.out.println(vo);
			commentService.insertComment(vo);
			
		return "success";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/commentList.do" , method = RequestMethod.GET)
	public ResponseEntity commentList(CommentVO vo,Model model ,HttpServletRequest request) throws Exception{
		System.out.println("댓글 목록 처리중");
		
		List<CommentVO> comment = commentService.commentList(vo);
		
		System.out.println(comment);
		
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>(); 
		HttpHeaders responseHeaders = new HttpHeaders();
		 

	       if(comment.size() > 0){
	            for(int i=0; i<comment.size(); i++){
	                HashMap hm = new HashMap();
	                hm.put("comNo", comment.get(i).getComNo());
	                hm.put("comContent", comment.get(i).getComContent());
	                hm.put("memId", comment.get(i).getMemId());
	                hm.put("comDate", comment.get(i).getComDate());
	                
	                hmlist.add(hm);
	            }
	            
	        }
	       JSONArray json = new JSONArray(hmlist);        
	        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	}
	
	//ajax에서 실행된 do요청의 값을 반환
	@ResponseBody
	@RequestMapping(value="/deleteComment.do" , method = RequestMethod.GET)
	public String  deleteComment(CommentVO vo) {
		System.out.println("댓글 삭제 처리중");
		commentService.deleteComment(vo);
		
		return "Y";
	}
}
