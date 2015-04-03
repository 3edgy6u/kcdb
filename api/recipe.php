<?php

if (!isset($_GET["fuel"], $_GET["ammo"], $_GET["steel"], $_GET["bauxite"], $_GET["devmats"])) die();
header("Content-Type: application/json; charset=utf-8");

require_once "db.php";
if ($st = $db->prepare("SELECT r.id, c.count, s.* FROM recipes r
        LEFT JOIN constructions c ON c.recipe = r.id
        LEFT JOIN ships s ON s.name = c.ship
        WHERE r.fuel = ? AND r.ammo = ? AND r.steel = ? AND r.bauxite = ? AND r.devmats = ?
        ORDER BY count DESC")) {
    $st->bind_param("iiiii", $_GET["fuel"], $_GET["ammo"], $_GET["steel"], $_GET["bauxite"], $_GET["devmats"]);
    $st->execute();
    $r = $st->get_result();
    $st->close();
    $arr = $r->fetch_all(MYSQLI_ASSOC);
    $o["ships"] = array();
    foreach ($arr as $a) $o["ships"][] = $a;

    $st = $db->prepare("SELECT SUM(c.count) as total FROM recipes r
        LEFT JOIN constructions c ON c.recipe = r.id
        WHERE r.fuel = ? AND r.ammo = ? AND r.steel = ? AND r.bauxite = ? AND r.devmats = ?");
    $st->bind_param("iiiii", $_GET["fuel"], $_GET["ammo"], $_GET["steel"], $_GET["bauxite"], $_GET["devmats"]);
    $st->execute();
    $r = $st->get_result();
    $st->close();
    $arr = $r->fetch_all(MYSQLI_ASSOC);
    $o["total"] = (int)$arr[0]["total"];

    printf(json_encode($o, JSON_UNESCAPED_UNICODE));
} else throw new Exception("Database error: " . $db->error);

?>
