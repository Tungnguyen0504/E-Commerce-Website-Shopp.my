package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class footer_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <!-- Brands Section Start -->\n");
      out.write("        <div class=\"brands-section section mb-90\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("\n");
      out.write("                    <!-- Brand Slider Start -->\n");
      out.write("                    <div class=\"brand-slider col\">\n");
      out.write("                        <div class=\"brand-item col\"><img src=\"assets/images/brands/brand-1.png\" alt=\"Brands\"></div>\n");
      out.write("                        <div class=\"brand-item col\"><img src=\"assets/images/brands/brand-2.png\" alt=\"Brands\"></div>\n");
      out.write("                        <div class=\"brand-item col\"><img src=\"assets/images/brands/brand-3.png\" alt=\"Brands\"></div>\n");
      out.write("                        <div class=\"brand-item col\"><img src=\"assets/images/brands/brand-4.png\" alt=\"Brands\"></div>\n");
      out.write("                        <div class=\"brand-item col\"><img src=\"assets/images/brands/brand-5.png\" alt=\"Brands\"></div>\n");
      out.write("                    </div><!-- Brand Slider End -->\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div><!-- Brands Section End -->\n");
      out.write("\n");
      out.write("        <!-- Subscribe Section Start -->\n");
      out.write("        <div class=\"subscribe-section section bg-gray pt-55 pb-55\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row align-items-center\">\n");
      out.write("\n");
      out.write("                    <!-- Mailchimp Subscribe Content Start -->\n");
      out.write("                    <div class=\"col-lg-6 col-12 mb-15 mt-15\">\n");
      out.write("                        <div class=\"subscribe-content\">\n");
      out.write("                            <h2>SUBSCRIBE <span>OUR NEWSLETTER</span></h2>\n");
      out.write("                            <h2><span>TO GET LATEST</span> PRODUCT UPDATE</h2>\n");
      out.write("                        </div>\n");
      out.write("                    </div><!-- Mailchimp Subscribe Content End -->\n");
      out.write("\n");
      out.write("\n");
      out.write("                    <!-- Mailchimp Subscribe Form Start -->\n");
      out.write("                    <div class=\"col-lg-6 col-12 mb-15 mt-15\">\n");
      out.write("\n");
      out.write("                        <form class=\"subscribe-form\" action=\"email\" method=\"post\">\n");
      out.write("                            <input type=\"email\" autocomplete=\"off\" name=\"email\" placeholder=\"Enter your email here\" />\n");
      out.write("                            <button >subscribe</button>\n");
      out.write("                        </form>\n");
      out.write("                        <!-- mailchimp-alerts Start -->\n");
      out.write("                        <div class=\"mailchimp-alerts text-centre\">\n");
      out.write("                            <div class=\"mailchimp-submitting\"></div><!-- mailchimp-submitting end -->\n");
      out.write("                            <div class=\"mailchimp-success\"></div><!-- mailchimp-success end -->\n");
      out.write("                            <div class=\"mailchimp-error\"></div><!-- mailchimp-error end -->\n");
      out.write("                        </div><!-- mailchimp-alerts end -->\n");
      out.write("\n");
      out.write("                    </div><!-- Mailchimp Subscribe Form End -->\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div><!-- Subscribe Section End -->\n");
      out.write("        <!-- Footer Section Start -->\n");
      out.write("        <div class=\"footer-section section bg-ivory\">\n");
      out.write("\n");
      out.write("            <!-- Footer Top Section Start -->\n");
      out.write("            <div class=\"footer-top-section section pt-90 pb-50\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("\n");
      out.write("                    <div class=\"row\">\n");
      out.write("\n");
      out.write("                        <!-- Footer Widget Start -->\n");
      out.write("                        <div class=\"col-lg-3 col-md-6 col-12 mb-40\">\n");
      out.write("                            <div class=\"footer-widget\">\n");
      out.write("\n");
      out.write("                                <h4 class=\"widget-title\">CONTACT INFO</h4>\n");
      out.write("\n");
      out.write("                                <p class=\"contact-info\">\n");
      out.write("                                    <span>Address</span>\n");
      out.write("                                    FU-Hoa Lac <br>\n");
      out.write("                                </p>\n");
      out.write("\n");
      out.write("                                <p class=\"contact-info\">\n");
      out.write("                                    <span>Phone</span>\n");
      out.write("                                    <a href=\"tel:01234567890\">01234 567 890</a>\n");
      out.write("                                    <a href=\"tel:01234567891\">01234 567 891</a>\n");
      out.write("                                </p>\n");
      out.write("\n");
      out.write("                                <p class=\"contact-info\">\n");
      out.write("                                    <span>Web</span>\n");
      out.write("                                    <a href=\"#\">tungndhe141593@fpt.edu.com</a>\n");
      out.write("                                    <a href=\"home\">www.e&e.com</a>\n");
      out.write("                                </p>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div><!-- Footer Widget End -->\n");
      out.write("\n");
      out.write("                        <!-- Footer Widget Start -->\n");
      out.write("                        <div class=\"col-lg-3 col-md-6 col-12 mb-40\">\n");
      out.write("                            <div class=\"footer-widget\">\n");
      out.write("\n");
      out.write("                                <h4 class=\"widget-title\">CUSTOMER CARE</h4>\n");
      out.write("\n");
      out.write("                                <ul class=\"link-widget\">\n");
      out.write("                                    <li><a href=\"about-us.jsp\">About us</a></li>\n");
      out.write("                                    <li><a href=\"manageAccount\">My Account</a></li>\n");
      out.write("                                    <li><a href=\"blog.jsp\">blog</a></li>\n");
      out.write("                                    <li><a href=\"contact.jsp\">Contact</a></li>\n");
      out.write("                                </ul>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div><!-- Footer Widget End -->\n");
      out.write("\n");
      out.write("                        <!-- Footer Widget Start -->\n");
      out.write("                        <div class=\"col-lg-3 col-md-6 col-12 mb-40\">\n");
      out.write("                            <div class=\"footer-widget\">\n");
      out.write("\n");
      out.write("                                <h4 class=\"widget-title\">INFORMATION</h4>\n");
      out.write("\n");
      out.write("                                <ul class=\"link-widget\">\n");
      out.write("                                    <li><a href=\"track-order.jsp\">Track your order</a></li>\n");
      out.write("                                    <li><a href=\"locale-store.jsp\">Locate Store</a></li>\n");
      out.write("                                    <li><a href=\"term-conditions\">Terms & Conditions</a></li>\n");
      out.write("                                    <li><a href=\"#\">Special coupon</a></li>\n");
      out.write("                                </ul>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div><!-- Footer Widget End -->\n");
      out.write("\n");
      out.write("                        <!-- Footer Widget Start -->\n");
      out.write("                        <div class=\"col-lg-3 col-md-6 col-12 mb-40\">\n");
      out.write("                            <div class=\"footer-widget\">\n");
      out.write("\n");
      out.write("                                <h4 class=\"widget-title\">LATEST TWEET</h4>\n");
      out.write("\n");
      out.write("                                <div class=\"footer-tweet\"></div>\n");
      out.write("\n");
      out.write("                            </div>\n");
      out.write("                        </div><!-- Footer Widget End -->\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div><!-- Footer Bottom Section Start -->\n");
      out.write("\n");
      out.write("            <!-- Footer Bottom Section Start -->\n");
      out.write("            <div class=\"footer-bottom-section section\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("\n");
      out.write("                        <!-- Footer Copyright -->\n");
      out.write("                        <div class=\"col-lg-6 col-12\">\n");
      out.write("                            <div class=\"footer-copyright\"><p>&copy; Copyright, 2018 All Rights Reserved by <a href=\"https://freethemescloud.com/\">Free themes Cloud</a></p></div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                        <!-- Footer Payment Support -->\n");
      out.write("                        <div class=\"col-lg-6 col-12\">\n");
      out.write("                            <div class=\"footer-payments-image\"><img src=\"assets/images/payment-support.png\" alt=\"Payment Support Image\"></div>\n");
      out.write("                        </div>\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div><!-- Footer Bottom Section Start -->\n");
      out.write("\n");
      out.write("        </div><!-- Footer Section End -->\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
