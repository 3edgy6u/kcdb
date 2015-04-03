<?php

header("Content-Type: application/json; charset=utf-8");

require_once "db.php";
if ($st = $db->prepare("SELECT r.*, SUM(c.count) as total FROM recipes r
        LEFT JOIN constructions c ON c.recipe = r.id
        GROUP BY r.id
        ORDER BY total DESC")) {
    $st->execute();
    $r = $st->get_result();
    $st->close();
    $arr = $r->fetch_all(MYSQLI_ASSOC);
    $o["recipes"] = array();
    foreach ($arr as $a) $o["recipes"][] = $a;
    printf(json_encode($o, JSON_UNESCAPED_UNICODE));
} else throw new Exception("Database error: " . $db->error);

?>
