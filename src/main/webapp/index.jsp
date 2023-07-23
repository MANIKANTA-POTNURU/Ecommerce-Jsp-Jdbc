<%@page import="com.connection.DbCon"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>

<html>
  <head>
<title>
  Ecommerce
</title>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/20c5629a29.js" crossorigin="anonymous"></script>
    <style>
      .food-munch-logo {
  width: 40px;
  height: 40px;
  padding: 5px;
  }
  #navItem1 {
    color: #323f4b;
    font-family: "Roboto";
  }
  #navItem2 {
    color: #323f4b;
    font-family: "Roboto";
  }
  #navItem3 {
    color: #323f4b;
    font-family: "Roboto";
  }
  #navItem4 {
    color: #323f4b;
    font-family: "Roboto";
  }
  .banner-section-bg-container {
    background-image: url('https://i.postimg.cc/7hXpj1TL/wallpaperflare-com-wallpaper.jpg');
    height: 100vh;
    background-size: cover;
  }
  .banner-heading {
    color:black;
    font-family:"Roboto";
    font-size: 45px;
    font-weight: 300;
  }
  .megha
  {
    color:black;
  }
  .banner-caption {
    color:black;
    font-family: "Roboto";
    font-size: 24px;
    font-weight: 300;
  }
  .custom-button {
    color: white;
    background-color: #d0b200;
    width: 130px;
    height: 45px;
    border-width: 0;
    border-radius: 8px;
    margin-right: 10px;
  }
  .custom-outline-button {
    color: #d0b200;
    background-color: transparent;
    width: 130px;
    height: 45px;
    border-style: solid;
    border-width: 1px;
    border-color: #d0b200;
    border-radius: 8px;
  }
  .wcu-section {
    background-color: #f9fbfe;
  }
  .wcu-section-heading {
    color: #183b56;
    font-family: "Roboto";
    font-size: 28px;
    font-weight: 700;
  }
  .wcu-section-description {
    color: #5a7184;
    font-family: "Roboto";
    font-size: 16px;
  }
  .wcu-card {
    text-align: center;
    background-color: white;
    border-style: solid;
    border-width: 1px;
    border-color: #e5eaf4;
    border-radius: 16px;
  }
  .wcu-card-image {
    width: 87px;
    height: 90px;
  }
  .wcu-card-title {
    color: #323f4b;
    font-family: "Roboto";
    font-size: 22px;
    font-weight: 500;
  }
  .wcu-card-description {
    color: #7b8794;
    font-family: "Roboto";
    font-size: 16px;
  }
  .offers {
    color: #323f4b;
    font-style: italic;
    font-weight: 600;
  }
  .explore-menu-section {
    background-color: white;
  }
  .menu-section-heading {
    color: #183b56;
    font-family: "Roboto";
    font-size: 28px;
    font-weight: 700;
  }
  .menu-item-image {
    border-radius: 16px;
    height:200px;
  }
  .menu-card-title {
    color: #323f4b;
    font-family: "Roboto";
    font-size: 18px;
    font-weight: 500;
    margin-top: 24px;
  }
  .menu-item-link {
    color: #d0b200;
    font-family: "Roboto";
    font-size: 14px;
    font-weight: 500;
  }
  .menu-item-card {
    border-radius: 16px;
  }
  .healthy-food-section {
    background-color: #f9fbfe;
  }
  .healthy-food-section-img
  {
    width: 270px;
    border-radius:20px;
  }
  .healthy-food-section-heading {
    color: #183b56;
    font-family: "Roboto";
    font-size: 28px;
    font-weight: 700;
  }
  .healthy-food-section-description {
    color: #5a7184;
    font-family: "Roboto";
    font-size: 16px;
  }
  .delivery-and-payment-section {
    background-color: white;
  }
  .delivery-and-payment-section-img {
    width: 270px;
  }
  .delivery-and-payment-section-heading {
    color: #183b56;
    font-family: "Roboto";
    font-size: 28px;
    font-weight: 700;
  }
  .delivery-and-payment-section-description {
    color: #5a7184;
    font-family: "Roboto";
    font-size: 16px;
  }
  .payment-card-img {
    width: 50px;
    height: 50px;
    margin-right: 28px;
  }
  .thanking-customers-section {
    background-color: #d0b2001a;
  }
  .thanking-customers-section-heading {
    color: #183b56;
    font-family: "Roboto";
    font-size: 28px;
    font-weight: 700;
  }
  .thanking-customers-section-description {
    color: #5a7184;
    font-family: "Roboto";
    font-size: 16px;
  }
  .thanking-customers-section-img {
    width: 270px;
    margin-bottom: 20px;
  }
  .follow-us-section {
    background-color: white;
  }
  .follow-us-section-heading {
    text-align: center;
    color: #183b56;
    font-family: "Roboto";
    font-size: 28px;
    font-weight: 700;
  }
  .follow-us-icon-container {
    background-color: #faf7e8;
    width: 80px;
    height: 80px;
    border-radius: 40px;
    margin: 15px;
    padding-top: 22px;
    padding-bottom: 14px;
    padding-right: 16px;
    padding-left: 22px;
  }
  .icon {
    color: #d0b200;
    font-size: 35px;
  }
  .footer-section {
    background-color: #0d2436;
  }
  .footer-section-mail-id {
    color: #959ead;
    font-family: "Roboto";
    font-weight: bold;
    font-size: 16px;
    margin-top: 20px;
  }
  .footer-section-address {
    color: #959ead;
    font-family: "Roboto";
    font-size: 14px;
  }
    </style>
  </head>
  <body>
   <%@include file="/includes/navbar.jsp"%> 
    <div class="banner-section-bg-container d-flex justify-content-center flex-column">
      <div class="text-center">
        <h1 class="banner-heading mb-3">Smart Ideas, Small Spends</h1>
        <p class="banner-caption mb-4">Shop Now</p>
       <a href="products.jsp"> <button  class="custom-button">View Products</button></a>
        <a href="{% url 'login' %}"><button class="custom-outline-button">Order Now</button></a>
      </div>
    </div>
    <div class="wcu-section pt-5 pb-5" id="wcuSection">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <h1 class="wcu-section-heading">Why Choose Us?</h1>
            <p class="wcu-section-description">
              Our business & design experts help you with flexible, affordable and sustainable solutions.<br> Create a better life at work with us.
            </p>
          </div>
          <div class="col-12 col-md-3">
            <div class="wcu-card p-3 mb-3">
              <img src="images/return.jpg"
                class="wcu-card-image"
              />
              <h1 class="wcu-card-title mt-3">Returns policy</h1>
              <p class="wcu-card-description">
                Exceptions during COVID19
              </p>
              <a href="" class="menu-item-link">
                Learn More
                <svg width="16px" height="16px" viewBox="0 0 16 16" class="bi bi-arrow-right-short" fill="#d0b200" xmlns="http://www.w3.org/2000/svg">
                  <path
                    fill-rule="evenodd"
                    d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z"
                  />
                </svg>
              </a>
            </div>
          </div>
          <div class="col-12 col-md-3">
            <div class="wcu-card p-3 mb-3">
              <img
                src="images/click.jpg"
                class="wcu-card-image"
              />
              <h1 class="wcu-card-title mt-3">Click & collect</h1>
              <p class="wcu-card-description">
                Safe click and collect shopping!
              </p>
              <a href="" class="menu-item-link">
                Learn More
                <svg width="16px" height="16px" viewBox="0 0 16 16" class="bi bi-arrow-right-short" fill="#d0b200" xmlns="http://www.w3.org/2000/svg">
                  <path
                    fill-rule="evenodd"
                    d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z"
                  />
                </svg>
              </a>
            </div>
          </div>
          <div class="col-12 col-md-3">
            <div class="wcu-card p-3 mb-3">
              <img
                src="images/plan.jpg"
                class="wcu-card-image"
              />
              <h1 class="wcu-card-title mt-3">Planning tools</h1>
              <p class="wcu-card-description">
                Our planning tools will help you give shape to your ideas
              </p>
              <a href="" class="menu-item-link">
                Learn More
                <svg width="16px" height="16px" viewBox="0 0 16 16" class="bi bi-arrow-right-short" fill="#d0b200" xmlns="http://www.w3.org/2000/svg">
                  <path
                    fill-rule="evenodd"
                    d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z"
                  />
                </svg>
              </a>
            </div>
          </div>
          <div class="col-12 col-md-3">
            <div class="wcu-card p-3 mb-3">
              <img
                src="images/offer.jpg"
                class="wcu-card-image"
              />
              <h1 class="wcu-card-title mt-3">Best Offers</h1>
              <p class="wcu-card-description">
                 Offers upto
                <span class="offers">50% OFF</span>
                and Exclusive Promo Codes on All Online Products.
              </p>
              <a href="" class="menu-item-link">
                Learn More
                <svg width="16px" height="16px" viewBox="0 0 16 16" class="bi bi-arrow-right-short" fill="#d0b200" xmlns="http://www.w3.org/2000/svg">
                  <path
                    fill-rule="evenodd"
                    d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z"
                  />
                </svg>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="explore-menu-section pt-5 pb-5" id="exploreMenuSection">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <h1 class="menu-section-heading">Category Add-Ons</h1>
          </div>
          <div class="col-12 col-md-6 col-lg-3">
            <div class="shadow menu-item-card p-3 mb-3">
              <img
                src="images/Fashion.jpg"
                class="menu-item-image w-100"
              />
              <h1 class="menu-card-title">Fashion</h1>
              <a href="" class="menu-item-link">
                View All
                <svg width="16px" height="16px" viewBox="0 0 16 16" class="bi bi-arrow-right-short" fill="#d0b200" xmlns="http://www.w3.org/2000/svg">
                  <path
                    fill-rule="evenodd"
                    d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z"
                  />
                </svg>
              </a>
            </div>
          </div>
          <div class="col-12 col-md-6 col-lg-3">
            <div class="shadow menu-item-card p-3 mb-3">
              <img
                src="images/Electronics.jpg"
                class="menu-item-image w-100"
              />
              <h1 class="menu-card-title">Electronics</h1>
              <a href=""class="menu-item-link">
                View All
                <svg width="16px" height="16px" viewBox="0 0 16 16" class="bi bi-arrow-right" fill="#d0b200" xmlns="http://www.w3.org/2000/svg">
                  <path
                    fill-rule="evenodd"
                    d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z"
                  />
                </svg>
              </a>
            </div>
          </div>
          <div class="col-12 col-md-6 col-lg-3">
            <div class="menu-item-card shadow p-3 mb-3">
              <img
                src="images/groceries.jpg"
                class="menu-item-image w-100"
              />
              <h1 class="menu-card-title">groceries</h1>
              <a href="" class="menu-item-link">
                View All
                <svg width="16px" height="16px" viewBox="0 0 16 16" class="bi bi-arrow-right" fill="#d0b200" xmlns="http://www.w3.org/2000/svg">
                  <path
                    fill-rule="evenodd"
                    d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z"
                  />
                </svg>
              </a>
            </div>
          </div>
          <div class="col-12 col-md-6 col-lg-3">
            <div class="menu-item-card shadow p-3 mb-3">
              <img
                src="images/cosmetics.jpg"
                class="menu-item-image w-100"
              />
              <h1 class="menu-card-title">cosmetics</h1>
              <a href="" class="menu-item-link">
                View All
                <svg width="16px" height="16px" viewBox="0 0 16 16" class="bi bi-arrow-right" fill="#d0b200" xmlns="http://www.w3.org/2000/svg">
                  <path
                    fill-rule="evenodd"
                    d="M4 8a.5.5 0 0 1 .5-.5h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5A.5.5 0 0 1 4 8z"
                  />
                </svg>
              </a>
            </div>
          </div>
               
          
        </div>
      </div>
    </div>
    <div class="healthy-food-section pt-5 pb-5">
      <div class="container">
        <div class="row">
          <div class="col-12 col-md-5">
            <div class="text-center">
              <img
                src="images/chohan.jpg"
                class="healthy-food-section-img"
              />
            </div>
          </div>
          <div class="col-12 col-md-7">
            <h1 class="healthy-food-section-heading">
              Explore our Products
            </h1>
            <p class="healthy-food-section-description">
              Products have become an essential part of modern life, providing convenient and efficient transportation to millions of people worldwide.
              There are many different types of automobiles available, including compact cars,bikes,buses, trucks, and vans, each designed to meet different needs and preferences.
            </p>
            <button class="custom-button">Watch Video</button>
          </div>
        </div>
      </div>
    </div>
    <div class="delivery-and-payment-section pt-5 pb-5" id="deliveryPaymentSection">
      <div class="container">
        <div class="row">
          <div class="col-12 col-md-5 order-1 order-md-2">
            <div class="text-center">
              <img
                src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/delivery-payment-section-img.png"
                class="delivery-and-payment-section-img"
              />
            </div>
          </div>
          <div class="col-12 col-md-7 order-2 order-md-1">
            <h1 class="delivery-and-payment-section-heading">
              Delivery and Payment
            </h1>
            <p class="delivery-and-payment-section-description">
              Enjoy hassle-free payment with the plenitude of payment options
              available for you. Get live tracking and locate your Product on a
              live map. It's quite a sight to see your product arrive to your door.
              Plus, you get a 25% discount on every order every time you pay
              online.
            </p>
            <a href="{% url 'login' %}"><button class="custom-button">Order Now</button></a>
            <div class="mt-3">
              <img
                src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/visa-card-img.png"
                class="payment-card-img"
              />
              <img
                src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/master-card-img.png"
                class="payment-card-img"
              />
              <img
                src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/paypal-card-img.png"
                class="payment-card-img"
              />
              <img
                src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/american-express-img.png"
                class="payment-card-img"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="thanking-customers-section pt-5 pb-5">
      <div class="container">
        <div class="row">
          <div class="col-12 col-md-7 d-flex flex-column justify-content-center">
            <h1 class="thanking-customers-section-heading">
              Thank you for being a valuable customer to us.
            </h1>
            <p class="thanking-customers-section-description">
              We have a surprise gift for you
            </p>
            <div class="d-md-none">
              <img
                src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/thanking-customers-section-img.png"
                class="thanking-customers-section-img"
              />
            </div>
            <div>
              <a href="{% url 'login' %}"><button class="custom-button">Redeem Gift</button></a>
            </div>
          </div>
          <div class="col-12 col-md-5 d-none d-md-block">
            <img
              src="https://d1tgh8fmlzexmh.cloudfront.net/ccbp-responsive-website/thanking-customers-section-img.png"
              class="thanking-customers-section-img"
            />
          </div>
        </div>
      </div>
    </div>
    <div class="follow-us-section pt-5 pb-5" id="followUsSection">
      <div class="container">
        <div class="row">
          <div class="col-12">
            <h1 class="follow-us-section-heading">Follow Us</h1>
          </div>
          <div class="col-12">
            <div class="d-flex flex-row justify-content-center">
              <div class="follow-us-icon-container">
               <a href="https://www.linkedin.com/in/manikanta-potnuru-723238226/"> <i class="fab fa-linkedin icon"></i></a>
              </div>
              <div class="follow-us-icon-container">
                <a href="https://www.instagram.com/mani_potnuru12/"><i class="fab fa-instagram icon"></i></a>
              </div>
              <div class="follow-us-icon-container">
                <i class="fab fa-facebook icon"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
<%@include file="/includes/footer.jsp"%>
<script type="text/javascript">
    (function(d, m){
        var kommunicateSettings =
            {"appId":"174922c107487d4fbaf8de00b01572b46","popupWidget":true,"automaticChatOpenOnNavigation":true};
        var s = document.createElement("script"); s.type = "text/javascript"; s.async = true;
        s.src = "https://widget.kommunicate.io/v2/kommunicate.app";
        var h = document.getElementsByTagName("head")[0]; h.appendChild(s);
        window.kommunicate = m; m._globals = kommunicateSettings;
    })(document, window.kommunicate || {});
/* NOTE : Use web server to view HTML files as real-time update will not work if you directly open the HTML file in the browser. */
</script>
  </body>
</html>