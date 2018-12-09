package com.ddbookmvn.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ddbookmvn.dao.BookDao;
import com.ddbookmvn.model.Book;
import com.ddbookmvn.util.DBUtil;
import com.ddbookmvn.util.PageConstant;

public class BookDaoJdbcImpl implements BookDao {

	@Override
	public boolean saven(Book book) {
		Connection conn=null;
		PreparedStatement stmt=null;
		try {
			conn=DBUtil.getConnection();
			stmt=conn.prepareStatement("insert into t_book values(default,?,?,?,?,?,?,?)");
			stmt.setString(1, book.getName());
			stmt.setString(2,book.getAbout());
			stmt.setDouble(3,book.getPrice());
			stmt.setDate(4, new java.sql.Date(book.getC_date().getTime()));
			stmt.setString(5, book.getBrief());
			stmt.setString(6,book.getPhoto());
			stmt.setInt(7, book.getSid());
			
			int ret=stmt.executeUpdate();
			if(ret>0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.free(stmt, conn);
		}
		return false;
	}

	@Override
	public List<Book> findAll(int currentPage,String name,int sid) {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			conn=DBUtil.getConnection();
			stmt=conn.createStatement();
			//四种情况
			//都不限定
			/*if(name==null||name.equals("")&&sid==-1) {
				//啥也不做
			}
			//限定name,不限定sid
			if((name!=null&&!name.equals(""))&&(sid==-1)) {
				sql+="where name like '%"+name+"%' ";
			}
			//不限定name,但是限定sid
			if(name==null||name.equals("")&&sid!=-1) {
				sql+=" where sid="+sid;
			}
			//及限定name又限定sid
			if((name!=null&&!name.equals(""))&&(sid!=-1)) {
				sql+="where name like '%"+name+"%' and sid="+sid;
			}*/
			String sql="select * from t_book  where 1=1 ";
			if(name!=null&&!name.equals("")) {
				sql+=" and name like '%"+name+"%' ";
			}
			if(sid!=-1) {
				sql+=" and sid="+sid;
			}
			sql+=" order by id desc limit "+((currentPage-1)*PageConstant.PAGE_SIZE+1-1)+","+PageConstant.PAGE_SIZE;
			rs=stmt.executeQuery(sql);
			List<Book> ls=new ArrayList<>();
			while(rs.next()) {
				Book book=new Book();
				book.setId(rs.getInt("id"));
				book.setName(rs.getString("name"));
				book.setAbout(rs.getString("about"));
				book.setPrice(rs.getDouble("price"));
				book.setC_date(rs.getDate("c_date"));
				book.setBrief(rs.getString("brief"));
				book.setPhoto(rs.getString("photo"));
				book.setSid(rs.getInt("sid"));
				ls.add(book);
			}
			return ls;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.free(rs, stmt, conn);
		}
		return null;
	}

	@Override
	public int total(String name,int sid) {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			conn=DBUtil.getConnection();
			stmt=conn.createStatement();
			String sql="select count(*) from t_book  where 1=1";
			if(name!=null&&!name.equals("")) {
				sql+=" and name like '%"+name+"%' ";
			}
			if(sid!=-1) {
				sql+="  and  sid="+sid;
			}
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.free(rs, stmt, conn);
		}
		return 0;
	}

	@Override
	public int de(int id) {
		Connection conn=null;
		PreparedStatement stmt=null;
		try {
			conn=DBUtil.getConnection();
			stmt=conn.prepareStatement("delete form t_book where id ="+id);
			System.out.println(stmt);
			int ret=stmt.executeUpdate();
			return ret;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.free(stmt, conn);
		}
		return 0;
	}

	@Override
	public Book find(int id) {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			conn=DBUtil.getConnection();
			stmt=conn.createStatement();
			String sql="select * from t_book  where id="+id;
			rs=stmt.executeQuery(sql);
			if(rs.next()) {
				Book book=new Book();
				book.setId(rs.getInt("id"));
				book.setName(rs.getString("name"));
				book.setAbout(rs.getString("about"));
				book.setPrice(rs.getDouble("price"));
				book.setC_date(rs.getDate("c_date"));
				book.setBrief(rs.getString("brief"));
				book.setPhoto(rs.getString("photo"));
				book.setSid(rs.getInt("sid"));
				return book;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.free(rs, stmt, conn);
		}
		return null;
	}

	@Override
	public boolean update(Book book) {
		Connection conn=null;
		PreparedStatement stmt=null;
		try {
			conn=DBUtil.getConnection();
			if(book.getPhoto()==null) {
				stmt=conn.prepareStatement("update t_book set name=?,about=?,price=?,C_date=?,brief=?,Sid=? where id=?");
				stmt.setString(2,book.getAbout());
				stmt.setDouble(3,book.getPrice());
				stmt.setDate(4, new java.sql.Date(book.getC_date().getTime()));
				stmt.setString(5, book.getBrief());
				stmt.setInt(7, book.getSid());
				stmt.setInt(6, book.getId());
			}else {
				stmt=conn.prepareStatement("update t_book set name=?,about=?,price=?,C_date=?,brief=?,photo=?,Sid=? where id=?");
				stmt.setString(2,book.getAbout());
				stmt.setDouble(3,book.getPrice());
				stmt.setDate(4, new java.sql.Date(book.getC_date().getTime()));
				stmt.setString(5, book.getBrief());
				stmt.setString(6,book.getPhoto());
				stmt.setInt(7, book.getSid());
				stmt.setInt(8, book.getId());
			}
			int ret=stmt.executeUpdate();
			if(ret>0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBUtil.free(stmt, conn);
		}
		return false;
	}

}
