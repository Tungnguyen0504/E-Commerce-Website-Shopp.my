package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class newjsp_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\"/>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <footer id=\"contact\" class=\"footer action-lage bg-black p-top-80\">\n");
      out.write("            <!--<div class=\"action-lage\"></div>-->\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"widget_area\">\n");
      out.write("                        <div class=\"col-md-3\">\n");
      out.write("                            <div class=\"widget_item widget_about\">\n");
      out.write("                                <h5 class=\"text-white\">About Us</h5>\n");
      out.write("                                <p class=\"m-top-20\">Lorem ipsum dolor sit amet consec tetur adipiscing elit \n");
      out.write("                                    nulla aliquet pretium nisi in cursus \n");
      out.write("                                    maecenas nec eleifen.</p>\n");
      out.write("                                <div class=\"widget_ab_item m-top-30\">\n");
      out.write("                                    <div class=\"item_icon\"><i class=\"fa fa-location-arrow\"></i></div>\n");
      out.write("                                    <div class=\"widget_ab_item_text\">\n");
      out.write("                                        <h6 class=\"text-white\">Location</h6>\n");
      out.write("                                        <p>\n");
      out.write("                                            123 suscipit ipsum nam auctor\n");
      out.write("                                            mauris dui, ac sollicitudin mauris,\n");
      out.write("                                            Bandung</p>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"widget_ab_item m-top-30\">\n");
      out.write("                                    <div class=\"item_icon\"><i class=\"fa fa-phone\"></i></div>\n");
      out.write("                                    <div class=\"widget_ab_item_text\">\n");
      out.write("                                        <h6 class=\"text-white\">Phone :</h6>\n");
      out.write("                                        <p>+1 2345 6789</p>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"widget_ab_item m-top-30\">\n");
      out.write("                                    <div class=\"item_icon\"><i class=\"fa fa-envelope-o\"></i></div>\n");
      out.write("                                    <div class=\"widget_ab_item_text\">\n");
      out.write("                                        <h6 class=\"text-white\">Email Address :</h6>\n");
      out.write("                                        <p>youremail@mail.com</p>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div><!-- End off widget item -->\n");
      out.write("                        </div><!-- End off col-md-3 -->\n");
      out.write("\n");
      out.write("                        <div class=\"col-md-3\">\n");
      out.write("                            <div class=\"widget_item widget_latest sm-m-top-50\">\n");
      out.write("                                <h5 class=\"text-white\">Latest News</h5>\n");
      out.write("                                <div class=\"widget_latst_item m-top-30\">\n");
      out.write("                                    <div class=\"item_icon\"><img src=\"assets/images/ltst-img-1.jpg\" alt=\"\" /></div>\n");
      out.write("                                    <div class=\"widget_latst_item_text\">\n");
      out.write("                                        <p>Lorem ipsum dolor sit amet, consectetur</p>\n");
      out.write("                                        <a href=\"\">21<sup>th</sup> July 2016</a>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"widget_latst_item m-top-30\">\n");
      out.write("                                    <div class=\"item_icon\"><img src=\"assets/images/ltst-img-2.jpg\" alt=\"\" /></div>\n");
      out.write("                                    <div class=\"widget_latst_item_text\">\n");
      out.write("                                        <p>Lorem ipsum dolor sit amet, consectetur</p>\n");
      out.write("                                        <a href=\"\">21<sup>th</sup> July 2016</a>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"widget_latst_item m-top-30\">\n");
      out.write("                                    <div class=\"item_icon\"><img src=\"assets/images/ltst-img-3.jpg\" alt=\"\" /></div>\n");
      out.write("                                    <div class=\"widget_latst_item_text\">\n");
      out.write("                                        <p>Lorem ipsum dolor sit amet, consectetur</p>\n");
      out.write("                                        <a href=\"\">21<sup>th</sup> July 2016</a>\n");
      out.write("                                    </div>\n");
      out.write("                                </div>\n");
      out.write("                            </div><!-- End off widget item -->\n");
      out.write("                        </div><!-- End off col-md-3 -->\n");
      out.write("\n");
      out.write("                        <div class=\"col-md-3\">\n");
      out.write("                            <div class=\"widget_item widget_service sm-m-top-50\">\n");
      out.write("                                <h5 class=\"text-white\">Latest News</h5>\n");
      out.write("                                <ul class=\"m-top-20\">\n");
      out.write("                                    <li class=\"m-top-20\"><a href=\"\"><i class=\"fa fa-angle-right\"></i> Web Design</a></li>\n");
      out.write("                                    <li class=\"m-top-20\"><a href=\"\"><i class=\"fa fa-angle-right\"></i> User Interface Design</a></li>\n");
      out.write("                                    <li class=\"m-top-20\"><a href=\"\"><i class=\"fa fa-angle-right\"></i> E- Commerce</a></li>\n");
      out.write("                                    <li class=\"m-top-20\"><a href=\"\"><i class=\"fa fa-angle-right\"></i> Web Hosting</a></li>\n");
      out.write("                                    <li class=\"m-top-20\"><a href=\"\"><i class=\"fa fa-angle-right\"></i> Themes</a></li>\n");
      out.write("                                    <li class=\"m-top-20\"><a href=\"\"><i class=\"fa fa-angle-right\"></i> Support Forums</a></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div><!-- End off widget item -->\n");
      out.write("                        </div><!-- End off col-md-3 -->\n");
      out.write("\n");
      out.write("                        <div class=\"col-md-3\">\n");
      out.write("                            <div class=\"widget_item widget_newsletter sm-m-top-50\">\n");
      out.write("                                <h5 class=\"text-white\">Newsletter</h5>\n");
      out.write("                                <form class=\"form-inline m-top-30\">\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <input type=\"email\" class=\"form-control\" placeholder=\"Enter you Email\">\n");
      out.write("                                        <button type=\"submit\" class=\"btn text-center\"><i class=\"fa fa-arrow-right\"></i></button>\n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("                                </form>\n");
      out.write("                                <div class=\"widget_brand m-top-40\">\n");
      out.write("                                    <a href=\"\" class=\"text-uppercase\">Your Logo</a>\n");
      out.write("                                    <p>Lorem ipsum dolor sit amet consec tetur \n");
      out.write("                                        adipiscing elit nulla aliquet pretium nisi in</p>\n");
      out.write("                                </div>\n");
      out.write("                                <ul class=\"list-inline m-top-20\">\n");
      out.write("                                    <li>-  <a href=\"\"><i class=\"fa fa-facebook\"></i></a></li>\n");
      out.write("                                    <li><a href=\"\"><i class=\"fa fa-twitter\"></i></a></li>\n");
      out.write("                                    <li><a href=\"\"><i class=\"fa fa-linkedin\"></i></a></li>\n");
      out.write("                                    <li><a href=\"\"><i class=\"fa fa-google-plus\"></i></a></li>\n");
      out.write("                                    <li><a href=\"\"><i class=\"fa fa-behance\"></i></a></li>\n");
      out.write("                                    <li><a href=\"\"><i class=\"fa fa-dribbble\"></i></a>  - </li>\n");
      out.write("                                </ul>\n");
      out.write("\n");
      out.write("                            </div><!-- End off widget item -->\n");
      out.write("                        </div><!-- End off col-md-3 -->\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"main_footer fix bg-mega text-center p-top-40 p-bottom-30 m-top-80\">\n");
      out.write("                <div class=\"col-md-12\">\n");
      out.write("                    <p class=\"wow fadeInRight\" data-wow-duration=\"1s\">\n");
      out.write("                        Made with \n");
      out.write("                        <i class=\"fa fa-heart\"></i>\n");
      out.write("                        by \n");
      out.write("                        <a target=\"_blank\" href=\"https://bootstrapthemes.co\">Bootstrap Themes</a> \n");
      out.write("                        2016. All Rights Reserved\n");
      out.write("                    </p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </footer>\n");
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
