package com.sist.model;

import java.io.UnsupportedEncodingException;
import java.net.http.HttpResponse;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.vo.*;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;

public class RecipeModel {
   /*
    * @RequestMapping("recipe/list.do") public String
    * recipe_list(HttpServletRequest request, HttpServletResponse response) {
    * String page=request.getParameter("page"); if(page==null) page="1"; int
    * curpage=Integer.parseInt(page);
    * 
    * recipeDAO dao=recipeDAO.newInstance(); List<recipeVO>
    * list=dao.recipeListData(curpage); int totalpage=dao.recipeTotalPage();
    * 
    * final int BLOCK=6; int startPage=((curpage-1)/BLOCK*BLOCK)+1; int
    * endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
    * 
    * if(endPage>totalpage) endPage=totalpage;
    * 
    * request.setAttribute("curpage", curpage); request.setAttribute("totalpage",
    * totalpage); request.setAttribute("list", list);
    * request.setAttribute("startPage", startPage); request.setAttribute("endPage",
    * endPage);
    * 
    * request.setAttribute("main_jsp", "../recipe/list.jsp"); return
    * "../main/main.jsp"; }
    */
   
   @RequestMapping("recipe/detail.do")
   public String recipe_detail(HttpServletRequest request, HttpServletResponse response)
   {
      String no=request.getParameter("no");
      recipeDAO dao=recipeDAO.newInstance();
      recipeVO vo=dao.recipeDetailData(Integer.parseInt(no));
      
      String[] cooking=vo.getCooking().split("\\|");
      String[] cookingimage=vo.getCooking_image().split("\\|");
      
      List<String> list1=Arrays.asList(cooking);
      List<String> list2=Arrays.asList(cookingimage);
      
      request.setAttribute("no", no);
      request.setAttribute("vo", vo);
      request.setAttribute("list1", list1);
      request.setAttribute("list2", list2);
      
      request.setAttribute("main_jsp","../recipe/detail.jsp");
      return "../main/main.jsp";
   }
   
   @RequestMapping("recipe/list.do")
   public String recipe_list(HttpServletRequest request, HttpServletResponse response)
   {
      try
      {
         request.setCharacterEncoding("UTF-8");
      }catch(Exception ex) {}
      String page=request.getParameter("page");
      String fd=request.getParameter("fd");
      String ss=request.getParameter("ss");
      if(page==null)
         page="1";
      int curpage=Integer.parseInt(page);
      
      recipeDAO dao=recipeDAO.newInstance();
      int totalpagee=dao.recipeTotalPagee(fd, ss);
      int totalpage=dao.recipeTotalPage();
      
      final int BLOCK=6;
      int startPage=((curpage-1)/BLOCK*BLOCK)+1;
      int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
                      
      if(endPage>totalpage)
         endPage=totalpage;
      
      if(fd==null)
         fd="title";
      if(ss==null)
         ss="";
      
      //List<recipeVO> list=dao.recipeListData(curpage);
      List<recipeVO> flist=dao.recipeListDataa(curpage, fd, ss);
      request.setAttribute("fd", fd);
      request.setAttribute("ss", ss);
      request.setAttribute("flist", flist);
      
      
      request.setAttribute("curpage", curpage);
      request.setAttribute("totalpagee", totalpagee);
      request.setAttribute("totalpage", totalpage);
      request.setAttribute("startPage", startPage);
      request.setAttribute("endPage", endPage);
      
      request.setAttribute("main_jsp", "../recipe/list.jsp");
      return "../main/main.jsp";
   }
}