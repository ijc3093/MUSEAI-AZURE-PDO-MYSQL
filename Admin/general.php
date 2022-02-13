<?php
    //var_dump($_GET);

    include('head.php');

   // var_dump($_SESSION);
    
    // $_SESSION = array(); // destroy all session data
    // session_destroy(); // compelte erase session
    include('Controller.php');
    $db = new Controller();

  //delete data from museai
    if(isset($_GET['deleteAttendingmuseai'])){
        $db->Delete("attendee_museai", $_GET['id'], "museai");
    }

  //delete data from session
    if(isset($_GET['deleteAttendingSession'])){
        $db->Delete("attendee_session", $_GET['id'], "session");
    }

  //delete museai
    if(isset($_GET['deletemuseai'])){
        $db->admin_Delete("museai", $_GET['id'], "idmuseai");
        $db->admin_Delete("session", $_GET['id'], "museai");

        // echo "<script>alert('Delete from museai ');</script>";
    }


  //delete venue
    if(isset($_GET['deleteVenue']) && ($_GET['id']) == 1){
        $db->admin_Delete("venue", $_GET['id'], "idvenue");
        $db->admin_Delete("museai", $_GET['id'], "venue");
    }


    //delete session
    if(isset($_GET['deleteSession'])){
        //var_dump($_GET);
        $db->admin_Delete("session", $_GET['id'], "idsession");
    }

    //attending museai
    if(isset($_GET['attendmuseai'])){
        $db->attending_museai($_GET['id'], $_SESSION['username']);
    }

    //attending session
    if(isset($_GET['attendSession'])){
        $db->attending_Session($_GET['id'], $_SESSION['username']);
    }

    //logout button
    if(isset($_GET['logout'])){
        logout();
    }

    //destory the admin to the login local
    function logout(){
        //$_SESSION = array(); // destroy all venue data
        session_destroy(); // compelte erase venue
        header("location: login.php");
        exit();
    }
?>

<!-- Head -->
<?php 
    include('../includes/header.php');
?>
<div class="wrapper">
    <div class="container">

        <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <!-- <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">General Table</h6>
        </div> -->
        <div class="table table-striped table-dark">
            <div>
                <table id="example" class="table table-striped table-bordered" style="width:100%">
                    <section class="text-center">
                        <div class="container">
                            <h1 class="jumbotron-heading">Museai</h1>
                            <!-- <p>This is a self-guided tour platform developed to provide an app with accessibility in different museums. It will provide full access to information about each artwork, including descriptions, historical facts, media (video/audio) with captions, audio descriptions and more.

                            The curator will have the ability to store and edit images, videos, transcripts and exhibition information through a web portal and provide access via a smartphone app.</p> -->
                            <!-- <p>
                                <a href="#" class="btn btn-primary my-2">Main call to action</a>
                                <a href="#" class="btn btn-secondary my-2">Secondary action</a>
                            </p> -->
                        </div>


                        <div class="album py-5 bg-light">
                            <div class="container">
                                <div class="row">
                                    <!-- <img class='card-img-top mb-5 mb-md-0' src='".$location_image."' controls width='700' height='450' > -->
                                    <?php
                                        $result = $db->get_museais();
                                        foreach($result as $post){
                                            echo'<div class="col-md-4">
                                                <div class="card mb-4 box-shadow">';
                                                    echo'<img alt="museai" class="img-fluid" src="' . $post["location_image"] . '" alt="Card image cap" width="322" height="225">
                                                    <div>
                                                        <h7 class="card-text">' . $post["name"] . '</h7>';
                                                        echo'<div class="d-flex justify-content-between align-items-center">
                                                            <div class="btn-group">';
                                                                echo'
                                                                <a type="button" class="btn btn-info" href="detail.php?id=' . $post["idmuseai"] . '">View</a>';

                                                                if($_SESSION['userRole'] == 4){
                                                                    // echo'
                                                                    //     <a type="button" class="btn btn-sm btn-success" href="edit_museai.php?id=' . $post["idmuseai"] . '">Edit</a>';
                                                                    //     ';
                                                                }
                                                                else{
                                                                    echo'
                                                                    <a type="button" class="btn btn-success" href="edit_museai.php?id=' . $post["idmuseai"] . '">Edit</a>';
                                                                }
                                                                if($_SESSION['userRole'] == 4){
                                                                    // echo'
                                                                    //     <a type="button" class="btn btn-sm btn-danger" href="general.php?deletemuseai=true&id= ' . $post["idmuseai"] . '">Delete</a>';
                                                                    // ';
                                                                }
                                                                else{
                                                                    echo'
                                                                    <a type="button" class="btn btn-danger" href="general.php?deletemuseai=true&id= ' . $post["idmuseai"] . '">Delete</a>';
                                                                }
                                                                
                                                                echo'</div>';
                                                            echo'<small class="btn btn-secondary">' . $post["idmuseai"] . '</small>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>';
                                        }// close get_museais() 
                                    ?>
                                </div>
                            </div>
                        </div>
                    </section>
                    
                </table>
            </div>
        </div>
    </div>
       
        <!-- end container -->
    </div>
    <!-- end wrapper -->
</div>


    </div>

    <!-- Footer -->
<?php 
    include('../includes/footer.php');
?>
