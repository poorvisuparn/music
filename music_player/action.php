<?php 

session_start();

$_SESSION['lang'] = $_POST['langid'];

$conn = mysqli_connect('localhost', 'poorvi', 'root', 'music_player');

if (!$conn) {
echo "Could not connect: " . mysqli_connect_error();
}

// write query to show database
$sql = "SELECT Movie_name, Director, Release_date FROM MOVIE
WHERE EXISTS
(SELECT Song_id FROM SONG WHERE SONG.Movie_id = MOVIE.Movie_id AND Language_id = '".$_SESSION['lang']."')";

// make query and get result
$result = mysqli_query($conn, $sql);

// fetch resulting rows as array
$musics = mysqli_fetch_all($result, MYSQLI_ASSOC);

// free memory
mysqli_free_result($result);

// close connection
mysqli_close($conn);

?>

<!DOCTYPE html>
<html>
    <style>
        body {
            max-width: max-content;
            margin: auto;
            margin-top: 15%;
        }
        table 
        {
            border: 1px solid black;
            padding: 2px;
        }
        th
        {
            border: 1px solid black;
            padding: 10px;
            background: lightgreen;
        }
        td
        {
            border: 1px solid black;
            padding: 10px;
        }
    </style>
    <body>
        <h1>DBMS - UE20CS301</h1>
        <h2>MUSIC PLAYER DATABASE SYSTEM</h2>
        <div>
            <h3>Movies of Selected Language: </h3>
            <table>
                <th>MOVIE</th><TH>DIRECTOR</TH><Th>RELEASED ON</Th>
                <div><?php foreach($musics as $music) { ?></div>
                <tr>
                    <td><?php echo htmlspecialchars($music['Movie_name']); ?></td>
                    <td><?php echo htmlspecialchars($music['Director']); ?></td>
                    <td><?php echo htmlspecialchars($music['Release_date']); ?></td>
                </tr>
                <div><?php }?></div>
            </table>
        </div>
        3
        
    </body>
</html>