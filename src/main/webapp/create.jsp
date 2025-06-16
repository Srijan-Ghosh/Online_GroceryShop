<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Grocery Item</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
        background-image: url("https://t3.ftcdn.net/jpg/03/07/15/28/360_F_307152868_ncMILWfZIhGoAEK8QsFDsScGiRaQMsL0.jpg");
            background-size: cover;
            background-repeat: no-repeat;
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
        width: 500px;
        background-color: white;
        display: flex;
        flex-direction: column;
        align-items: center;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        border-radius: 15px;
        padding: 40px;
        transition: transform 0.3s ease;
    }
    
    .container:hover {
        transform: translateY(-5px);
    }
    
    h1 {
        color: #2c3e50;
        margin-bottom: 30px;
        font-size: 28px;
        text-align: center;
    }
    
    form {
        width: 100%;
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
    
    .form-group {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }
    
    label {
        font-weight: 600;
        color: #34495e;
        font-size: 14px;
    }
    
    input,select {
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 14px;
        transition: all 0.3s;
        color:grey;
    }
    
    input:focus {
        outline: none;
        border-color: #3498db;
        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
    }
    
    select:focus {
        outline: none;
        border-color: #3498db;
        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
    }
    
    input[type="submit"] {
        background-color: #3498db;
        color: white;
        font-weight: 600;
        border: none;
        cursor: pointer;
        margin-top: 10px;
        padding: 12px;
        transition: background-color 0.3s;
    }
    
    input[type="submit"]:hover {
        background-color: #2980b9;
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
    }
    
    .back-link a:hover {
        color: #3498db;
        text-decoration: underline;
    }
</style>
</head>
<body>
<div class="container">
    <h1>Add New Grocery Item</h1>
    <form action="save" method="post">
        <div class="form-group">
            <label for="name">Item Name:</label>
            <input type="text" name="name" id="name" required placeholder="Enter item name"/>
        </div>
        
        <div class="form-group">
            <label for="category">Category:</label>
<select name="category" id="category" required>
    <option value="" disabled selected>Select a category</option>
    <option value="Fruits & Vegetables">Fruits & Vegetables</option>
    <option value="Dairy & Eggs">Dairy & Eggs</option>
    <option value="Meat & Seafood">Meat & Seafood</option>
    <option value="Bakery & Breads">Bakery & Breads</option>
    <option value="Rice, Pulses & Grains">Rice, Pulses & Grains</option>
    <option value="Spices & Condiments">Spices & Condiments</option>
    <option value="Snacks & Beverages">Snacks & Beverages</option>
    <option value="Frozen & Ready-to-Eat">Frozen & Ready-to-Eat</option>
    <option value="Oil & Ghee">Oil & Ghee</option>
    <option value="Cleaning & Household Essentials">Cleaning & Household Essentials</option>
    <option value="Personal Care & Hygiene">Personal Care & Hygiene</option>
    <option value="Baby Care">Baby Care</option>
    <option value="Health & Wellness">Health & Wellness</option>
    <option value="Breakfast & Cereals">Breakfast & Cereals</option>
    <option value="Packaged Foods">Packaged Foods</option>
    <option value="Dry Fruits & Nuts">Dry Fruits & Nuts</option>
    <option value="Beverages (Tea, Coffee, Juices, Soft Drinks)">Beverages (Tea, Coffee, Juices, Soft Drinks)</option>
    <option value="Instant & Ready-to-Cook">Instant & Ready-to-Cook</option>
    <option value="Sauces & Spreads">Sauces & Spreads</option>
    <option value="Household Supplies">Household Supplies</option>
    <option value="Pet Food & Care">Pet Food & Care</option>
    <option value="Canned & Jarred Goods">Canned & Jarred Goods</option>
    <option value="Confectionery & Sweets">Confectionery & Sweets</option>
    <option value="Organic & Health Foods">Organic & Health Foods</option>
    <option value="Stationery & Office Supplies">Stationery & Office Supplies</option>
</select>

        </div>
        
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" name="price" id="price" required placeholder="0.00" step="0.01" min="0"/>
        </div>
        
        <div class="form-group">
            <label for="stockquantity">Stock Quantity:</label>
            <input type="number" name="stockquantity" id="stockquantity" required placeholder="0" min="0"/>
        </div>
        
        <div class="form-group">
            <label for=image>ImageURL:</label>
            <input type="text" name="image" id="image" />
        </div>
        
        <input type="submit" value="Add Item" />
    </form>

    <div class="back-link">
        <a href="index.jsp">← Back to Home</a>
    </div>
</div>
</body>
</html>