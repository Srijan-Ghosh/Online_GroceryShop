<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Grocery Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
            background-image: url("https://t3.ftcdn.net/jpg/03/07/15/28/360_F_307152868_ncMILWfZIhGoAEK8QsFDsScGiRaQMsL0.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }
        
        .container {
            width: 100%;
            max-width: 1400px;
            text-align: center;
            color: white;
            text-shadow: 0 2px 4px rgba(0,0,0,0.5);
        }
        
        h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }
        
        h2, h3 {
            font-weight: 300;
            margin-bottom: 1.5rem;
        }
        
        .menu {
            width: 90%;
            max-width: 1400px;
            min-height: 600px;
            background-color: rgba(0, 0, 0, 0.4);
            border-radius: 15px;
            padding: 40px;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin: 30px auto;
            backdrop-filter: blur(5px);
        }

        .menu a {
            color: white;
            text-decoration: none;
            padding: 30px 20px;
            border-radius: 8px;
            font-size: 20px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 120px;
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            position: relative;
            overflow: hidden;
        }

        .menu a i {
            font-size: 3rem;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        /* Individual link colors */
        .menu a:nth-child(1) {
            background-color: rgba(52, 152, 219, 0.7);
        }
        .menu a:nth-child(2) {
            background-color: rgba(46, 204, 113, 0.7);
        }
        .menu a:nth-child(3) {
            background-color: rgba(155, 89, 182, 0.7);
        }
        .menu a:nth-child(4) {
            background-color: rgba(230, 126, 34, 0.7);
        }
        .menu a:nth-child(5) {
            background-color: rgba(26, 188, 156, 0.7);
        }

        /* Hover effects */
        .menu a:nth-child(1):hover {
            background-color: rgba(52, 152, 219, 0.7);
        }
        .menu a:nth-child(2):hover {
            background-color: rgba(46, 204, 113, 0.7);
        }
        .menu a:nth-child(3):hover {
            background-color: rgba(155, 89, 182, 0.7);
        }
        .menu a:nth-child(4):hover {
            background-color: rgba(230, 126, 34, 0.7);
        }
        .menu a:nth-child(5):hover {
            background-color: rgba(26, 188, 156, 0.7);
        }

        .menu a:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }
        
        .menu a:hover i {
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to the Grocery Management System</h1>
        <h2>What would you like to do?</h2>
        <h3>Just Choose it.....</h3>
        <div class="menu">
            <a href="itm">
                <i class="fas fa-cart-plus"></i>
                Add New Grocery Item
            </a>
            <a href="search">
                <i class="fas fa-search"></i>
                Search Grocery Items
            </a>
            <a href="getitm">
                <i class="fas fa-list-ol"></i>
                View All Grocery Items
            </a>
            <a href="purchase">
                <i class="fas fa-shopping-basket"></i>
                Purchase Grocery Items
            </a>
            <a href="edit">
                <i class="fas fa-edit"></i>
                Edit Grocery Items
            </a>
        </div>
    </div>
</body>
</html>