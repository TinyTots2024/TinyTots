<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Preschool Locator a</title>
    <link rel="stylesheet" href="../css/map.css" />
    <!-- <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places"> -->
    </script>

    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />

</head>

<body>
    <!-- Wrapper for the entire page -->
    <div class="page-wrapper">
        <div><?php require 'include/index-header.php'; ?></div>

        <div class="container-fluid">
            <div class="row">

                <!-- First Column - Branch List -->
                <div class="col-md-4">
                    <a href="../index.php"><img src="../include/name.png" width="280" height="80" style="margin:15px 50px 1px 100px;"></a>
                    <h2 class="preschoolTitle">Preschools</h2>
                    <ul id="preschoolList">
                        <?php  require '../include/Connection.php'; 

                        // Call the getDB function to obtain a database connection
                        $conn = getDB();

                        // Check the connection
                        if (!$conn) {
                            die("Connection failed: " . mysqli_connect_error());
                        }
                                            
                        // Perform the database query to get preschool data with marker details
                        $query = "SELECT p.*, m.lat, m.lng
                        FROM preschool p
                        LEFT JOIN markers m ON p.ps_id = m.ps_id
                        WHERE p.status = 'Registered'";
                        $result = mysqli_query($conn, $query);

                        if (!$result) {
                            die('Error fetching preschool data: ' . mysqli_error($conn));
                        }

                        // Fetch the result rows and generate HTML
                        while ($row = mysqli_fetch_assoc($result)) {    ?>
                        <li class="map-container">
                            <p class="schoolName"><?= $row['school_name'] ?></p>
                            <p class="schoolDet"><?= $row['address'] ?></p>
                            <p class="schoolDet"><?= $row['phone_number'] ?> | <?= $row['hours'] ?></p>
                            <a href="PS-Details.php?ps_id=<?= $row['ps_id'] ?>"><button class="buttonHere">View Details</button></a>
                            <!-- Marker details -->
                            <p hidden>Lat: <?= $row['lat'] ?></p>
                            <p hidden>Lng: <?= $row['lng'] ?></p>
                            <!-- Distance will be appended here dynamically -->
                            <p class="distance"></p> 
                            <br>
                        </li>
                        <?php } ?>
                    </ul>
                </div>

                <!-- Second Column - Embedded Map -->
                <div class="col-md-8">
                    <!-- Add your embedded map with the ID 'map' -->
                    <div id="map" style="height: 400px;"></div>
                    <!-- Street View container -->
                    <div id="pano" style="height: 400px;"></div>

                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript code -->
    <script src="script.js"></script>

    <!-- Google Maps JavaScript API -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRkSEq2t5GpBGoWb1y6bok61mB40cRYvo&callback=initMap" async defer></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRkSEq2t5GpBGoWb1y6bok61mB40cRYvo&libraries=geometry&callback=initMap" async defer></script>

    <!-- Add Bootstrap JS and Popper.js (required for some Bootstrap components) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>