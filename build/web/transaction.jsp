<%@page import="java.sql.ResultSet"%>
<html>
    <head>
        <title>Pricings</title>
        <!-- Add your CSS and JavaScript files here -->
        <link rel="stylesheet" href="css/pricingStyles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div class="navbar">
            <ul class="navbar-left">
                <li><a href="adminHome.jsp"><img src="images/logoNav.png" class="logoPic"></a></li>
            </ul>
            <ul class="navbar-right">
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="LogoutServlet">Log Out</a></li>
            </ul>
        </div>

        <input type="checkbox" id="check">
        <label for="check">
            <i class="fa-solid fa-bars" id="btn"></i>
            <i class="fas fa-times" id="cancel"></i>
        </label>
        <div class="sidebar">
            <header><%= session.getAttribute("user")%></header>
            <div class="sidePic"><img src="images/admin.png" id="sidePic"/></div>
            <ul>
                <li><a href="adminHome.jsp"><i class="fa-solid fa-house"></i>Home</a></li>
                <li><a href="UseraccServlet"><i class="fa-solid fa-user"></i>User Lists</a></li>
                <li><a href="PriceServlet"><i class="fa-solid fa-money-bill-1-wave"></i>Pricings</a></li>
                <li><a href="StationServlet"><i class="fa-solid fa-train"></i>Railways</a></li>
                <li><a href=TransactionServlet"><i class="fa-solid fa-ticket"></i>Transaction Logs</a></li>
                </li>

            </ul>
        </div>

        <section id="home">
            <h1>Transactions</h1>
            <table class="tableCont">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Customer Type</th>
                        <th>Origin</th>
                        <th>Destination</th>
                        <th>Discount</th>
                        <th>Total</th>
                        <th>Transaction Number</th>
                    </tr>
                </thead>

                <%
                    ResultSet results = (ResultSet) request.getAttribute("results");
                    while (results.next()) {%>
                <tbody>
                    <tr>
                        <td><%=results.getString("email")%></td>
                        <td><%=results.getString("custype")%></td>
                        <td><%=results.getString("origin")%></td>
                        <td><%=results.getString("destination")%></td>
                        <td><%=results.getString("discount")%></td>
                        <td><%=results.getString("total")%></td>
                        <td><%=results.getString("transnum")%></td>
                    </tr>	

                </tbody>
                <%	}
                %>
            </table>
            <div class="buttonCont">
                <a href="adminHome.jsp"><button class="myButton">Go back?</button></a>
            </div>
            <%
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
                response.setHeader("Pragma", "no-cache"); // HTTP 1.0
                response.setHeader("Expires", "0"); // Proxies

                if (session.getAttribute("user") == null) {
                    response.sendRedirect("loginSignup.jsp");
                }
            %>
    </body>
</section>
</body>
</html>