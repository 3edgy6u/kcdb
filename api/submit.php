<?php

if (!isset($_GET["ship"], $_GET["fuel"], $_GET["ammo"], $_GET["steel"], $_GET["bauxite"], $_GET["devmats"])) die();

require_once "db.php";
if ($st = $db->prepare("SELECT id FROM recipes WHERE fuel = ? AND ammo = ? AND steel = ? AND bauxite = ? AND devmats = ?")) {
    $st->bind_param("iiiii", $_GET["fuel"], $_GET["ammo"], $_GET["steel"], $_GET["bauxite"], $_GET["devmats"]);
    $st->execute();
    $r = $st->get_result();
    $st->close();
    if ($r->num_rows == 0) {
        $st = $db->prepare("INSERT INTO recipes (fuel, ammo, steel, bauxite, devmats) VALUES (?,?,?,?,?)");
        $st->bind_param("iiiii", $_GET["fuel"], $_GET["ammo"], $_GET["steel"], $_GET["bauxite"], $_GET["devmats"]);
        $st->execute();
        $st->close();
        $id = $db->insert_id;
    } else {
        $id = $r->fetch_assoc() ["id"];
    }
} else throw new Exception("Database error: " . $db->error);
if ($st = $db->prepare("SELECT count FROM constructions WHERE ship = ? AND recipe = ?")) {
    $st->bind_param("si", $_GET["ship"], $id);
    $st->execute();
    $r = $st->get_result();
    $st->close();
    if ($r->num_rows == 0) {
        $st = $db->prepare("INSERT INTO constructions (ship, recipe, count) VALUES (?,?,0)");
        $st->bind_param("si", $_GET["ship"], $id);
        $st->execute();
        $st->close();
    }
} else throw new Exception("Database error: " . $db->error);
if ($st = $db->prepare("UPDATE constructions SET count = count + 1 WHERE ship = ? AND recipe = ?")) {
    $st->bind_param("si", $_GET["ship"], $id);
    $st->execute();
    $st->close();
} else throw new Exception("Database error: " . $db->error);

?>
