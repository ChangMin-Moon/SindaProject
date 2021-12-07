<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import ="java.io.File" %>
<%@ page import="java.util.*" %>
<%@ include file="dbconn.jsp" %>
<%
		request.setCharacterEncoding("UTF-8");
			
		String filename = "";
		
		String realPath = request.getServletContext().getRealPath("images");
		
		File dir = new File(realPath);
		if (!dir.exists()) dir.mkdirs();
		
		int maxSize = 5 * 1024 * 1024;				//최대 업로드될 파일의 크기 5MB
		String encType = "UTF-8"; 					//인코딩 유형
		
		MultipartRequest multi = new MultipartRequest(request, realPath,
		maxSize, encType, new DefaultFileRenamePolicy());
	
		String p_id = multi.getParameter("p_id");
		String p_name = multi.getParameter("p_name");
		String p_price = multi.getParameter("p_price");
		String p_description = multi.getParameter("p_description");
		String p_category = multi.getParameter("p_category");
		String p_stock = multi.getParameter("p_stock");
		
		Integer price;
		
		if (p_price.isEmpty())
			price = 0;
		else
			price = Integer.valueOf(p_price);
		
		long stock;
		
		if (p_stock.isEmpty())
			stock = 0;
		else
			stock = Long.valueOf(p_stock);
		
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, p_id);
		rs = pstmt.executeQuery();
		
		if (rs.next()){
			if (fileName != null) {
				sql = "update product set p_name=?, p_price=?, p_description=?, p_category=?, p_stock=?, p_img=? where p_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, p_name);
				pstmt.setInt(2, price);
				pstmt.setString(3, p_description);
				pstmt.setString(4, p_category);
				pstmt.setLong(5, stock);
				pstmt.setString(6, fileName);
				pstmt.setString(7, p_id);
				pstmt.executeUpdate();
			} else {
				sql = "update product set p_name=?, p_price=?, p_description=?, p_category=?, p_stock=? where p_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, p_name);
				pstmt.setInt(2, price);
				pstmt.setString(3, p_description);
				pstmt.setString(4, p_category);
				pstmt.setLong(5, stock);
				pstmt.setString(6, p_id);
				pstmt.executeUpdate();
			}
			
		}
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		
		response.sendRedirect("editProduct.jsp?edit=update");
	%>