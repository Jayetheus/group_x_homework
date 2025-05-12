<%-- 
    Document   : residences_search
    Created on : Mar 13, 2025, 1:59:01 AM
    Author     : Jayetheus
--%>

<%@page import="jayethian.thanix.entity.Residence"%>
<%@page import="java.util.List"%>
<%@page import="jayethian.thanix.bean.ResidenceFacadeLocal"%>
<%@page import="jakarta.ejb.EJB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Residences - Thanix</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            line-height: 1.6;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        h1, h2, h3 {
            margin: 0;
            font-weight: 600;
        }

        p {
            margin: 10px 0;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007BFF;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        /* Header */
        header {
            background-color: #007BFF;
            color: #fff;
            padding: 20px 0;
        }

        header .logo {
            display: flex;
            align-items: center;
        }

        header .logo img {
            height: 40px;
            margin-right: 10px;
        }

        header nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        header nav ul li a {
            color: #fff;
            text-decoration: none;
        }

        /* Hero Section */
        .hero {
            display: flex;
            align-items: center;
            padding: 100px 0;
            background-color: #f4f4f4;
        }

        .hero-text {
            flex: 1;
        }

        .hero-text h2 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .hero-text p {
            font-size: 1.2rem;
            margin-bottom: 30px;
        }

        .hero-image {
            flex: 1;
            text-align: right;
        }

        .hero-image img {
            max-width: 100%;
            border-radius: 10px;
        }

        /* About Section */
        .about {
            padding: 80px 0;
            text-align: center;
        }

        .about h2 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        /* Residences Section */
        .residences {
            padding: 80px 0;
            background-color: #f4f4f4;
        }

        .residences h2 {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 40px;
        }

        .residence-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .residence-card {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .residence-card img {
            max-width: 100%;
            border-radius: 10px;
        }

        .residence-card h3 {
            font-size: 1.5rem;
            margin: 15px 0;
        }

        /* Contact Section */
        .contact {
            padding: 80px 0;
            text-align: center;
        }

        .contact h2 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .contact form {
            max-width: 600px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .contact input, .contact textarea {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .contact button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .contact button:hover {
            background-color: #0056b3;
        }

        /* Footer */
        footer {
            background-color: #007BFF;
            color: #fff;
            padding: 20px 0;
            text-align: center;
        }

        footer .social-links {
            margin-top: 10px;
        }

        footer .social-links img {
            height: 24px;
            margin: 0 10px;
        }



        /* Search Section */
        .search {
            padding: 80px 0;
            text-align: center;
        }

        .search h2 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .search-form {
            max-width: 600px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .form-group {
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 600;
        }

        .form-group input, .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        /* Results Section */
        .results {
            padding: 80px 0;
            background-color: #f4f4f4;
        }

        .results h2 {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 40px;
        }

        .residence-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .residence-card {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .residence-card img {
            max-width: 100%;
            border-radius: 10px;
        }

        .residence-card h3 {
            font-size: 1.5rem;
            margin: 15px 0;
        }

        .residence-card p {
            margin: 10px 0;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="container">
            <div class="logo">
                <img src="logo.png" alt="Thanix Logo">
                <h1>Thanix Student Residence Finder</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#residences">Residences</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <li><a href="#login" class="btn">Login</a></li>
                </ul>
            </nav>
        </div>
    </header>
    
    <!-- Search Results Section -->
    <section id="results" class="results">
        <div class="container">
                                          
            <div class="residence-grid">
                <!-- Example Residence Card -->
                
                
                <%
                    
                    List<Residence> reses = (List<Residence>)request.getAttribute("residences");
                    if(reses != null){
                    if(!reses.isEmpty()){
                        for(Residence res : reses){
                    
                %>
                    <div class="residence-card">
                        <img src="residence1.jpg" alt="Residence 1">
                        <h3><%=res.getName()%></h3>
                        <p><strong>Location:</strong> <%= res.getCity() %>, <%= res.getState()%></p>
                        <p><strong>Price:</strong> R2500/month</p>
                        <p><strong>Room Type:</strong> <%= res.getRoom_type()%></p>
                    </div>

                <%
                    }}}
                %>
                <!-- Add more residence cards dynamically based on search results -->
            </div>
        </div>
    </section>

    <!-- Search Section -->
    <section id="search" class="search">
        <div class="container">
            <h2>Search for Residences</h2>
            <form class="search-form" method="POST" action="Filter">
                <div class="form-group">
                    <label for="location">Location</label>
                    <input type="text" id="location" name="city" placeholder="Enter city" required>
                </div>
                
                <div class="form-group">
                    <label for="room-type">Room Type</label>
                    <select id="room-type" name="room_type" required>
                        <option value="">Select Room Type</option>
                        <option value="SINGLE">Single Room</option>
                        <option value="SHARING">Shared Room</option>
                        <option value="MIXED">Mixed Rooms</option>
                    </select>
                </div>
                <button type="submit" class="btn">Search</button>
            </form>
        </div>
    </section>

    <!-- Footer Section -->
    <footer>
        <div class="container">
            <p>&copy; 2023 Thanix Student Residence Finder. All rights reserved.</p>
            <div class="social-links">
                <a href="#"><img src="facebook-icon.png" alt="Facebook"></a>
                <a href="#"><img src="twitter-icon.png" alt="Twitter"></a>
                <a href="#"><img src="instagram-icon.png" alt="Instagram"></a>
            </div>
        </div>
    </footer>
</body>
</html>