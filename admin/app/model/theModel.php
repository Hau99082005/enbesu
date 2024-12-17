<?php

require_once '../config/connect.php';


class theModel {

    // get all product
    public function getAllthe() {
        $sql = "SELECT * FROM the";
        $result = Database::query($sql);
        return $result;
    }

    // get product by id
    public function gettheById($id) {
        $sql = "SELECT * FROM the WHERE id = $id";
        $result = Database::query($sql);
        return $result;
    }
    public function addthe($title,$pagraph, $images, $status,$id_the) {
        $sql = "INSERT INTO the(image, title, pagraph,id_the,status) VALUES ('$images', '$title','$pagraph','$id_the' ,'$status')";
        $result = Database::query($sql);
        return $result;
    }
    

    // edit product
    public function editthe($id, $title,$pagraph, $images, $status,$id_the) {
        $sql = "UPDATE the SET image = '$images', title = '$title', pagraph = '$pagraph',id_the = '$id_the',status  = '$status' WHERE id = $id";
        $result = Database::query($sql);
        return $result;
    }
    

    // delete product
    public function deletethe($id) {
        $sql = "DELETE FROM the WHERE id = $id";
        $result = Database::query($sql);
        return $result;
    }
}