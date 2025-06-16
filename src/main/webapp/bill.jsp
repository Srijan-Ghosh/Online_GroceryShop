<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bill Summary</title>
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
        justify-content: center;
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        padding: 20px;
        background-image: url("https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da");
        background-size: cover;
        background-position: center;
        background-attachment: fixed;
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

    .bill-container {
        width: 100%;
        max-width: 600px;
        background-color: rgba(255, 255, 255, 0.95);
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        padding: 40px;
        margin: 20px;
        backdrop-filter: blur(8px);
    }

    h1 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 30px;
        font-size: 2.2rem;
        font-weight: 600;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 30px;
    }

    th {
        background-color: #27ae60;
        color: white;
        padding: 16px;
        text-align: left;
        font-weight: 500;
        letter-spacing: 0.5px;
    }

    td {
        padding: 16px;
        border-bottom: 1px solid #e0e0e0;
        color: #333;
    }

    tr:last-child td {
        border-bottom: none;
        font-weight: 600;
        font-size: 1.1rem;
        color: #2c3e50;
        
    }
    
    

    .total-row {
        background-color: #f8f9fa;
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
    .highlight {
        color: #27ae60;
        font-weight: 600;
    }

    .note {
        text-align: center;
        color: #7f8c8d;
        font-size: 0.9rem;
        margin-top: 20px;
        font-style: italic;
    }
</style>
</head>
<body>
<%
int delivery = 40;
int packaging = 40;
int gst = 20;
double price = (double) request.getAttribute("bill"); 

if(price > 1000) {
    packaging = 500;
} else if(price > 500) {
    packaging = 100;
} else if(price <= 0) {
    packaging = 0;
    delivery = 0;
    gst = 0;
}

double subtotal = price + delivery + packaging;
double total = subtotal + (subtotal * gst / 100);
%>

<div class="bill-container">
    <h1>Order Summary</h1>
    
    <table>
        <tr>
            <th>Description</th>
            <th>Amount (₹)</th>
        </tr>
        <tr>
            <td>Item Subtotal</td>
            <td><%= String.format("%.2f", price) %></td>
        </tr>
        <tr>
            <td>Delivery Charge</td>
            <td><%= delivery %></td>
        </tr>
        <tr>
            <td>Packaging Charge</td>
            <td><%= packaging %></td>
        </tr>
        <tr>
            <td>GST </td>
            <td><%= subtotal * gst / 100 %></td>
        </tr>
        <tr class="total-row">
            <td>Total Amount</td>
            <td class="highlight">₹<%= total %></td>
        </tr>
    </table>

     <div class="back-link">
            <a href="index.jsp">← Back to Home</a>
        </div>
    
    <p class="note">Thank you for your purchase! Your order will be delivered soon.</p>
</div>

</body>
</html>