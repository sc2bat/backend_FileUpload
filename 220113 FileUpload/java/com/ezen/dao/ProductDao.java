package com.ezen.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ezen.dto.ProductVO;
import com.ezen.util.Dbman;

public class ProductDao {
	private ProductDao() {}
	private static ProductDao itc = new ProductDao();
	public static ProductDao getInstance() {return itc;}

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<ProductVO> selectAll() {
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		String sql = "SELECT * FROM bookproduct ORDER BY code DESC";
		con = Dbman.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductVO pvo = new ProductVO();
				pvo.setCode(rs.getInt("code"));
				pvo.setName(rs.getString("name"));
				pvo.setPrice(rs.getInt("price"));
				pvo.setPictureurl(rs.getString("pictureurl"));
				pvo.setDescription(rs.getString("description"));
				list.add(pvo);
			}
		} catch (SQLException e) {e.printStackTrace();
		}finally {Dbman.close(con, pstmt, rs);
		}
		return list;
	}

	public ProductVO getProduct(String code) {
		ProductVO pvo = null;
		String sql = "SELECT * FROM bookproduct WHERE code=?";
		con = Dbman.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(code));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pvo = new ProductVO();
				pvo.setCode(rs.getInt("code"));
				pvo.setName(rs.getString("name"));
				pvo.setPrice(rs.getInt("price"));
				pvo.setPictureurl(rs.getString("pictureurl"));
				pvo.setDescription(rs.getString("description"));
			}
		} catch (SQLException e) {e.printStackTrace();
		}finally {Dbman.close(con, pstmt, rs);
		}
		return pvo;
	}

	public void insertProduct(ProductVO pvo) {
		String sql = "INSERT INTO bookproduct(code, name, price, pictureurl, description) "
				+ "VALUES(bookproduct_seq.nextVal, ?, ?, ?, ?)";
		con = Dbman.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pvo.getName());
			pstmt.setInt(2, pvo.getPrice());
			pstmt.setString(3, pvo.getPictureurl());
			pstmt.setString(4, pvo.getDescription());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Dbman.close(con, pstmt, rs);
		}
		
	}

	public void updateProduct(ProductVO pvo) {
		String sql = "UPDATE bookproduct "
				+ "SET name=?, price=?, pictureurl=?, description=? WHERE code=?";
		con = Dbman.getConnection();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pvo.getName());
			pstmt.setInt(2, pvo.getPrice());
			pstmt.setString(3, pvo.getPictureurl());
			pstmt.setString(4, pvo.getDescription());
			pstmt.setInt(5, pvo.getCode());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Dbman.close(con, pstmt, rs);
		}
	}


}
