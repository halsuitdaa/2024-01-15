package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.*;
import java.io.*;
	//고객센터 DAO ~
public class ConsumerDAO {
  private static SqlSessionFactory ssf;
  static
  {
	  // xml => parse
	  try
	  {
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   ssf=new SqlSessionFactoryBuilder().build(reader);
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
  }
 
  public static List<ConsumerVO> consumerListData(Map map)
  {
	  SqlSession session=null;
	  List<ConsumerVO> list=new ArrayList<ConsumerVO>();
	  try
	  {
		   session=ssf.openSession();
		   list=session.selectList("consumerListData",map);
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally 
	  {
		if(session!=null)
			session.close();
	  }
	  return list;
  }
  public static int consumerRowCount()
  {
	  SqlSession session=null; // opensession 은 getconnection 이랑 같음
	  int count=0;
	  try
	  {
		  // getConnection()
		  session=ssf.openSession();
		  count=session.selectOne("consumerRowCount");
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally {
		 if(session!=null)
			 session.close();// 반환 => disConnection()
		 // => Connection/PreparedStatement
	  }
	  return count;
  }
  public static void consumerInsert(ConsumerVO vo)
  {
	  SqlSession session=null;
	  try
	  {
		  session=ssf.openSession(true);//autocommit
		  session.insert("consumerInsert",vo);
		 
		  //session.commit(); => update,delete
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		if(session!=null)
			session.close();
	  }
	 
  }
  public static ConsumerVO consumerDetailData(int no)
  {

	  ConsumerVO vo=new ConsumerVO();
	  SqlSession session=null;
	  try
	  {
		  session=ssf.openSession(true);
		  session.update("consumerHitIncrement",no);  //조회수증가후
		  vo=session.selectOne("consumerDetailData",no); // 데이터 얻어온다
	  }
	  catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  if(session!=null)
			  session.close();
	  }
	  return vo;
  }
  public static ConsumerVO consumerFileInfoData(int no)
  {
	  ConsumerVO vo=new ConsumerVO();
	  SqlSession session=null;
	  try
	  {
		  session=ssf.openSession();
		  vo=session.selectOne("consumerFileInfoData",no);
	  }catch(Exception ex)
	  {
		  ex.printStackTrace();
	  }
	  finally
	  {
		  if(session!=null)
			  session.close();
	  }
	  return vo;
  }
  public static String consumerDelete(int no,String pwd)
  {
	  // var res: String ="no" val
	  String res="no";
	  SqlSession session=ssf.openSession(true);
	  String db_pwd=session.selectOne("consumerGetPassword",no);
	  if(db_pwd.equals(pwd))
	  {
		  res="yes";
		  session.delete("consumerDelete",no);
	  }
	  return res;
  }
  public static ConsumerVO consumerUpdateData(int no)
  {
	  SqlSession session=ssf.openSession();
	  ConsumerVO vo=session.selectOne("consumerDetailData",no);
	  session.close();
	  return vo;
  }
  
  
  public static String consumerUpdate(ConsumerVO vo)
  {
	   String res="no";
	   SqlSession session=ssf.openSession(true);
	   String db_pwd=session.selectOne("consumerGetPassword",vo.getNo());
	   if(db_pwd.equals(vo.getPwd()))
	   {
		   res="yes";
		   session.update("consumerUpdate",vo);
	   }
	   session.close();
	   return res;
  }
}
