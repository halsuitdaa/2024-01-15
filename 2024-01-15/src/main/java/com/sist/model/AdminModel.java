package com.sist.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;
import com.sist.dao.GoodsDAO;
import com.sist.dao.MemberDAO;
import com.sist.vo.GoodsVO;
import com.sist.vo.MemberVO;

public class AdminModel {
	  @RequestMapping("adminpage/admin_main.do")
	  public String mypage_homee(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		  return "../main/main.jsp";
	  }
	  @RequestMapping("adminpage/admin_member.do")
	  public String adminpage_member(HttpServletRequest request,
			  HttpServletResponse response)
	  {
		  List<MemberVO> list=MemberDAO.getMemberId();
		  request.setAttribute("list", list);
		  request.setAttribute("admin_member_jsp", "../adminpage/admin_member.jsp");
		  request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		  return "../main/main.jsp";
	  }
	  @RequestMapping("adminpage/admin_goods.do")
	  public String adminpage_goods(HttpServletRequest request,HttpServletResponse response)
	  {
		  String type=request.getParameter("type");
		  if(type==null)
      	   type="1";
	      String page=request.getParameter("page");
	      if(page==null)
	   	   page="1";
   
	   // 페이지 지정
	   int curpage=Integer.parseInt(page);
	   // 페이지에 해당되는 목록
	   GoodsDAO dao=new GoodsDAO();
	   List<GoodsVO> list=dao.goodsListData(curpage, Integer.parseInt(type));
	   int totalpage=dao.goodsTotalPage(Integer.parseInt(type));
	               
	   final int BLOCK=6;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	               
	   if(endPage>totalpage)
	      endPage=totalpage;
	   
	   // JSP에서 출력할 데이터를 전송
	    request.setAttribute("list", list);
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    request.setAttribute("startPage", startPage);
	    request.setAttribute("endPage", endPage);
		  
		request.setAttribute("admin_goods_jsp", "../adminpage/admin_goods.jsp");
		request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		return "../main/main.jsp";
	  }
	  @RequestMapping("adminpage/admin_goods_detail.do")
	  public String admin_goods_detail(HttpServletRequest request,HttpServletResponse response)
	  {
		   String gno=request.getParameter("gno");
	       String cno=request.getParameter("cno");
	      
	       GoodsDAO dao=GoodsDAO.newInstance();
	       GoodsVO vo=dao.goodsListDetailData(Integer.parseInt(gno),Integer.parseInt(cno));
	       
	       
	       
	      request.setAttribute("vo", vo);
		  request.setAttribute("admin_goods_jsp", "../adminpage/admin_goods_detail.jsp");
		  request.setAttribute("main_jsp", "../adminpage/admin_main.jsp");
		  return "../main/main.jsp";
	  }
	  @RequestMapping("adminpage/admin_goods_update.do")
	  public String admin_goods_update(HttpServletRequest request,HttpServletResponse response)
	  {
		  
		  return "";
	  }
}