<%@page import="MyEntity.Users"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="MyEntity.Review"%> <%@page import="java.util.List"%> <%@page
    import="com.company.dao.ReviewDao" %> <%@page
        import="com.mycompany.Handler.FactoryProvider" %> <%@page
        contentType="text/html" pageEncoding="UTF-8" %>
            <%
                 Users user = (Users) session.getAttribute("current_user");
                %>
            
                <% String product_Id
                    = request.getParameter("productId");
            ReviewDao rdao = new ReviewDao(FactoryProvider.getFactory());
            String message = (String) session.getAttribute("message");
            double average_rating = 0.0d;
            double total_review
                    = 0;
            double five_star_review = 0;
            double four_star_review = 0;
            double three_star_review = 0;
            double two_star_review = 0;
            double one_star_review = 0;
            double total_user_rating = 0;
            List<Review> review_content
                    = rdao.getReviewByProductId(Integer.parseInt(product_Id.trim()));
            for (Review r
                    : review_content) {
                int rating = r.getRating();
                if (rating == 5) {
                    five_star_review++;
                } else if (rating == 4) {
                    four_star_review++;
                } else if (rating == 3) {
                    three_star_review++;
                } else if (rating == 2) {
                    two_star_review++;
                } else if (rating == 1) {
                    one_star_review++;
                }
                total_review++;
                total_user_rating += rating;
            }
            average_rating = total_review != 0 ? total_user_rating / total_review : 0;%>

            <div class="container">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-4 text-center">
                                <h1 class="text-warning mt-4 mb-4">
                                    <%
                                        final DecimalFormat decfor = new DecimalFormat("0.00");
                                    %>
                                    <b><span id="average_rating"><%= decfor.format(average_rating)%></span> / 5</b>
                                </h1>
                                <div class="mb-3">
                                    <%
                                        for (int i = 1; i <= 5; i++) {
                                            double n = i - 0.5;
                                            if (average_rating >= i) {
                                    %>
                                    <i class="bi bi-star-fill text-warning"></i>
                                    <%
                                    } else if (average_rating >= n) {
                                        //half star
                                    %>
                                    <i class="bi bi-star-half text-warning"></i>
                                    <%
                                    } else if (average_rating < i) {
                                        //empty star
                                    %>
                                    <i class="bi bi-star text-warning"></i>
                                    <%
                                            }
                                        }
                                    %>

                                </div>
                                <h3><span id="total_review"><%= total_review%></span> Review</h3>
                            </div>
                            <div class="col-sm-4">
                                <div class="row mt-2">
                                    <div class="col-2">
                                        <b>5</b> <i class="fas fa-star text-warning"></i>
                                    </div>
                                    <div class="progress col-8">
                                        <div class="progress-bar bg-warning" id="five_star_progress" role="progressbar" style="width: <%= five_star_review / total_review * 100%>%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <div class="col-2">
                                        (<span id="total_five_star_review"><%= five_star_review%></span
                                        >)
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-2">
                                        <b>4</b> <i class="fas fa-star text-warning"></i>
                                    </div>

                                    <div class="progress col-8">
                                        <div
                                            class="progress-bar bg-warning"
                                            style="width: <%= four_star_review / total_review * 100%>%" 
                                            role="progressbar"
                                            aria-valuenow="0"
                                            aria-valuemin="0"
                                            aria-valuemax="100"
                                            id="four_star_progress"
                                            ></div>
                                    </div>
                                    <div class="col-2">
                                        (<span id="total_four_star_review"><%= four_star_review%></span
                                        >)
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-2">
                                        <b>3</b> <i class="fas fa-star text-warning"></i>
                                    </div>

                                    <div class="progress col-8">
                                        <div
                                            class="progress-bar bg-warning"
                                            role="progressbar"
                                            style="width: <%= three_star_review / total_review * 100%>%" 
                                            aria-valuenow="0"
                                            aria-valuemin="0"
                                            aria-valuemax="100"
                                            id="three_star_progress"
                                            ></div>
                                    </div>
                                    <div class="col-2">
                                        (<span id="total_three_star_review"
                                               ><%= three_star_review%></span
                                        >)
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-2">
                                        <b>2</b> <i class="fas fa-star text-warning"></i>
                                    </div>

                                    <div class="progress col-8">
                                        <div
                                            class="progress-bar bg-warning"
                                            role="progressbar"
                                            style="width: <%= two_star_review / total_review * 100%>%" 
                                            aria-valuenow="0"
                                            aria-valuemin="0"
                                            aria-valuemax="100"
                                            id="two_star_progress"
                                            ></div>
                                    </div>
                                    <div class="col-2">
                                        (<span id="total_two_star_review"><%= two_star_review%></span>)
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-2">
                                        <b>1</b> <i class="fas fa-star text-warning"></i>
                                    </div>

                                    <div class="progress col-8">
                                        <div
                                            class="progress-bar bg-warning"
                                            role="progressbar"
                                            style="width: <%= one_star_review / total_review * 100%>%" 
                                            aria-valuenow="0"
                                            aria-valuemin="0"
                                            aria-valuemax="100"
                                            id="one_star_progress"
                                            ></div>
                                    </div>
                                    <div class="col-2">
                                        (<span id="total_one_star_review"><%= one_star_review%></span>)
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-4 text-center">
                                <h3 class="mt-4 mb-3">Write Review Here</h3>
                                
                                <button
                                    type="button"
                                    name="add_review"
                                    id="add_review"
                                    class="btn btn-primary"
                                    >
                                    Review
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mt-5" id="review_content"></div>
            </div>

                
            <div id="review_modal" class="modal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Submit Review</h5>
                            <button
                                type="button"
                                class="close"
                                data-dismiss="modal"
                                aria-label="Close"
                                >
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <h4 class="text-center mt-2 mb-4">
                                <i
                                    class="fas fa-star star-light submit_star mr-1"
                                    id="submit_star_1"
                                    data-rating="1"
                                    ></i>
                                <i
                                    class="fas fa-star star-light submit_star mr-1"
                                    id="submit_star_2"
                                    data-rating="2"
                                    ></i>
                                <i
                                    class="fas fa-star star-light submit_star mr-1"
                                    id="submit_star_3"
                                    data-rating="3"
                                    ></i>
                                <i
                                    class="fas fa-star star-light submit_star mr-1"
                                    id="submit_star_4"
                                    data-rating="4"
                                    ></i>
                                <i
                                    class="fas fa-star star-light submit_star mr-1"
                                    id="submit_star_5"
                                    data-rating="5"
                                    ></i>
                            </h4>
                            <div class="form-group">
                                <input
                                    type="text"
                                    name="user_name"
                                    id="user_name"
                                    class="form-control mt-2"
                                    placeholder="Enter Your Name"
                                    
                                    />
                            </div>
                            <div class="form-group">
                                <textarea
                                    name="user_review"
                                    id="user_review"
                                    class="form-control mt-2"
                                    placeholder="Type Review Here"
                                    ></textarea>
                            </div>
                            <div class="form-group text-center mt-4">
                                <button type="button" class="btn btn-primary" id="save_review">
                                    Submit
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          
                
            <% if (total_review == 0) { %>
            <div class="container d-flex justify-content-center text-center text-danger">
                NO REVIEWS YET
            </div>
            <% } else { %>
            <div class="container">
                <% for (Review r : review_content) {%>
                <div class="row mb-4">
                    <div class="col-1">
                        <div
                            style="
                            background-color: rgb(
                            <%= (int) (Math.random() * 255 + 1)%>,
                            <%= (int) (Math.random() * 255 + 1)%>,
                            <%= (int) (Math.random() * 255 + 1)%>
                            );
                            "
                            class="circlePP text-center"
                            >
                            <%= r.getUser_name().substring(0, 2)%>
                        </div>
                    </div>
                    <div class="col-11">
                        <div class="card">
                            <div class="card-header"><%= r.getUser_name()%></div>
                            <div class="card-body">
                                <div>
                                    <% for (int i = 1; i <= 5; i++) {
                                            if (r.getRating() >= i) { %>
                                    <i class="bi bi-star-fill text-warning"></i>
                                    <% } else { %>
                                    <i class="bi bi-star text-warning"></i>
                                    <% }
                                        }%>
                                </div>
                                <div><%= r.getReview_text()%></div>
                            </div>

                            <div class="card-footer d-flex justify-content-end">
                                <%= r.getReview_date()%>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
            <% }%>

            <script>
                var rating_data = 0;
                $("#add_review").click(function () {
                    $("#review_modal").modal("show");
                });

                $(document).on("mouseenter", ".submit_star", function () {
                    var rating = $(this).data("rating");

                    reset_background();

                    for (var count = 1; count <= rating; count++) {
                        $("#submit_star_" + count).addClass("text-warning");
                    }
                });

                function reset_background() {
                    for (var count = 1; count <= 5; count++) {
                        $("#submit_star_" + count).addClass("star-light");

                        $("#submit_star_" + count).removeClass("text-warning");
                    }
                }

                $(document).on("mouseleave", ".submit_star", function () {
                    reset_background();

                    for (var count = 1; count <= rating_data; count++) {
                        $("#submit_star_" + count).removeClass("star-light");

                        $("#submit_star_" + count).addClass("text-warning");
                    }
                });

                $(document).on("click", ".submit_star", function () {
                    rating_data = $(this).data("rating");
                });


                $("#save_review").click(function () {
                    var user_name = $("#user_name").val();

                    var user_review = $("#user_review").val();

                    if (user_name == "" || user_review == "") {
                        alert("Please Fill Both Field");
                        return false;
                    } else {
                        let data = {
                            rating_data: rating_data,
                            user_name: user_name,
                            user_review: user_review,
                            product_id: <%= product_Id%>
                        };
                        $.post("SubmitReview", data,
                                function (responseText, textStatus, jqXHR) {
                                    $("#review_modal").modal("hide");
                                    load_rating_data();
                                    alert(<%= message%>);
                                }
                        );

                    }
                });
            </script>
        </Review>
