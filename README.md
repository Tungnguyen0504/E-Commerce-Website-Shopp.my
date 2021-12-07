<div id="top"></div>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Tungnguyen0504">
    <img src="https://github.com/Tungnguyen0504/E-Commerce-Website-Shopp.my/blob/master/web/assets/images/icons/1-removebg-preview.png" alt="Logo" width="175">
  </a>

<h3 align="center">project_title</h3>

  <p align="center">
    <a href="https://github.com/Tungnguyen0504/E-Commerce-Website-Shopp.my"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/github_username/repo_name">View Demo</a>
    ·
    <a href="https://github.com/github_username/repo_name/issues">Report Bug</a>
    ·
    <a href="https://github.com/github_username/repo_name/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project <br>

[![Product Name Screen Shot][product-screenshot]](https://example.com)

E-commerce is fast gaining ground as an accepted and used business paradigm. More and more business houses are implementing web sites providing functionality for performing commercial transactions over the web. It is reasonable to say that the process of shopping on the web is becoming commonplace.

The objective of this project is to develop a general-purpose e-commerce store where any product (such as Laptop, Smartphone, Camera) can be bought from the comfort of home through the Internet.

<p align="right">(<a href="#top">back to top</a>)</p>

### Functionalities
1. User Registeration Cell.

2. CRUD Operations like

* User can add product to their cart and purchase summary.
* Admin can add account, product to the product list.
* Admin can edit the account, product details.
* Admin can delete the account, product from the list.
* Admin can view order detail and change status of bill pending, delivery or finish.

3. Security
* User can login into the site.
* The entire site will change according to the role, depending on whether the client is User or Admin.
* User can logout after completing.
4. WebFlow
* After adding products the cart the User can checkout using spring WebFlow.
* Confirming User Details.
* Confirming Shipping and Billing Address.
* Receipt.
* If the user cancels the webflow, it will go to cancel Page.
* If the user submits the checkout, it will go to thank you page with the timing of delivery Report.
* User can check order history in order-history page

### Built With

* [HTML](https://www.w3schools.com/html/)
* [CSS](https://www.w3schools.com/css/)
* [Javascript](https://www.w3schools.com/js/)
* [Java](https://www.java.com/en/)
* [Bootstrap](https://getbootstrap.com)
* [JQuery](https://jquery.com)

<p align="right">(<a href="#top">back to top</a>)</p>


### Installation

1. Development Platform - Netbeans / JDK8.
2. Database - SQL SERVER.
3. Login account sa and config port 1433 for SQL SERVER.
4. Run Database.
5. Configure your databse configuration in `DBContext.java`.
   ```sh
    private final String serverName = "localhost";
    private final String dbName = "YOUR DB NAME";
    private final String portNumber = "1433";
    private final String userID = "sa";
    private final String password = "YOUR DB PASSWORD";
   ```
6. Run the server.

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Screen short

* Home page: <br>
![Product Name Screen Shot][product-screenshot]
<br>
* Demo shopping: <br>
https://user-images.githubusercontent.com/91137455/145101441-d825e67c-7de6-4950-96be-6e1b9e78b471.mp4
<br>
* Demo admin role: <br>
https://linkedin.com/in/linkedin_username
[product-screenshot]:https://github.com/Tungnguyen0504/E-Commerce-Website-Shopp.my/blob/master/web/assets/images/screen-short/demo-admin.mp4


<!-- CONTRIBUTING -->
## Contributing

Contributors are most welcome.

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

Facebook - <a href="https://www.facebook.com/chang.namay/">Tùng Nguyễn</a>

Email - <a href="tungnguyenn0504@gmail.com">tungnguyenn0504@gmail.com</a>

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/github_username/repo_name.svg?style=for-the-badge
[contributors-url]: https://github.com/github_username/repo_name/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/github_username/repo_name.svg?style=for-the-badge
[forks-url]: https://github.com/github_username/repo_name/network/members
[stars-shield]: https://img.shields.io/github/stars/github_username/repo_name.svg?style=for-the-badge
[stars-url]: https://github.com/github_username/repo_name/stargazers
[issues-shield]: https://img.shields.io/github/issues/github_username/repo_name.svg?style=for-the-badge
[issues-url]: https://github.com/github_username/repo_name/issues
[license-shield]: https://img.shields.io/github/license/github_username/repo_name.svg?style=for-the-badge
[license-url]: https://github.com/github_username/repo_name/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/linkedin_username
[product-screenshot]:https://github.com/Tungnguyen0504/E-Commerce-Website-Shopp.my/blob/master/web/assets/images/screen-short/home.jpg
