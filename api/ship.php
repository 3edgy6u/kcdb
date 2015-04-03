<?php

if (!isset($_GET["ship"])) die();
header("Content-Type: application/json; charset=utf-8");

require_once "db.php";
if ($st = $db->prepare("SELECT r.*, c.count FROM constructions c
        LEFT JOIN recipes r ON c.recipe = r.id
        WHERE c.ship = ?
        ORDER BY c.count DESC")) {
    $st->bind_param("s", $_GET["ship"]);
    $st->execute();
    $r = $st->get_result();
    $st->close();
    $arr = $r->fetch_all(MYSQLI_ASSOC);
    $o["recipes"] = array();
    foreach ($arr as $a) $o["recipes"][] = $a;

    $st = $db->prepare("SELECT SUM(c.count) as total FROM constructions c
        WHERE c.ship = ?");
    $st->bind_param("s", $_GET["ship"]);
    $st->execute();
    $r = $st->get_result();
    $st->close();
    $arr = $r->fetch_all(MYSQLI_ASSOC);
    $o["total"] = (int)$arr[0]["total"];

    printf(json_encode($o, JSON_UNESCAPED_UNICODE));
} else throw new Exception("Database error: " . $db->error);

?>
