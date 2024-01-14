package com.sist.model;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class GoodsJjimModel {
   @RequestMapping("jjim/jjim_insert.do")
   public String jjim_insert(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String cno=request.getParameter("cno");
	   String gno=request.getParameter("gno");
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   GoodsJJimVO vo=new GoodsJJimVO();
	   vo.setId(id);
	   vo.setCno(Integer.parseInt(cno));
	   vo.setGno(Integer.parseInt(gno));
	   GoodsJjimDAO dao=GoodsJjimDAO.newInstance();
	   dao.goodsJjimInsert(vo);
	   // 화면 이동 (서버) 
	   // sendRedirect() => 재호출 => .do (request를 초기화)
	   // forward() => 새로운 데이터 전송 (request에 값을 담아서 전송)
	   // return "redirect:"
	   return "redirect:../store/detail.do?cno="+cno+"&gno="+gno;
   }
   @RequestMapping("jjim/jjim_cancel.do")
   public String jjim_cancel(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String no=request.getParameter("no");
	   GoodsJjimDAO dao=GoodsJjimDAO.newInstance();
	   dao.goodsjjimCancel(Integer.parseInt(no));
	   return "redirect:../mypage/mypage_jjim.do";
   }
   
   
}




