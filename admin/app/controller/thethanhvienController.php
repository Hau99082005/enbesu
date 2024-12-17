<?php

require_once 'app/model/thethanhvienModel.php';

class thethanhvienController
{
    public function index()
    {
        $thethanhvien = new thethanhvienModel();
        $thethanhviens = $thethanhvien->getAllthethanhvien();

        include_once 'views/pages/thethanhvien/thethanhvien.php';
    }

    public function create() {
        $err = [];
        $data = $_POST;
        
        if (isset($_POST['submit'])) {
            $title = $_POST['title'];
            $pagraph = $_POST['pagraph'];
            $day = $_POST['day'];
            $thumbnail = $_FILES['thumbnail']['name'];
    
            if (empty($err)) {
                $thethanhvien = new thethanhvienModel();
                $thethanhvien->addthethanhvien($title, $pagraph, $thumbnail, $day);
    
                $file = '../assets/images/' . $_FILES['thumbnail']['name'];
                move_uploaded_file($_FILES['thumbnail']['tmp_name'], $file);
    
                header('Location:' . APPURL_ADMIN . 'thethanhvien');
            }
        }
        include_once 'views/pages/thethanhvien/create.php';
    }
    
    //edit product
    public function edit() {
        $thethanhvien_id = $_GET['id'];
        $thethanhvien = new thethanhvienModel();
        $thethanhvienData = $thethanhvien->getthethanhvienById($thethanhvien_id)->fetch_assoc();
        $err = [];
    
        if (isset($_POST['submit'])) {
            $title = $_POST['title'];
            $pagraph = $_POST['pagraph'];
            $day = $_POST['day'];
            $thumbnail = $thethanhvienData['image'];
    
            if ($_FILES['thumbnail']['error'] == 0) {
                $thumbnail = $_FILES['thumbnail']['name'];
                $file = '../assets/images/' . $_FILES['thumbnail']['name'];
                move_uploaded_file($_FILES['thumbnail']['tmp_name'], $file);
            }
    
            if (empty($err)) {
                $thethanhvien->editthethanhvien($thethanhvien_id, $title,$pagraph,  $thumbnail,$day);
                header('Location:' . APPURL_ADMIN . 'thethanhvien');
            }
        }
        include_once 'views/pages/thethanhvien/edit.php';
    }

    //delete product
    public function delete() {
        $thethanhvien_id = $_GET['id'];
        $thethanhvien = new thethanhvienModel();
        $thethanhvien->deletethethanhvien($thethanhvien_id);
        header('Location:' . APPURL_ADMIN . 'thethanhvien');
    }
}