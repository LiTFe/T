package com.ddbookmvn.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ddbookmvn.dao.BigTypeDao;
import com.ddbookmvn.model.BigType;
import com.ddbookmvn.util.DBUtil;

public class BigTypeDaoJdbcImpl implements BigTypeDao {

	@Override
	public boolean save(String name) {
		Connection conn=null;
		PreparedStatement stmt=null;
		conn=DBUtil.getConnection();
		try {
			conn=DBUtil.getConnection();
			String sql="insert into t_big values(default,?)";
			stmt=conn.prepareStatement(sql);
			stmt.setString(1, name);
			int ret=stmt.executeUpdate();
			if(ret>0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return false;
	}

	@Override
	public List<BigType> findAll() {
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		try {
			conn=DBUtil.getConnection();
			stmt=conn.createStatement();
			String sql="select * from t_big";
			rs=stmt.executeQuery(sql);
			List<BigType> ls=new ArrayList<>();
			while(rs.next()) {
				BigType bigType=new BigType();
				bigType.setId(rs.getInt("id"));
				bigType.setName(rs.getString("name"));
				ls.add(bigType);
			}
			return ls;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBUtil.free(rs, stmt, conn);
		}
		return null;
	}

}
