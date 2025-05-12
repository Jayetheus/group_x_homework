<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Thanix Student Residence Finder</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../styles/about_style.css">
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
                    <li><a href="about.jsp" class="active">About</a></li>
                    <li><a href="residences.jsp">Residences</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
                <a href="add_res.html" class="btn">Res_Provider</a>
            </nav>
        </div>
    </header>

    <section class="about-main">
        <div class="container">
            <div class="about-hero">
                <h1>About Thanix</h1>
                <p>Connecting students with safe, affordable, and convenient accommodations across South Africa.</p>
            </div>

            <div class="mission-vision">
                <div class="mission">
                    <h2><i class="fas fa-bullseye"></i> Our Mission</h2>
                    <p>To simplify the student housing search process by providing a comprehensive platform that matches students with residences that meet their needs, preferences, and budgets.</p>
                </div>
                <div class="vision">
                    <h2><i class="fas fa-eye"></i> Our Vision</h2>
                    <p>To become South Africa's most trusted student accommodation platform, ensuring every student finds a home away from home.</p>
                </div>
            </div>

            <div class="our-story">
                <h2>Our Story</h2>
                <p>Founded in 2023, Thanix was born out of the frustration students face when searching for suitable accommodations near their universities. Our team of former students understands the challenges of finding safe, affordable housing that's close to campus.</p>
                <p>We've partnered with verified residence providers across major South African universities to bring you a curated selection of student accommodations.</p>
            </div>

            <div class="team-section">
                <h2>Meet the Team</h2>
                <div class="team-grid">
                    <div class="team-member">
                        <img src="../images/team1.jpg" alt="Team Member">
                        <h3>John Doe</h3>
                        <p>Founder & CEO</p>
                    </div>
                    <div class="team-member">
                        <img src="../images/team2.jpg" alt="Team Member">
                        <h3>Jane Smith</h3>
                        <p>Head of Operations</p>
                    </div>
                    <div class="team-member">
                        <img src="../images/team3.jpg" alt="Team Member">
                        <h3>Mike Johnson</h3>
                        <p>Tech Lead</p>
                    </div>
                </div>
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
