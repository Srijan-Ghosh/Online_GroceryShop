<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Grocery Items</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />    <style>
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
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            padding: 40px 20px;
            background-image: url("https://t3.ftcdn.net/jpg/03/07/15/28/360_F_307152868_ncMILWfZIhGoAEK8QsFDsScGiRaQMsL0.jpg");
            background-size: 110%;
            background-repeat: repeat;
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
            max-width: 1200px;
            background-color: white;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
        }
        
        h2 {
        flex:1;
            color: #2c3e50;
            margin-bottom: 25px;
            font-size: 28px;
            text-align: center;
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
        
        .actions {
            display: flex;
            gap: 10px;
        }
        
        .actions a {
            color: white;
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 4px;
            font-size: 14px;
            transition: all 0.3s;
        }
        
        .edit-btn {
            background-color: #3498db;
        }
        
        .edit-btn:hover {
            background-color: #2980b9;
        }
        
        .delete-btn {
            background-color: #e74c3c;
        }
        
        .delete-btn:hover {
            background-color: #c0392b;
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
        
        .empty-message {
            text-align: center;
            color: #7f8c8d;
            padding: 20px;
            font-style: italic;
        }
        
        .price {
            font-weight: 600;
            color: #27ae60;
        }
        
        .quantity {
            font-weight: 600;
            color: #3498db;
        }
        
        .add {
  padding: 10px 15px;
  background-color: #3498db;
  border-radius: 5px;
  color: white;
  text-decoration: none;
  font-family: Arial, sans-serif;
  font-size: 14px;
  transition: background-color 0.3s;
}

.add:hover {
  background-color: #2980b9;
}
        
        .top{
        display:flex;
        align-items:center;
        justify-content:space-evenly;
        
        }
    </style>
    
</head>
<body>
    <div class="container">
    <div class="top">
        <h2>Grocery Items Inventory</h2>
<a class="add" href="${pageContext.request.contextPath}/itm">
  <i class="fa-solid fa-plus"></i> Add
</a>        </div>
        <c:choose>
            <c:when test="${not empty itemslist}">
                <table>
                    <thead>
                        <tr>
                            <th>Item ID</th>
                            <th>Item Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Stock Quantity</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${itemslist}" >
                            <tr>
                                <td>${item.productid}</td>
                                <td>${item.name}</td>
                                <td>${item.category}</td>
                                <td class="price">₹${item.price}</td>
                                <td class="quantity">${item.stockquantity}</td>
                                <td class="actions">
                                    <a href="${pageContext.request.contextPath}/directedit?id=${item.productid}" class="edit-btn">Edit</a>
                                    <a href="${pageContext.request.contextPath}/remove?id=${item.productid}" class="delete-btn" >Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <p class="empty-message">No grocery items found. Please add some items to display.</p>
            </c:otherwise>
        </c:choose>
        
        <div class="back-link">
            <a href="index.jsp">← Back to Home</a>
        </div>
        
    </div>
    
    
<p style="color:red; z-index:100; text-align:right">${result}</p>

</body>
</html>