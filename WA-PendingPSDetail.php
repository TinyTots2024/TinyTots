<?php

session_start();
// Check if the session variables are set
if (!isset($_SESSION['wba_id']) || !isset($_SESSION['wba_username'])) {
    // Redirect the user if session variables are not set
    header("Location: WA-Login.php"); // Change login.php to your login page
    exit();
}

    require '../include/Connection.php';
    $conn = getDB();

    //Web Admin information will be gathered
    $wba_id = $_SESSION["wba_id"];

    //Preschool ID will be gathered
    $PF_ps_id=htmlentities($_GET['ps_id']);

    $info_sql = "SELECT * FROM webadmins
                WHERE wba_id='".$wba_id."'";

    $info_results = mysqli_query($conn, $info_sql);

    // If there is a connection error, then echo the description of the error
    // Else, store the results on a variable using mysqli_fetch_all
    if ($info_results === false) {
        echo mysqli_error($conn);
    } else {
        $info= mysqli_fetch_all($info_results, MYSQLI_ASSOC);
    }
    
  //Retrieve all the information of the registered preschool
  $PS_info = "SELECT * FROM preschool 
  WHERE ps_id = '$PF_ps_id' LIMIT 1;";
  $PS_info_results = mysqli_query($conn, $PS_info);

  if ($PS_info_results === false) {
      echo mysqli_error($conn);
  } else {
      $showPSI = mysqli_fetch_all($PS_info_results, MYSQLI_ASSOC);
  }

  //Retrieve the list of faculty members associated with Preschool
  $PSF_info = "SELECT * FROM faculty
  JOIN preschool ON faculty.ps_id = preschool.ps_id 
  WHERE faculty.ps_id = '$PF_ps_id'";
  $PSF_info_results = mysqli_query($conn, $PSF_info);

  if ($PSF_info_results === false) {
      echo mysqli_error($conn);
  } else {
      $showPSIF = mysqli_fetch_all($PSF_info_results, MYSQLI_ASSOC);
  }

  // Retrieve the list of advisers along with their schedules for Kindergarten 1
  $Schedule_info_KG1 = "SELECT * FROM adviser
  JOIN faculty ON faculty.faculty_id = adviser.faculty_id 
  WHERE faculty.ps_id = '$PF_ps_id' AND adviser.grade_level = 'Kindergarten 1'";
  $Schedule_info_results_KG1 = mysqli_query($conn, $Schedule_info_KG1);

  if ($Schedule_info_results_KG1 === false) {
      echo mysqli_error($conn);
  } else {
      $showSchedule_KG1 = mysqli_fetch_all($Schedule_info_results_KG1, MYSQLI_ASSOC);
  }

  // Retrieve the list of subjects for Kindergarten 1
  $PSS_info_KG1 = "SELECT * FROM subjects
  JOIN preschool ON subjects.ps_id = preschool.ps_id 
  JOIN adviser ON subjects.adviser_ID = adviser.adviser_ID
  WHERE subjects.ps_id = '$PF_ps_id' AND adviser.grade_level = 'Kindergarten 1'
  GROUP BY subjects";
  $PSS_info_results_KG1 = mysqli_query($conn, $PSS_info_KG1);

  if ($PSS_info_results_KG1 === false) {
      echo mysqli_error($conn);
  } else {
      $showPSIS_KG1 = mysqli_fetch_all($PSS_info_results_KG1, MYSQLI_ASSOC);
  }

  // Retrieve the list of advisers along with their schedules for Kindergarten 2
  $Schedule_info_KG2 = "SELECT * FROM adviser
  JOIN faculty ON faculty.faculty_id = adviser.faculty_id 
  WHERE faculty.ps_id = '$PF_ps_id' AND adviser.grade_level = 'Kindergarten 2'";
  $Schedule_info_results_KG2 = mysqli_query($conn, $Schedule_info_KG2);

  if ($Schedule_info_results_KG2 === false) {
      echo mysqli_error($conn);
  } else {
      $showSchedule_KG2 = mysqli_fetch_all($Schedule_info_results_KG2, MYSQLI_ASSOC);
  }

  // Retrieve the list of subjects for Kindergarten 2
  $PSS_info_KG2 = "SELECT * FROM subjects
  JOIN preschool ON subjects.ps_id = preschool.ps_id 
  JOIN adviser ON subjects.adviser_ID = adviser.adviser_ID
  WHERE subjects.ps_id = '$PF_ps_id' AND adviser.grade_level = 'Kindergarten 2'
  GROUP BY subjects";
  $PSS_info_results_KG2 = mysqli_query($conn, $PSS_info_KG2);

  if ($PSS_info_results_KG2 === false) {
      echo mysqli_error($conn);
  } else {
      $showPSIS_KG2 = mysqli_fetch_all($PSS_info_results_KG2, MYSQLI_ASSOC);
  }

  //Retrieve the book information of the preschool
  $PSB_info = "SELECT * FROM ps_books
  JOIN preschool ON ps_books.ps_id = preschool.ps_id 
  JOIN subjects ON ps_books.subject_id = subjects.subject_id
  WHERE ps_books.ps_id = '$PF_ps_id'";
  $PSB_info_results = mysqli_query($conn, $PSB_info);

  if ($PSB_info_results === false) {
      echo mysqli_error($conn);
  } else {
      $showPSIB = mysqli_fetch_all($PSB_info_results, MYSQLI_ASSOC);
  }

   //Retrieve the event information of the preschool
   $PSE_info = "SELECT * FROM event
   JOIN preschool ON event.ps_id = preschool.ps_id 
   WHERE event.ps_id = '$PF_ps_id'";
   $PSE_info_results = mysqli_query($conn, $PSE_info);

   if ($PSE_info_results === false) {
       echo mysqli_error($conn);
  } else {
       $showPSEI = mysqli_fetch_all($PSE_info_results, MYSQLI_ASSOC);
  }

  // Use this section to retrieve all the media 
  // that was associated with the preschool
  $sql = "SELECT * FROM ps_media 
          JOIN preschool ON ps_media.ps_id = preschool.ps_id
          WHERE ps_media.ps_id='".$PF_ps_id."'";
  $res = mysqli_query($conn,  $sql);

   //Retrieve the information of the preschool
   $PSI_info = "SELECT * FROM ps_information
   JOIN preschool ON ps_information.ps_id = preschool.ps_id 
   WHERE ps_information.ps_id = '$PF_ps_id'";
   $PSI_info_results = mysqli_query($conn, $PSI_info);

   if ($PSI_info_results === false) {
       echo mysqli_error($conn);
  } else {
       $showPSinformation = mysqli_fetch_all($PSI_info_results, MYSQLI_ASSOC);
  }
?>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pending - Preschool Information</title>
        <link rel="stylesheet" href="../css/preschool-info.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <?php require 'include/index-header.php'; ?>
    </head>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
        const nextButton = document.getElementById('nextButton');
        const prevButton = document.getElementById('prevButton');
        const eventGrid = document.querySelector('.event-grid1');
        const eventItems = eventGrid.querySelectorAll('.event-grid-item1');
        const itemsPerPage = 4;
        let currentIndex = 0;

        showItems();

        nextButton.addEventListener('click', function () {
            currentIndex += itemsPerPage;
            showItems();
        });

        prevButton.addEventListener('click', function () {
            currentIndex -= itemsPerPage;
            showItems();
        });

        function showItems() {
            for (let i = 0; i < eventItems.length; i++) {
                if (i >= currentIndex && i < currentIndex + itemsPerPage) {
                    eventItems[i].style.display = 'flex';
                } else {
                    eventItems[i].style.display = 'none';
                }
            }

            if (currentIndex <= 0) {
                prevButton.style.display = 'none';
            } else {
                prevButton.style.display = 'block';
            }

            if (currentIndex + itemsPerPage >= eventItems.length) {
                nextButton.style.display = 'none';
            } else {
                nextButton.style.display = 'block';
            }

            // Dynamically adjust grid layout based on the number of items
            const numColumns = Math.ceil(eventItems.length / itemsPerPage);
            eventGrid.style.gridTemplateColumns = `repeat(${numColumns}, minmax(300px, 1fr))`;
        }
    });

    document.addEventListener('DOMContentLoaded', function () {
        const nextButton = document.getElementById('nextButton-faculty');
        const prevButton = document.getElementById('prevButton-faculty');
        const eventGrid = document.querySelector('.photo-grid');
        const eventItems = eventGrid.querySelectorAll('.photo-grid-item');
        const itemsPerPage = 4;
        let currentIndex = 0;

        showItems();

        nextButton.addEventListener('click', function () {
            currentIndex += itemsPerPage;
            showItems();
        });

        prevButton.addEventListener('click', function () {
            currentIndex -= itemsPerPage;
            showItems();
        });

        function showItems() {
            for (let i = 0; i < eventItems.length; i++) {
                if (i >= currentIndex && i < currentIndex + itemsPerPage) {
                    eventItems[i].style.display = 'flex';
                } else {
                    eventItems[i].style.display = 'none';
                }
            }

            if (currentIndex <= 0) {
                prevButton.style.display = 'none';
            } else {
                prevButton.style.display = 'block';
            }

            if (currentIndex + itemsPerPage >= eventItems.length) {
                nextButton.style.display = 'none';
            } else {
                nextButton.style.display = 'block';
            }

            // Dynamically adjust grid layout based on the number of items
            const numColumns = Math.ceil(eventItems.length / itemsPerPage);
            eventGrid.style.gridTemplateColumns = `repeat(${numColumns}, minmax(300px, 1fr))`;
        }
    });

    document.addEventListener('DOMContentLoaded', function () {
    const nextButton = document.getElementById('nextButton-facility');
    const prevButton = document.getElementById('prevButton-facility');
    const eventGrid = document.querySelector('.facility-grid');
    const eventItems = eventGrid.querySelectorAll('.facility-grid-item');
    const itemsPerPage = 8; // Adjusted items per page to 8
    let currentIndex = 0;

    showItems();

    nextButton.addEventListener('click', function () {
        currentIndex += itemsPerPage;
        showItems();
    });

    prevButton.addEventListener('click', function () {
        currentIndex -= itemsPerPage;
        showItems();
    });

    function showItems() {
        for (let i = 0; i < eventItems.length; i++) {
            if (i >= currentIndex && i < currentIndex + itemsPerPage) {
                eventItems[i].style.display = 'flex';
            } else {
                eventItems[i].style.display = 'none';
            }
        }

        if (currentIndex <= 0) {
            prevButton.style.display = 'none';
        } else {
            prevButton.style.display = 'block';
        }

        if (currentIndex + itemsPerPage >= eventItems.length) {
            nextButton.style.display = 'none';
        } else {
            nextButton.style.display = 'block';
        }

        // Dynamically adjust grid layout based on the number of items
        const numColumns = Math.ceil(itemsPerPage / 2); // 2 rows
        eventGrid.style.gridTemplateColumns = `repeat(${numColumns}, minmax(300px, 1fr))`;
    }
});
    </script>


    <body> 
        <div class="section section1">
            <div class="container">
                <br>
                <div class="left-column">
                    <?php foreach ($showPSI as $PSI): ?>
                        <h2 class="psName"><?= $PSI["school_name"] ?></h2>
                        <p class="psExtraDet"><?= $PSI["address"] ?></p>
                        <p class="psExtraDet"><?= $PSI["phone_number"] ?> | <?= $PSI["email"] ?></p>
                        <p class="psExtraDet"><?= $PSI["hours"] ?></p>
                        <a href='Parent-Login.php?ps_id=<?= $PF_ps_id ?>'><button class="EnrollButton">Enroll Now</button></a>
                </div>
                <div class="right-column">
                    <img src="../css/ps-details-photo.png" alt="Your Image" class="fixed-image">        
                </div>    
            </div>   
        </div>
                    
        <div class="section section2">
            <div class="container">
                <div class="left-column">
                    <h3 class="about-school">About Our School</h3>
                    <div class="details-shape">
                    
                        <h2 class="content-details-title-shape">Welcome to <?= $PSI["school_name"] ?>!</h2>
                        <?php foreach ($showPSinformation as $mvi): ?>
                            <p class="content-details-shape"><?= $mvi["ps_desc"] ?></p>
                        
                        <h2 class="content-details-title-shape">Mission</h2>
                            <p class="content-details-shape"><?= $mvi["ps_mission"] ?></p>
                        
                        <h2 class="content-details-title-shape">Vision</h2>
                            <p class="content-details-shape"><?= $mvi["ps_vision"] ?></p>
                        <?php endforeach; ?>
                    </div>
                </div>
                <div class="right-column">
                    <img src="../uploaded-image/<?=$PSI['ps_profile']?>" alt="Preschool Logo" class= "picture"> 
                </div>
            </div>
        </div>
        <?php endforeach; ?>
               
        <div class="section section1"><br>
            <h2 class="title-2">Faculty Staff</h2>

                <div class="nav-buttons">
                    <button class="nav-button prev-button" id="prevButton-faculty"><i class="fa-solid fa-circle-left" style="color: #ffffff;"></i> Previous Slide</button>
                    <button class="nav-button next-button" id="nextButton-faculty">Next Slide <i class="fa-solid fa-circle-right" style="color: #ffffff;"></i> </button>
                </div><br>

                <div class="photo-grid-container">
                    <div class="photo-grid-wrapper">
                        <div class="photo-grid">
                            <?php foreach ($showPSIF as $PSIF): ?>
                                <div class="photo-grid-item">
                                    <img src="../uploaded-image/<?= $PSIF['f_profile'] ?>" alt="Teacher Photo">
                                    <h3 class="fp-name"><?= $PSIF["f_fname"] ?> <?= $PSIF["f_lname"] ?></h3>
                                    <p class="details"><?= $PSIF["f_phonenumber"] ?></p>
                                    <p class="details"><?= $PSIF["f_email"] ?></p>
                                    <p class="details"><?= $PSIF["f_address"] ?></p>
                                </div>    
                            <?php endforeach; ?>   
                        </div>  
                    </div>
                </div>
        </div>

        <div class="section section2">
            <br>
            <?php if (empty($showPSEI)): ?>
                <h3>No available event info</h3>
            <?php else : ?>
                <br>
                <h2 class="title-1">School Event</h2>
                <br>
                <div class="nav-buttons">
                    <button class="nav-button prev-button" id="prevButton"><i class="fa-solid fa-circle-left" style="color: #ffffff;"></i> Previous Slide</button>
                    <button class="nav-button next-button" id="nextButton">Next Slide <i class="fa-solid fa-circle-right" style="color: #ffffff;"></i> </button>
                </div><br>
                <div class="event-grid-container">
                    <div class="event-grid-wrapper">
                        <div class="event-grid1">
                            <?php foreach ($showPSEI as $PSEI): ?>
                                <div class="event-grid-item1">
                                    <img src="../uploaded-image/<?=$PSEI['event_photo']?>" alt="Event Photo">
                                    <h3 class="title1"><?= $PSEI["event_title"] ?></h3>
                                    <p class="detInfo1"><?= $PSEI["event_date"] ?></p>
                                </div>
                            <?php endforeach; ?>
                        </div>
                    </div>
                </div>
            <?php endif; ?>
        </div>

        <div class="section section1"><br>
            <h2 class="title-2">Schedule & Subjects</h2>
            <div class="container-SS">
                <div class="left-column-SS">
                    <div class="tblBG-SS">
                        <h3 class="title-SS">Kindergarten 1</h3>
                        <table class="tblBorder-SS"> 
                            <tr>
                                <th>Grade Level</th>
                                <th>Section</th>
                                <th>Class Schedule</th>
                                <th>Faculty in Charge</th>
                            </tr>
                            <?php foreach ($showSchedule_KG1 as $sched): ?>
                                <tr>
                                    <td><?= $sched["grade_level"] ?></td>
                                    <td><?= $sched["section"] ?></td>
                                    <td><?= $sched["class_sched"] ?></td>
                                    <td><?= $sched["f_fname"] ?> <?= $sched["f_lname"] ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </table>
                    </div>
                    <br>
                    <div class="subBG-container">
                        <?php foreach ($showPSIS_KG1 as $subject): ?>
                            <div class="subBG">
                                <?= $subject["subjects"] ?>     
                            </div>            
                        <?php endforeach; ?>
                    </div>
                </div>
                <div class="right-column-SS">
                    <div class="tblBG-SS">
                        <h3 class="title-SS">Kindergarten 2</h3>
                        <table class="tblBorder-SS"> 
                            <tr>
                                <th>Grade Level</th>
                                <th>Section</th>
                                <th>Class Schedule</th>
                                <th>Faculty in Charge</th>
                            </tr>
                            <?php foreach ($showSchedule_KG2 as $sched): ?>
                                <tr>
                                    <td><?= $sched["grade_level"] ?></td>
                                    <td><?= $sched["section"] ?></td>
                                    <td><?= $sched["class_sched"] ?></td>
                                    <td><?= $sched["f_fname"] ?> <?= $sched["f_lname"] ?></td>
                                </tr>
                            <?php endforeach; ?>
                        </table>
                    </div>
                    <br>
                    <div class="subBG-container">
                        <?php foreach ($showPSIS_KG2 as $subject): ?>
                            <div class="subBG">
                                <?= $subject["subjects"] ?>     
                            </div>            
                        <?php endforeach; ?>
                    </div>
                </div>
            </div>
        </div>


        <div class="section section1"><br>
            <h2 class="title-2">Books</h2>
            <div class="container-B">
                    <div class="tblBG-B">
                        <table class="tblBorder-B"> 
                            <tr>
                                <th>Book Name</th>
                                <th>Author</th>
                                <th>Publisher</th>
                                <th>Subject</th>
                            </tr>
                            <tr>
                                <?php foreach ($showPSIB as $PSIB): ?>
                                <td><?= $PSIB["b_name"] ?></td>
                                <td><?= $PSIB["b_author"] ?></td>
                                <td><?= $PSIB["b_publisher"] ?></td>
                                <td><?= $PSIB["subjects"] ?></td>
                            </tr>
                                <?php endforeach; ?>
                        </table>
                    </div>
            </div>
        </div>
        
        <div class="section section2"><br>
            <?php if (mysqli_num_rows($res) > 0): ?>
                        
                <h2 class="title-1">Facilities</h2> 

                <div class="nav-buttons">
                    <button class="nav-button prev-button" id="prevButton-facility"><i class="fa-solid fa-circle-left" style="color: #ffffff;"></i> Previous Slide</button>
                    <button class="nav-button next-button" id="nextButton-facility">Next Slide <i class="fa-solid fa-circle-right" style="color: #ffffff;"></i> </button>
                </div><br>

                <div class="event-grid-container1">
                    <div class="event-grid-wrapper1">
                        <div class="facility-grid">
                            <?php while ($ps_media = mysqli_fetch_assoc($res)): ?>
                                <div class="facility-grid-item">
                                    <img src="../uploaded-image/<?=$ps_media['photo_name']?>" alt="Additional Photo" class="img-fluid mb-4">
                                </div>
                            <?php endwhile; ?>
                        </div>
                    </div>
                </div>
            <?php else: ?>
                <h3 class="title-1">No available photos</h3>
            <?php endif; ?>
        </div>


    </body>

</html>