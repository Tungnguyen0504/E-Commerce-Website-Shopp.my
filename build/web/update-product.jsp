<%-- 
    Document   : admin
    Created on : Oct 1, 2021, 9:24:46 AM
    Author     : tungn
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- CSS only -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.min.css" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/ee3bc02316.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap5.min.css" />
        <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
        <link href="assets/css/admin.css" rel="stylesheet" type="text/css"/>
        <title>Frontendfunn - Bootstrap 5 Admin Dashboard Template</title>
    </head>
    <body>
        <jsp:useBean scope="page" id="d" class="dao.AllDao"/>

        <jsp:include page="generalJsp/admin-header-sidebar.jsp" />

        <main class="mt-5 pt-4" id="home-section">
            <div class="container-fluid" style="margin-bottom: 10px;">
                <jsp:include page="generalJsp/admin-card.jsp" />
                <div style="padding: 0 25px; margin-bottom: 10px;">
                    <div class="row gutters">
                        <div class="col-xl col-lg col-md-12 col-sm-12 col-12">
                            <div class="card h-100">
                                <form action="manageProduct?action=updateProduct" method="post">
                                    <div class="card-body">
                                        <div class="row gutters">
                                            <div class="card-header" style="padding: 1.1rem 3rem; margin-bottom: 30px;">
                                                <span><i class="bi bi-table me-2"></i></span> Manage <strong>Product</strong>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group ">
                                                    <span class="input-group-text" id="basic-addon1">Product Name</span>
                                                    <input type="text" name="productName" class="form-control" value="${pro.productName}" placeholder="Enter Product Name ..." required>
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">Tittle</span>
                                                    <input type="text" name="tittle" class="form-control" value="${pro.tittle}" placeholder="Enter Tittle ..." required>
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group">
                                                    <span class="input-group-text">Description</span>
                                                    <textarea class="form-control" name="des" aria-label="With textarea" placeholder="use '|' to break a paragraph ..." required>${pro.description}</textarea>
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group mb-3">
                                                    <span class="input-group-text" id="basic-addon1">Quantity</span>
                                                    <input type="text" name="quantity" min="0" class="form-control" value="${pro.PQuantity}" placeholder="Enter Quantity ..." required>
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">Color</span>
                                                    <input type="text" name="color" class="form-control" value="${pro.color}" placeholder="Enter Color ..." required>
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">Brand</span>
                                                    <input type="text" name="brand" class="form-control" value="${pro.brand}" placeholder="Enter Brand ..." required>
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">Price</span>
                                                    <input type="text" name="price" min="0" class="form-control" value="${pro.price}" placeholder="Enter Price ..." required>
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group">
                                                    <span class="input-group-text" id="basic-addon1">Discount Percent</span>
                                                    <input type="text" name="percent" min="0" class="form-control" value="${pro.discountPercent}" placeholder="Enter Discount Percent ..." required>
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="input-group">
                                                    <select class="form-select" aria-label="Default select example" required>
                                                        <option selected disabled>Open this select category</option>
                                                        <c:forEach items="${d.getCategory()}" var="o">
                                                            <option ${o.categoryID == pro.categoryID?"selected":""} value="${o.categoryID}">${o.categoryName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <input type="hidden" name="pid" value="${pro.productID}">
                                                <input type="hidden" name="cid" value="${pro.categoryID}">
                                            </div>

                                            <!--image-->
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group label-image">
                                                    <input id="image1" name="image1" value="${pro.image1}" type="file" class="file" data-show-caption="true"
                                                           data-show-upload="false" data-show-remove="false" data-msg-placeholder="Upload for image 1 ...">
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group label-image">
                                                    <input id="image2" name="image2" value="${pro.image2}" type="file" class="file" data-show-caption="true"
                                                           data-show-upload="false" data-show-remove="false" data-msg-placeholder="Upload for image 2 ...">
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group label-image">
                                                    <input id="image3" name="image3" value="${pro.image3}" type="file" class="file" data-show-caption="true"
                                                           data-show-upload="false" data-show-remove="false" data-msg-placeholder="Upload for image 3 ...">
                                                </div>
                                            </div>
                                            <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group label-image">
                                                    <input id="image4" name="image4" value="${pro.image4}" type="file" class="file" data-show-caption="true"
                                                           data-show-upload="false" data-show-remove="false" data-msg-placeholder="Upload for image 4 ...">
                                                </div>
                                            </div>
                                            <!--end image-->

                                        </div>
                                        <div class="row gutters">
                                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ps-auto">
                                                <div class="text-right" style="float: right; margin-right: 38px">
                                                    <div class="btn btn-warning" id="feedback-down">Next<i class="bi bi-caret-right-square-fill ms-3"></i></div>
                                                </div>
                                            </div>

                                            <c:if test="${pro.categoryID == 1}">
                                                <div class="row gutters" id="feedback-form" style="transition: unset;">
                                                    <div class="col-12">
                                                        <h3 style="text-decoration: underline; margin-bottom: 25px; padding-left: 40px;">Laptop Detail</h3>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group ">
                                                            <span class="input-group-text" id="basic-addon1">Memory Size</span>
                                                            <input type="text" name="p1" value="${lap.memorySize}" class="form-control" placeholder="Enter Size ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">CPU Model</span>
                                                            <input type="text" name="p2" value="${lap.cpuModel}" class="form-control" placeholder="Enter CPU Model ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">CPU Speed</span>
                                                            <input type="text" name="p3" value="${lap.cpuSpeed}" class="form-control" placeholder="Enter CPU Speed ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group mb-3">
                                                            <span class="input-group-text" id="basic-addon1">Display Resolution</span>
                                                            <input type="text" name="p4" value="${lap.displayR}" class="form-control" placeholder="Enter Display Resolution ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Screen Size</span>
                                                            <input type="text" name="p5" value="${lap.screenSize}" class="form-control" placeholder="Enter Screen Size ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Item Weight</span>
                                                            <input type="text" name="p6" value="${lap.itemWeight}" class="form-control" placeholder="Enter Item Weight ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Graphic Coprocessor</span>
                                                            <input type="text" name="p7" value="${lap.graphic}" class="form-control" placeholder="Enter Graphic Coprocessor ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Operating System</span>
                                                            <input type="text" name="p8" value="${lap.os}" class="form-control" placeholder="Enter Operating System ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Ram Type</span>
                                                            <input type="text" name="p9" value="${lap.ramType}" class="form-control" placeholder="Enter Ram Type ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ps-auto">
                                                        <div class="text-right" style="float: right; margin-right: 38px">
                                                            <a href="manageProduct?cid=1" class="btn btn-secondary">Cancel</a>
                                                            <input type="submit" class="btn btn-primary" value="Update Product">
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>

                                            <c:if test="${pro.categoryID == 2}">
                                                <div class="row gutters" id="feedback-form" style="transition: unset;">
                                                    <div class="col-12">
                                                        <h3 style="text-decoration: underline; margin-bottom: 25px; padding-left: 40px;">Smartphone Detail</h3>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group ">
                                                            <span class="input-group-text" id="basic-addon1">Screen</span>
                                                            <input type="text" name="p1" value="${sp.screen}" class="form-control" placeholder="Enter Screen ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Operating System</span>
                                                            <input type="text" name="p2" value="${sp.OS}" class="form-control" placeholder="Enter Operating System ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Rear Camera</span>
                                                            <input type="text" name="p3" value="${sp.rearCam}" class="form-control" placeholder="Enter Rear Camera ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group mb-3">
                                                            <span class="input-group-text" id="basic-addon1">Front Camera</span>
                                                            <input type="text" name="p4" value="${sp.frontCam}" class="form-control" placeholder="Enter Front Camera ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">CPU</span>
                                                            <input type="text" name="p5" value="${sp.cpu}" class="form-control" placeholder="Enter CPU ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">RAM</span>
                                                            <input type="text" name="p6" value="${sp.ram}" class="form-control" placeholder="Enter RAM ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Internal Memory</span>
                                                            <input type="text" name="p7" value="${sp.IMemory}" class="form-control" placeholder="Enter Internal Memory ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Type Sim</span>
                                                            <input type="text" name="p8" value="${sp.sim}" class="form-control" placeholder="Enter Type Sim ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Battery</span>
                                                            <input type="text" name="p9" value="${sp.battery}" class="form-control" placeholder="Enter Battery ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ps-auto">
                                                        <div class="text-right" style="float: right; margin-right: 38px">
                                                            <a href="manageProduct?cid=1" class="btn btn-secondary">Cancel</a>
                                                            <input type="submit" class="btn btn-primary" value="Update Product">
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <c:if test="${pro.categoryID == 3}">
                                                <div class="row gutters" id="feedback-form" style="transition: unset;">
                                                    <div class="col-12">
                                                        <h3 style="text-decoration: underline; margin-bottom: 25px; padding-left: 40px;">Camera Detail</h3>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group ">
                                                            <span class="input-group-text" id="basic-addon1">Model Number</span>
                                                            <input type="text" name="p1" value="${cam.modelNum}" class="form-control" placeholder="Enter Model Number ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Eye AF</span>
                                                            <input type="text" name="p2" value="${cam.eyeAF}" class="form-control" placeholder="Enter Eye AF ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Image Sensor Type</span>
                                                            <input type="text" name="p3" value="${cam.imageType}" class="form-control" placeholder="Enter Image Sensor Type ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group mb-3">
                                                            <span class="input-group-text" id="basic-addon1">Image Sensor Size</span>
                                                            <input type="text" name="p4" value="${cam.imageSize}" class="form-control" placeholder="Enter Image Sensor Size ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Max Focal Length</span>
                                                            <input type="text" name="p5" value="${cam.maxFocal}" class="form-control" placeholder="Enter Max Focal Length ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Min Focal Length</span>
                                                            <input type="text" name="p6" value="${cam.minFocal}" class="form-control" placeholder="Enter Min Focal Length ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Max Aperture</span>
                                                            <input type="text" name="p7" value="${cam.maxAperture}" class="form-control" placeholder="Enter Max Aperture ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Effective Pixels</span>
                                                            <input type="text" name="p8" value="${cam.effecPixel}" class="form-control" placeholder="Enter Effective Pixels ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="form-action col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                        <div class="input-group">
                                                            <span class="input-group-text" id="basic-addon1">Wifi Enabled</span>
                                                            <input type="text" name="p9" value="${cam.wifiEnabled}" class="form-control" placeholder="Enter Wifi Enabled ..." required>
                                                        </div>
                                                    </div>
                                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ps-auto">
                                                        <div class="text-right" style="float: right; margin-right: 38px">
                                                            <a href="manageProduct?cid=1" class="btn btn-secondary">Cancel</a>
                                                            <input type="submit" class="btn btn-primary" value="Update Product">
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="generalJsp/admin-footer.jsp" />
        </main>
        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script>
            $(document).ready(function () {
                $("#image1").fileinput({
                    allowedFileExtensions: ["jpg", "png", "gif"],
                    initialPreview: 'assets/images/products/${pro.image1}',
                    initialPreviewAsData: true,
                    initialCaption: '${pro.image1}'
                });
                $("#image2").fileinput({
                    allowedFileExtensions: ["jpg", "png", "gif"],
                    initialPreview: 'assets/images/products/${pro.image2}',
                    initialPreviewAsData: true,
                    initialCaption: '${pro.image2}'
                });
                $("#image3").fileinput({
                    allowedFileExtensions: ["jpg", "png", "gif"],
                    initialPreview: 'assets/images/products/${pro.image3}',
                    initialPreviewAsData: true,
                    initialCaption: '${pro.image3}'
                });
                $("#image4").fileinput({
                    allowedFileExtensions: ["jpg", "png", "gif"],
                    initialPreview: 'assets/images/products/${pro.image4}',
                    initialPreviewAsData: true,
                    initialCaption: '${pro.image4}'
                });
            });

            $(document).ready(function () {
                $("#feedback-down").click(function () {
                    $("#feedback-form").slideToggle("slow");
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/js/fileinput.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.2/dist/chart.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap5.min.js"></script>
        <script src="assets/js/admin.js" type="text/javascript"></script>
    </body>
</html>
