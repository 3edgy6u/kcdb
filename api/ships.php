<?php

header("Content-Type: application/json; charset=utf-8");

require_once "db.php";
if ($st = $db->prepare("SELECT s.*, COALESCE(SUM(c.count),0) as total FROM ships s
        LEFT JOIN constructions c ON c.ship = s.name
        GROUP BY s.id
        ORDER BY total DESC")) {
    $st->execute();
    $r = $st->get_result();
    $st->close();
    $arr = $r->fetch_all(MYSQLI_ASSOC);
    $o["ships"] = array();
    foreach ($arr as $a) if($a["total"]>0) $o["ships"][] = $a;
    printf(json_encode($o, JSON_UNESCAPED_UNICODE));
} else throw new Exception("Database error: " . $db->error);

?>
