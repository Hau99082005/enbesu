<?php

require_once 'app/model/theModel.php';

class theController
{
    public function index()
    {
        $the = new theModel();
        $thes = $the->getAllthe();

        include_once 'views/pages/the/the.php';
    }

    public function create() {
        $err = [];
        $data = $_POST;
        
        if (isset($_POST['submit'])) {
            $title = $_POST['title'];
            $pagraph = $_POST['pagraph'];
            $status = $_POST['status'];
            $id_the = $_POST['id_the'];
            $thumbnail = $_FILES['thumbnail']['name'];
    
            if (empty($err)) {
                $the = new theModel();
                $the->addthe($title, $pagraph, $thumbnail, $status, $id_the);
    
                $file = '../assets/images/' . $_FILES['thumbnail']['name'];
                move_uploaded_file($_FILES['thumbnail']['tmp_name'], $file);
    
                header('Location:' . APPURL_ADMIN . 'the');
            }
        }
        include_once 'views/pages/the/create.php';
    }
    
    //edit product
    public function edit() {
        $the_id = $_GET['id'];
        $the = new theModel();
        $theData = $the->gettheById($the_id)->fetch_assoc();
        $err = [];
    
        if (isset($_POST['submit'])) {
            $title = $_POST['title'];
            $pagraph = $_POST['pagraph'];
            $status = $_POST['status'];
            $id_the = $_POST['id_the'];
            $thumbnail = $theData['image'];
    
            if ($_FILES['thumbnail']['error'] == 0) {
                $thumbnail = $_FILES['thumbnail']['name'];
                $file = '../assets/images/' . $_FILES['thumbnail']['name'];
                move_uploaded_file($_FILES['thumbnail']['tmp_name'], $file);
            }
    
            if (empty($err)) {
                $the->editthe($the_id, $title,$pagraph,  $thumbnail,$status,  $id_the);
                header('Location:' . APPURL_ADMIN . 'the');
            }
        }
        include_once 'views/pages/the/edit.php';
    }

    //delete product
    public function delete() {
        $the_id = $_GET['id'];
        $the = new theModel();
        $the->deletethe($the_id);
        header('Location:' . APPURL_ADMIN . 'the');
    }
}