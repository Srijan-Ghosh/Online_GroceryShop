<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.jsp.dto.GroceryItems" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Purchase Grocery Item</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
        min-height: 100vh;
        padding: 40px 40px;
        background-image: url("https://t3.ftcdn.net/jpg/03/07/15/28/360_F_307152868_ncMILWfZIhGoAEK8QsFDsScGiRaQMsL0.jpg");
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        position: relative;
        
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
    
    .big-container{
    display:flex;
        
        }
    

    .main-container {
    overflow-y: auto; 
        width: 100%;
        max-width: 1400px;
        margin: 0 0 0 0;
        background-color: rgba(255, 255, 255, 0.95);
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        padding: 40px;
        backdrop-filter: blur(8px);
    }

    h1 {
        color: #2c3e50;
        margin-bottom: 30px;
        font-size: 28px;
        text-align: center;
    }

    .items-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 20px;
        margin-bottom: 40px;
    }

    .item-card {
        background-color: white;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        transition: all 0.3s ease;
        display: flex;
        flex-direction: column;
        border: 1px solid #eee;
    }

    .item-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 15px rgba(0, 0, 0, 0.15);
    }

    .card-title {
        font-size: 1.2rem;
        font-weight: 600;
        color: #2c3e50;
        margin-bottom: 10px;
        border-bottom: 1px solid #eee;
        padding-bottom: 8px;
    }

    .card-detail {
        display: flex;
        justify-content: space-between;
        margin: 8px 0;
        font-size: 0.95rem;
    }

    .card-label {
        color: #7f8c8d;
        font-weight: 500;
    }

    .card-value {
        color: #2c3e50;
        font-weight: 600;
    }

    .price {
        color: #27ae60;
    }

    .quantity {
        color: #3498db;
    }

    .purchase-form {
        width: 100%;
        max-width: 500px;
        margin: 40px auto;
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }

    .form-group {
        display: flex;
        flex-direction: column;
        gap: 8px;
        margin-bottom: 20px;
    }

    label {
        font-weight: 600;
        color: #34495e;
        font-size: 14px;
    }

    select, input[type="number"] {
        padding: 12px 15px;
        border: 1px solid #ddd;
        border-radius: 8px;
        font-size: 14px;
        transition: all 0.3s;
    }

    select:focus, input[type="number"]:focus {
        outline: none;
        border-color: #3498db;
        box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
    }

    input[type="submit"] {
        width: 100%;
        background-color: #3498db;
        color: white;
        font-weight: 600;
        border: none;
        cursor: pointer;
        margin-top: 10px;
        padding: 12px;
        border-radius: 8px;
        transition: all 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #2980b9;
        transform: translateY(-2px);
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
        
        .cart{
        
       position:fixed;
       right:40px;
        padding:40px;
        height:92vh;
        width:400px;
        background-color:white;
        
                background-color: rgba(255, 255, 255, 0.95);
                border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        
        backdrop-filter: blur(8px);
        display:flex;
        flex-direction:column;
        justify-content:space-between;
        align-items:center;
        
        }
        
        hr{
        margin:10px auto;
        width:90%;}
        
        .cart p{
        color: #2c3e50;
        text-align:center;
        width:100%;
        font-size:30px;
        font-weight:bold;
        
        }
        
        .cart .img{
        max-height:400px;
        width:100%;
        }
        
         /* Add this to your existing CSS */
    .item-card img {
        width: 100%;
        height: 180px; /* Fixed height for consistency */
        object-fit: cover; /* Ensures images fill the space while maintaining aspect ratio */
        border-radius: 8px;
        margin-bottom: 15px;
        border: 1px solid #eee; /* Optional border */
    }
    
    .image-placeholder {
    width: 100%;
    height: 180px;
    background-color: #f5f5f5;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #888;
    border-radius: 8px;
    margin-bottom: 15px;
    border: 1px dashed #ccc;
}

.cart-hr{
width:100%
}

.show-cart{
display:none;
}
    @media (max-width: 1080px) {
        .items-grid {
            grid-template-columns: 1fr;
        }
        
        .main-container {
            padding: 20px;
        }
        
        .cart{
        	display:none;
        }
        
        .show-cart{
        display:block;
        }
    }
</style>
</head>
<body>
<button class="show-cart">Cart</button>
<div class="big-container">
<div class="main-container">
    <h1>Purchase Grocery Item</h1>
    
    <!-- Items Grid Display -->
    <div class="items-grid">
        <%
        List<GroceryItems> items = (List<GroceryItems>) request.getAttribute("itemslist");
        for (GroceryItems item : items) {
        %>
        <div class="item-card">
         <% if (item.getImage() != null && !item.getImage().isEmpty()) { %>
        <img src="<%= item.getImage() %>" alt="<%= item.getName() %>" class="product-image">
    <% } else { %>
        <div class="image-placeholder">No Image Available</div>
    <% } %>
   
            <div class="card-title" id="name"><%= item.getName() %></div>
            <div class="card-detail">
                <span class="card-label">Category:</span>
                <span class="card-value"><%= item.getCategory() %></span>
            </div>
            <div class="card-detail">
                <span class="card-label">Price:</span>
                <span class="card-value price">₹<%= item.getPrice() %></span>
            </div>
            <div class="card-detail">
                <span class="card-label">Available:</span>
                <span class="card-value quantity"><%= item.getStockquantity() %></span>
            </div>
        </div>
        <%
        }
        %>
    </div>
    
    <!-- Purchase Form -->
    
    
     <div class="back-link">
            <a href="index.jsp">← Back to Home</a>
        </div>
</div>
<div class="cart">
<div class="cart-hr">
<p>Cart</p>
<hr>
<div class="img">
</div>
</div>
    <div class="purchase-form">
        <form action="process" method="post">
            <div class="form-group">
                
                <input type="hidden" name="name" id="inp" value="" required 
                    />
            </div>
            
            <div class="form-group">
                <label for="stockquantity">Quantity:</label>
                <input type="number" name="stockquantity" id="stockquantity" required 
                       placeholder="Enter quantity" min="1"/>
            </div>
            
            <input type="submit" value="Purchase" />
        </form>
    </div>
    </div>
    
    </div>

<script>
document.querySelectorAll(".item-card").forEach(function(product) {
    product.addEventListener('click', function() {
        // Set the name input's value to the product name
        document.querySelector("#inp").value = product.querySelector(".card-title").innerText;

        // Show the clicked product in the image box
        document.querySelector(".img").innerHTML = product.outerHTML;
    });
});

document.querySelector(".show-cart").addEventListener("click", function() {
	  document.querySelector(".cart").style.display = "block";
	});


</script>
</body>
</html>