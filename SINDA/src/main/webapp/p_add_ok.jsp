<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import ="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>processAddProduct</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
			
		String filename = "";
		/* String realFolder = "C:\\upload"; 		//웹 애플리케이션상의 절대 경로 */
		String realPath = request.getServletContext().getRealPath("images");
		
		File dir = new File(realPath);
		if (!dir.exists()) dir.mkdirs();
		
		/* String realFolder = "D:\\JSP\\Webmarket\\webcontent\\images"; */
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
		
		int price;
		
		if (p_price.isEmpty())
			price = 0;
		else
			price = Integer.valueOf(p_price);
		
		int stock;
		
		if (p_stock.isEmpty())
			stock = 0;
		else
			stock = Integer.valueOf(p_stock);
		
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String fileName = multi.getFilesystemName(fname);		
		
		PreparedStatement pstmt = null;
		
		String sql = "insert into product values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, p_id);
		pstmt.setString(2, p_name);
		pstmt.setInt(3, price);
		pstmt.setString(4, p_description);
		pstmt.setString(5, p_category);
		pstmt.setInt(6, stock);
		pstmt.setString(7, fileName);
		pstmt.executeUpdate();
		
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		
		response.sendRedirect("product_list.jsp");
	%>
</body>
</html>