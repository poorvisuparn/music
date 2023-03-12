<?php
// Start the session
session_start();
?>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>

    <style>
        .select {
            background: transparent;
            width: 150px;
            font-size: 16px;
            border: 1px;
            height: 34px;
            margin: 10px;
        }

        .button {
            background: lightgreen;
            width: 150px;
            font-size: 16px;
            border: 1px;
            height: 34px;
            margin: 10px;
        }

        body {
            max-width: max-content;
            margin: auto;
            margin-top: 15%;
        }
    </style>

    <body>
        <h1>DBMS - UE20CS301</h1>
        <h2>MUSIC PLAYER DATABASE SYSTEM</h2>
        <h3>Select Language to retrieve Movies of Songs :</h3>
        <form  action = "action.php" method = POST name = "langid">
            <select name="langid" id="langid" class = "select">
                <option value="1">English</option>
                <option value="2">Hindi</option>
                <option value="3">Kannada</option>
            </select>
            <input type="submit" value="Submit" class="button">
        </form>
    </body>

</html>