<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Grocery Item</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-image: url("https://t3.ftcdn.net/jpg/03/07/15/28/360_F_307152868_ncMILWfZIhGoAEK8QsFDsScGiRaQMsL0.jpg");
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
        margin: 0;
        padding: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
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
    

    .form-container {
        background-color: #fff;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        width: 60%;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        padding: 30px;
    }

    .form-container .form-items {
        display: flex;
        justify-content: space-evenly;
        flex-wrap: wrap;
    }

    .form-fields {
        width: 48%;
    }

    .image-preview {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 48%;
    }

    .image-preview img {
        max-width: 100%;
        max-height: 400px;
        border-radius: 10px;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.2);
        background-color: #f2f2f2;
        padding: 20px;
    }

    h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #2c3e50;
    }

    label {
        font-weight: bold;
        margin-bottom: 6px;
        display: block;
        color: #34495e;
    }

    input[type="text"],
    input[type="number"],
    select {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border-radius: 6px;
        border: 1px solid #ccc;
        font-size: 14px;
    }

    input[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #3498db;
        color: white;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 6px;
        cursor: pointer;
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
<script>
    function updateImagePreview() {
        var imageUrl = document.getElementById("image").value;
        document.getElementById("preview").src = imageUrl;
    }
</script>
</head>
<body>
<div class="form-container">
    <h2>Edit Grocery Item</h2>
    <div class="form-items">
        <div class="form-fields">
            <form:form action="update" method="post" modelAttribute="items">
                <label for="productid">Product ID:</label>
                <form:input path="productid" id="productid" type="number" readonly="true"/>

                <label for="name">Item Name:</label>
                <form:input path="name" id="name" required="true" placeholder="Enter item name"/>

                <form:label path="category"> Category : </form:label>
			<form:select path="category" id="category">
    <form:option value="${categories}" />
    <form:option value="Fruits & Vegetables" />
    <form:option value="Dairy & Eggs" />
    <form:option value="Meat & Seafood" />
    <form:option value="Bakery & Breads" />
    <form:option value="Rice, Pulses & Grains" />
    <form:option value="Spices & Condiments" />
    <form:option value="Snacks & Beverages" />
    <form:option value="Frozen & Ready-to-Eat" />
    <form:option value="Oil & Ghee" />
    <form:option value="Cleaning & Household Essentials" />
    <form:option value="Personal Care & Hygiene" />
    <form:option value="Baby Care" />
    <form:option value="Health & Wellness" />
    <form:option value="Breakfast & Cereals" />
    <form:option value="Packaged Foods" />
    <form:option value="Dry Fruits & Nuts" />
    <form:option value="Beverages (Tea, Coffee, Juices, Soft Drinks)" />
    <form:option value="Instant & Ready-to-Cook" />
    <form:option value="Sauces & Spreads" />
    <form:option value="Household Supplies" />
    <form:option value="Pet Food & Care" />
    <form:option value="Canned & Jarred Goods" />
    <form:option value="Confectionery & Sweets" />
    <form:option value="Organic & Health Foods" />
    <form:option value="Stationery & Office Supplies" />
</form:select>

                <label for="price">Price:</label>
                <form:input path="price" id="price" type="number" step="0.01" min="0" required="true" placeholder="0.00"/>

                <label for="stockquantity">Stock Quantity:</label>
                <form:input path="stockquantity" id="stockquantity" type="number" min="0" required="true" placeholder="0"/>

                <label for="image">Image URL:</label>
                <form:input path="image" id="image" required="true" oninput="updateImagePreview()" />

                <input type="submit" value="Update Item" />
            </form:form>

            <div class="back-link">
                <a href="index.jsp">← Back to Home</a>
            </div>
        </div>

        <div class="image-preview">
            <img id="preview" src="${items.image}" alt="Image Preview" />
        </div>
    </div>
</div>
</body>
</html>
