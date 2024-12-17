<?php

require_once '../config/connect.php';


class thethanhvienModel {

    // get all product
    public function getAllthethanhvien() {
        $sql = "SELECT * FROM thethanhvien";
        $result = Database::query($sql);
        return $result;
    }

    // get product by id
    public function getthethanhvienById($id) {
        $sql = "SELECT * FROM thethanhvien WHERE id = $id";
        $result = Database::query($sql);
        return $result;
    }
    public function addthethanhvien($title,$pagraph, $images, $day) {
        $sql = "INSERT INTO thethanhvien (title, pagraph, image,day) VALUES ('$title', '$pagraph','$images','$day')";
        $result = Database::query($sql);
        return $result;
    }
    

    // edit product
    public function editthethanhvien($id,$title,$pagraph, $images, $day) {
        $sql = "UPDATE thethanhvien SET image = '$images', title = '$title', pagraph = '$pagraph',day = '$day' WHERE id = $id";
        $result = Database::query($sql);
        return $result;
    }
    

    // delete product
    public function deletethethanhvien($id) {
        $sql = "DELETE FROM thethanhvien WHERE id = $id";
        $result = Database::query($sql);
        return $result;
    }
}