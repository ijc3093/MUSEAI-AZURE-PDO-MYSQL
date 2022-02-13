<?php
    include('Controller.php');
    $db = new Controller();
?>


<!-- Head -->
<?php 
    include('../includes/header-detail.php');
?>

<div id="main-content" class="blog-page">
        <div class="container">
            <div class="row clearfix">
                <div class="col-lg-8 col-md-12 left-box">
                    <div class="card single_post">
                        <div class="body">
                            <div class="img-post">
                                <?php
                                    $video = $db->get_museais($_GET['id'])[0];
                                    $location = $video["location_video"];
                                    echo "<div >"; 
                                    //echo "<iframe class='d-block img-fluid' src='https://www.youtube.com/embed/".$location."' controls width='800' height='450'></iframe>";
                                    echo "<iframe class='d-block img-fluid' src='https://player.vimeo.com/video/".$location."' controls width='800' height='500'></iframe>";
                                    echo "</div>";
                                ?>
                            </div>
                            <h3>
                                <?php
                                    $name = $db->get_museais($_GET['id'])[0];
                                    $name = $name["name"];
                                    echo "<div >";
                                    echo "<h3>".$name."</h3>";
                                    echo "</div>";
                                ?>
                            </h3>
                            <p>
                                <?php
                                    $description = $db->get_museais($_GET['id'])[0];
                                    $description = $description["description"];
                                    echo "<div >";
                                    echo "<p>".$description."</p>";
                                    echo "</div>";
                                ?>
                            </p>
                        </div>                   
                    </div>
                </div>
                <div class="col-lg-4 col-md-12 right-box">
                    <div class="card">
                        <!-- Name -->
                        <?php
                            echo "<div class='header'>
                            <h1>".$name."</h1>                        
                            </div>";
                        ?>
                            
                        <div class="body widget popular-post">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="single_post">
                                        <span>
                                            <?php
                                                $date_time = $db->get_museais($_GET['id'])[0];
                                                $date = $date_time["datepost"];
                                                $time = $date_time["time"];
                                                echo "<span>".$date.", ".$time."</span>";
                                            ?>
                                        </span>
                                    </div>

                                    <div class="img-post"> 
                                        <?php
                                            $image = $db->get_museais($_GET['id'])[0];
                                            $location_image = $image["location_image"];
                                            echo "<div>";
                                            echo "<img src='".$location_image."' controls width='280' height='280' >";
                                            echo "</div>";
                                        ?>                                         
                                    </div>


                                    <div class="single_post">
                                        <!-- <p class="m-b-0">new things, more pictures, more information</p> -->
                                        <div class="img-post">
                                            <?php

                                                $yesterday = $db->get_museais($_GET['id'])[0];
                                                $qrCodeurl = 'https://museai.azurewebsites.net/Museai/Admin/detail.php?id='.$yesterday['idmuseai'];
                                                //echo "<p>".$qrCodeurl."</p>";

                                                include('phpqrcode/qrlib.php');
                                                $text = $qrCodeurl;
                                                $path = 'qrCodeImg/';
                                                $file = $path.uniqid().".png";

                                                $ecc = 'L';
                                                $pixel_Size = 10;
                                                $frame_Size = 10;

                                                QRcode::png($text, $file, $ecc, $pixel_Size, $frame_Size);
                                                echo "<div>";
                                                echo "<img src='".$file."' controls width='280' height='280' >";
                                                echo "</div>";

                                                // insert 
                                                $query="insert into qr(pname, qrImage) values ('$pname', '$file')";
                                                if(true){
                                                    //Date and Time
                                                    $date_post = date("Y-m-d");
                                                    $time_post = date("h:i:sa");
                                                    $result = $db->insert_qrCode($date_post, $file);
                                                }
                                            ?>                                        
                                        </div>       
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="share-btn-container">
                            <a href="#" color="gplus" class="social-share-url gmail">
                            <i class="fab fa-google-plus"></i>
                            </a>

                            <a href="#" class="social-share-url facebook">
                            <i class="fab fa-facebook"></i>
                            </a>

                            <a href="#" class="social-share-url twitter">
                            <i class="fab fa-twitter"></i>
                            </a>

                            <a href="#" class="social-share-url twitter">
                            <i class="fab fa-pinterest"></i>
                            </a>

                            <a href="#" class="social-share-url linkedin">
                            <i class="fab fa-linkedin"></i>
                            </a>

                            <a href="#" class="social-share-url whatsapp">
                            <i class="fab fa-whatsapp"></i>
                            </a>
                        </div>
                        <script src="share.js"></script>
                    </div>
                </div>
            </div>
        </div>
    </div>
