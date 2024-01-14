package com.sist.dao;
import java.util.*;
import java.sql.*;

import com.sist.dbcp.CreateDBCPConnection;
import com.sist.vo.*;
public class GoodsJjimDAO {
   private Connection conn;
   private PreparedStatement ps;
   private CreateDBCPConnection db=new CreateDBCPConnection();
   private static GoodsJjimDAO dao;
   
   public static GoodsJjimDAO newInstance()
   {
	   if(dao==null)
		   dao=new GoodsJjimDAO();
	   return dao;
   }
   // Jjim저장 
   public void goodsJjimInsert(GoodsJJimVO vo)
   {
	   try
	   {
		   conn=db.getConnection();
		   String sql="INSERT INTO goods1_jjim VALUES("
				     +"gj1_no_seq.nextval,?,?,?)";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getId());
		   ps.setInt(2, vo.getCno());
		   ps.setInt(3, vo.getGno());
		   ps.executeUpdate();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   db.disConnection(conn, ps);
	   }
   }
   public void goodsJjimInsert2(GoodsJJimVO vo)
   {
	   try
	   {
		   conn=db.getConnection();
		   String sql="INSERT INTO goods2_jjim VALUES("
				     +"gj2_no_seq.nextval,?,?,?)";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getId());
		   ps.setInt(2, vo.getCno());
		   ps.setInt(3, vo.getGno());
		   ps.executeUpdate();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   db.disConnection(conn, ps);
	   }
   }
   public void goodsJjimInsert3(GoodsJJimVO vo)
   {
	   try
	   {
		   conn=db.getConnection();
		   String sql="INSERT INTO goods3_jjim VALUES("
				     +"gj3_no_seq.nextval,?,?,?)";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getId());
		   ps.setInt(2, vo.getCno());
		   ps.setInt(3, vo.getGno());
		   ps.executeUpdate();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   db.disConnection(conn, ps);
	   }
   }
   public void goodsJjimInsert4(GoodsJJimVO vo)
   {
	   try
	   {
		   conn=db.getConnection();
		   String sql="INSERT INTO goods4_jjim VALUES("
				     +"gj4_no_seq.nextval,?,?,?)";
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, vo.getId());
		   ps.setInt(2, vo.getCno());
		   ps.setInt(3, vo.getGno());
		   ps.executeUpdate();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   db.disConnection(conn, ps);
	   }
   }
   // Jjim확인 
   public int goodsJjimCount(String id,int cno, int gno)
   {
	   int count=0;
	   try
	   {
		   conn=db.getConnection();
		   String sql="SELECT COUNT(*) "
				     +"FROM goods1_jjim "
				     +"WHERE cno=? AND gno=? AND id=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, cno);
		   ps.setInt(2, gno);
		   ps.setString(3, id);
		   ResultSet rs=ps.executeQuery();
		   rs.next();
		   count=rs.getInt(1);
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   db.disConnection(conn, ps);
	   }
	   return count;
   }
   // Jjim목록 => 마이페이지 (찜관리) 
   public List<GoodsJJimVO> goodsJjimListData(String id)
   {
	   List<GoodsJJimVO> list=new ArrayList<GoodsJJimVO>();
	   try
	   {
		   conn=db.getConnection();
		   String sql="SELECT no,cno,gno,"
				     +"(SELECT poster FROM goods1 WHERE cno=goods1_jjim.cno AND gno=goods1_jjim.gno),"
				     +"(SELECT title FROM goods1 WHERE cno=goods1_jjim.cno AND gno=goods1_jjim.gno),"
				     +"(SELECT selling_price FROM goods1 WHERE cno=goods1_jjim.cno AND gno=goods1_jjim.gno) "
				     +"FROM goods1_jjim "
				     +"WHERE id=? "
				     +"ORDER BY no DESC";
		  
		   ps=conn.prepareStatement(sql);
		   ps.setString(1, id);
		   ResultSet rs=ps.executeQuery();
		   while(rs.next())
		   {
			   GoodsJJimVO vo=new GoodsJJimVO();
			   vo.setNo(rs.getInt(1));
			   vo.setCno(rs.getInt(2));
			   vo.setGno(rs.getInt(3));
			   vo.setPoster(rs.getString(4));
			   vo.setTitle(rs.getString(5));
			   vo.setSelling_price(rs.getInt(6));
			   list.add(vo);
		   }
		   rs.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   db.disConnection(conn, ps);
	   }
	   return list;
   }
   // Jjim취소
   public void goodsjjimCancel(int no)
   {
	   try
	   {
		   conn=db.getConnection();
		   String sql="DELETE FROM goods1_jjim "
				     +"WHERE no=?";
		   ps=conn.prepareStatement(sql);
		   ps.setInt(1, no);
		   ps.executeUpdate();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   db.disConnection(conn, ps);
	   }
   }
   
}






