<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Residences - Thanix</title>
    <style>
        /* Consolidated CSS */
        :root {
            --primary-color: #007BFF;
            --secondary-color: #0056b3;
            --background-color: #f4f4f4;
            --text-color: #333;
        }

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            color: var(--text-color);
            line-height: 1.6;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px 0;
        }

        header {
            background-color: var(--primary-color);
            color: #fff;
            padding: 20px 0;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .logo img {
            height: 40px;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
            padding: 0;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            transition: opacity 0.3s;
        }

        nav a:hover {
            opacity: 0.8;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: var(--primary-color);
            color: #fff;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: var(--secondary-color);
        }

        .search-section, .results-section {
            padding: 40px 0;
        }

        .search-form {
            max-width: 600px;
            margin: 0 auto;
            display: grid;
            gap: 20px;
        }

        .form-group {
            display: grid;
            gap: 5px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        .residence-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px 0;
        }

        .residence-card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.3s ease;
        }

        .residence-card:hover {
            transform: translateY(-5px);
        }

        .card-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-content {
            padding: 20px;
        }

        .card-badge {
            background: #28a745;
            color: white;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 0.8rem;
            display: inline-block;
            margin-bottom: 10px;
        }

        footer {
            background: var(--primary-color);
            color: white;
            text-align: center;
            padding: 20px 0;
            margin-top: 40px;
        }

        .no-results {
            text-align: center;
            padding: 40px 0;
            font-size: 1.2rem;
            color: #666;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
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

    <main>
        <section class="search-section">
            <div class="container">
                <h2>Find Your Perfect Student Residence</h2>
                <form class="search-form" method="POST" action="Filter">
                    <div class="form-group">
                        <label for="city">Location</label>
                        <input type="text" id="city" name="city" class="form-control" 
                               placeholder="Enter city" required>
                    </div>
                    <div class="form-group">
                        <label for="room_type">Room Type</label>
                        <select id="room_type" name="room_type" class="form-control" required>
                            <option value="">Select Room Type</option>
                            <option value="SINGLE">Single Room</option>
                            <option value="SHARING">Shared Room</option>
                            <option value="MIXED">Mixed Rooms</option>
                        </select>
                    </div>
                    <button type="submit" class="btn">Search Residences</button>
                </form>
            </div>
        </section>

        <section class="results-section">
            <div class="container">
                <c:choose>
                    <c:when test="${not empty residences}">
                        <div class="residence-grid">
                            <c:forEach items="${residences}" var="res">
                                <article class="residence-card">
                                    <img src="residence1.jpg" alt="${res.name}" class="card-image">
                                    <div class="card-content">
                                        <c:if test="${res.nsfasAccredited}">
                                            <span class="card-badge">NSFAS Accredited</span>
                                        </c:if>
                                        <h3>${res.name}</h3>
                                        <p><strong>Location:</strong> ${res.city}, ${res.state}</p>
                                        <p><strong>Room Type:</strong> ${res.roomType}</p>
                                        <p><strong>Contact:</strong> ${res.telephone}</p>
                                        <a href="#" class="btn" style="margin-top: 15px;">View Details</a>
                                    </div>
                                </article>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="no-results">
                            <p>No residences found matching your criteria. Please try different search parameters.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </section>
    </main>

    <footer>
        <div class="container">
            <p>&copy; ${year} Thanix Student Residence Finder. All rights reserved.</p>
            <div class="social-links">
                <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </footer>

    <script>
        // Add current year to footer
        document.querySelector('footer p').innerHTML = `&copy; ${new Date().getFullYear()} Thanix Student Residence Finder. All rights reserved.`;
    </script>
</body>
</html>
