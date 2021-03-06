<div id="top"></div>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Tungnguyen0504">
    <img src="https://github.com/Tungnguyen0504/E-Commerce-Website-Shopp.my/blob/master/web/assets/images/icons/1-removebg-preview.png" alt="Logo" width="175">
  </a>

<h3 align="center">E-Commerce Project - An amazing website</h3>

  <p align="center">
    <a href="https://github.com/Tungnguyen0504/E-Commerce-Website-Shopp.my"><strong>Explore the docs »</strong></a>
    <br />
    <br />
  </p>
</div>



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
3. Login account `sa` and config port `1433` for SQL SERVER.
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


https://user-images.githubusercontent.com/91137455/145105257-75b03f43-c6eb-406a-96aa-e047bb474d52.mp4


<br>
* Demo admin role: <br>


https://user-images.githubusercontent.com/91137455/145105963-3fb7d699-d80e-4b0a-9d97-f41d1b893da4.mp4

* Diagram:
![diagram](https://user-images.githubusercontent.com/91137455/145210921-a7fd0968-b062-4fba-8109-492cd113c850.jpg)


## Somethings wrong!!

If you find that something's wrong with this package, you can let me know by raising an issue on the GitHub issue tracker, 
or take it as a task and 🧑‍💻 resolve it 💪 --> create a PullRequest 🛠.

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
