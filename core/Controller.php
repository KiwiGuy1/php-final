<?php

class Controller
{
    // Load view file with optional data
    public function view($view, $data = [])
    {
        if (file_exists('../app/views/' . $view . '.php')) {
            extract($data);
            require_once '../app/views/' . $view . '.php';
        } else {
            // Error handling for view not found
            die('View file not found');
        }
    }

    // Redirect to a different page or URL
    public function redirect($url)
    {
        header('Location: ' . $url);
    }

    // Load model file
    public function model($model)
    {
        require_once '../app/models/' . $model . '.php';
        return new $model();
    }
}
?>