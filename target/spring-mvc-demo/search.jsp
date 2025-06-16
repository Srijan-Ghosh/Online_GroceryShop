<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Grocery Items</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
 background-image: url("https://t3.ftcdn.net/jpg/03/07/15/28/360_F_307152868_ncMILWfZIhGoAEK8QsFDsScGiRaQMsL0.jpg");
            background-size: 110%;
            background-repeat: repeat;            padding: 40px 20px;
        }
         body::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: -1;
    }
        
        .container {
            width: 100%;
            max-width: 1000px;
            background-color: white;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
        }
        
        h1, h2 {
            color: #2c3e50;
            margin-bottom: 25px;
            text-align: center;
        }
        
        h1 {
            font-size: 32px;
        }
        
        h2 {
            font-size: 24px;
            margin-top: 30px;
        }
        
        .search-form {
            background-color: #f8f9fa;
            padding: 25px;
            border-radius: 10px;
            margin-bottom: 30px;
        }
        
        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }
        
        label {
            font-weight: 600;
            color: #34495e;
            font-size: 14px;
            margin-bottom: 8px;
        }
        
        input[type="text"], select {
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s;
            width: 100%;
            max-width: 400px;
        }
        
        input[type="text"], select:focus {
            outline: none;
            border-color: #3498db;
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
        }
        
        select{
        color:grey;
        }
        
        input[type="submit"] {
            background-color: #3498db;
            color: white;
            font-weight: 600;
            border: none;
            cursor: pointer;
            padding: 12px 25px;
            border-radius: 8px;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        
        input[type="submit"]:hover {
            background-color: #2980b9;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        
        th {
            background-color: #3498db;
            color: white;
            padding: 12px 15px;
            text-align: left;
        }
        
        td {
            padding: 12px 15px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        
        tr:hover {
            background-color: #f1f7fd;
        }
        
        .price {
            font-weight: 600;
            color: #27ae60;
        }
        
        .quantity {
            font-weight: 600;
            color: #3498db;
        }
        
        .no-results {
            text-align: center;
            color: #7f8c8d;
            padding: 20px;
            font-style: italic;
            background-color: #f8f9fa;
            border-radius: 8px;
        }
        
        .back-link {
            margin-top: 20px;
            text-align: center;
        }
        
        .back-link a {
            color: #7f8c8d;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s;
            padding: 8px 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        
        .back-link a:hover {
            color: #3498db;
            border-color: #3498db;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Search Grocery Items</h1>
        
        <!-- Search Form -->
        <form action="view" method="post" class="search-form">
            <div class="form-group">
                <label for="name">Item Name:</label>
                <input type="text" name="name" id="name" value="${param.name}" placeholder="Enter item name"/>
            </div>
            
            <div class="form-group">
                <label for="category">Category:</label>
                
    <select name="category" id="category" >
     	<option value="" label="-- Choose category --"></option>
     	<c:forEach items="${categorylist}" var="category">
     	
		<option value="${category}">${category }</option>		
		</c:forEach>
    </select>
            </div>
            
            <input type="submit" value="Search" />
        </form>
        
        <!-- Displaying Search Results -->
        <h2>Search Results</h2>
        <c:choose>
            <c:when test="${not empty itemslist}">
                <table>
                    <thead>
                        <tr>
                            <th>Item Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Stock Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${itemslist}">
                            <tr>
                                <td>${item.name}</td>
                                <td>${item.category}</td>
                                <td class="price">₹${item.price}</td>
                                <td class="quantity">${item.stockquantity}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p class="no-results">No items found matching your search criteria.</p>
            </c:otherwise>
        </c:choose>
        
        <div class="back-link">
            <a href="index.jsp">← Back to Home</a>
        </div>
    </div>
</body>
</html>