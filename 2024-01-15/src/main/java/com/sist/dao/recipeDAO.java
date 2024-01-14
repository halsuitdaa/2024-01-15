package com.sist.dao;

import java.util.*;
import java.sql.*;
import com.sist.dbcp.*;
import com.sist.vo.*;

public class recipeDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDBCPConnection dbconn=new CreateDBCPConnection();
	private final int rowSize=12;
	private static recipeDAO dao;
	
	// 싱글턴
	public static recipeDAO newInstance()
	{
		if(dao==null)
			dao=new recipeDAO();
		return dao;
	}
	
	// 준우 ver
	public List<recipeVO> recipeMainListData()
	{
		List<recipeVO> list=new ArrayList<recipeVO>();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT no,title,poster,difficulty,timee,rownum "
					 + "FROM recipe "
					 + "WHERE rownum<=10";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				recipeVO vo= new recipeVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setDifficulty(rs.getString(4));
				vo.setTimee(rs.getString(5));
				list.add(vo);
			}
			rs.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	// 동우 ver.레시피 총 데이터
	public List<recipeVO> recipeListData(int page)
	{
		List<recipeVO> list=new ArrayList<recipeVO>();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT no, title, poster, difficulty, timee, num "
					 + "FROM (SELECT no, title, poster, difficulty, timee, rownum AS num "
					 + "FROM (SELECT no, title, poster, difficulty, timee "
					 + "FROM recipe ORDER BY no ASC)) "
					 + "WHERE num BETWEEN ? AND ?";
			   
			ps=conn.prepareStatement(sql);
			
			   
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			   
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
			    recipeVO vo= new recipeVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setDifficulty(rs.getString(4));
				vo.setTimee(rs.getString(5));
				  
				list.add(vo);
			}
			rs.close();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		   
		return list;
	}
	
	// 총 페이지
	public int recipeTotalPage()
	{
		int total=0;
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/" + rowSize + ") "
					 + "FROM recipe";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return total;
	}
	// 상세보기
	public recipeVO recipeDetailData(int no)
	{
		recipeVO vo=new recipeVO();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT * FROM recipe WHERE no=" + no;
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			vo.setNo(rs.getInt(1));
			vo.setTitle(rs.getString(2));
			vo.setPoster(rs.getString(3));
			vo.setWriter(rs.getString(4));
			vo.setServing(rs.getString(5));
			vo.setTimee(rs.getString(6));
			vo.setDifficulty(rs.getString(7));
			vo.setIngredient(rs.getString(8));
			vo.setCooking(rs.getString(9));
			vo.setCooking_image(rs.getString(10));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return vo;
	}
	
	public List<recipeVO> recipeCookingData(int no)
	{
		List<recipeVO> list=new ArrayList<recipeVO>();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT cooking FROM recipe WHERE no=" + no;
			
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			recipeVO vo=new recipeVO();
			rs.next();
			vo.setCooking(rs.getString(1));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	public List<recipeVO> recipeCookingImageData(int no)
	{
		List<recipeVO> list=new ArrayList<recipeVO>();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT cooking_image FROM recipe WHERE no=" + no;
			
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			recipeVO vo=new recipeVO();
			rs.next();
			vo.setCooking_image(rs.getString(1));
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
// ---------------------------------------------------------------------------------------------------------
	public List<recipeVO> recipeListDataa(int page, String fd, String ss)
	{
		List<recipeVO> list=new ArrayList<recipeVO>();
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT no, title, poster, difficulty, timee, num "
					 + "FROM(SELECT no, title, poster, difficulty, timee, rownum AS num "
					 + "FROM(SELECT no, title, poster, difficulty, timee "
					 + "FROM recipe "
					 + "WHERE " + fd + " LIKE '%'||?||'%' "
					 + "ORDER BY no ASC)) "
					 + "WHERE num BETWEEN ? AND ?";
			// 컬럼명/테이블명은 ?로 처리할 수 없음
			// ps.setString(1, fd) => address => 'address'
			// Mybatis => ${} #{}
			ps=conn.prepareStatement(sql);
			int rowSize=12;
			int start=(rowSize*page)-(rowSize-1);
			int end=rowSize*page;
			ps.setString(1, ss);
			ps.setInt(2, start);
			ps.setInt(3, end);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				recipeVO vo=new recipeVO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setPoster(rs.getString(3));
				vo.setDifficulty(rs.getString(4));
				vo.setTimee(rs.getString(5));
				
				list.add(vo);
			}
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return list;
	}
	
	public int recipeTotalPagee(String fd, String ss)
	{
		int total=0;
		try
		{
			conn=dbconn.getConnection();
			String sql="SELECT CEIL(COUNT(*)/12.0) "
					 + "FROM recipe "
					 + "WHERE " + fd + " LIKE '%'||?||'%'";
			ps=conn.prepareStatement(sql);
			ps.setString(1, ss);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			dbconn.disConnection(conn, ps);
		}
		return total;
	}

}