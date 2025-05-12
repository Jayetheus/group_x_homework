<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Residences - Thanix Student Residence Finder</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../styles/residences_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <header>
        <div class="container">
            <div class="logo">
                <img src="../images/logo.png" alt="Thanix Logo">
                <h1>Thanix Student Residence Finder</h1>
            </div>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="residences.jsp" class="active">Residences</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
                <a href="add_res.html" class="btn">Res_Provider</a>
            </nav>
        </div>
    </header>

    <section class="residences-main">
        <div class="container">
            <h1>Available Student Residences</h1>
            <div class="filter-section">
                <form action="ResidenceServlet" method="get">
                    <div class="filter-group">
                        <label for="location">Location:</label>
                        <select id="location" name="location">
                            <option value="">All Locations</option>
                            <option value="cape_town">Cape Town</option>
                            <option value="johannesburg">Johannesburg</option>
                            <option value="stellenbosch">Stellenbosch</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <label for="price">Max Price:</label>
                        <select id="price" name="price">
                            <option value="">Any Price</option>
                            <option value="3000">R3000</option>
                            <option value="5000">R5000</option>
                            <option value="7000">R7000</option>
                        </select>
                    </div>
                    <div class="filter-group">
                        <label for="type">Residence Type:</label>
                        <select id="type" name="type">
                            <option value="">Any Type</option>
                            <option value="dorm">Dormitory</option>
                            <option value="apartment">Apartment</option>
                            <option value="house">Shared House</option>
                        </select>
                    </div>
                    <button type="submit" class="btn">Filter Results</button>
                </form>
            </div>

            <div class="residences-grid">
                <%@ page import="java.util.List" %>
                <%@ page import="com.thanix.model.Residence" %>
                <%
                    List<Residence> residences = (List<Residence>) request.getAttribute("residences");
                    if (residences != null && !residences.isEmpty()) {
                        for (Residence res : residences) {
                %>
                <div class="residence-card">
                    <img src="../images/residences/<%= res.getImage() %>" alt="<%= res.getName() %>">
                    <div class="residence-details">
                        <h3><%= res.getName() %></h3>
                        <p class="location"><i class="fas fa-map-marker-alt"></i> <%= res.getLocation() %></p>
                        <p class="price">R<%= res.getPrice() %>/month</p>
                        <p class="description"><%= res.getDescription() %></p>
                        <div class="amenities">
                            <% if (res.isWifi()) { %><span><i class="fas fa-wifi"></i> WiFi</span><% } %>
                            <% if (res.isLaundry()) { %><span><i class="fas fa-tshirt"></i> Laundry</span><% } %>
                            <% if (res.isParking()) { %><span><i class="fas fa-car"></i> Parking</span><% } %>
                        </div>
                        <a href="residence-details.jsp?id=<%= res.getId() %>" class="btn">View Details</a>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <p class="no-results">No residences found matching your criteria.</p>
                <%
                    }
                %>
            </div>
        </div>
    </section>

    <footer>
        <div class="container">
            <p>&copy; 2025 Thanix Student Residence Finder. All rights reserved.</p>
            <div class="social-links">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </footer>
</body>
</html>
