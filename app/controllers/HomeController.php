<?php

class HomeController extends Controller
{
    public function index()
    {
        $carModel = $this->model('CarModels');
        $allModels = $carModel->getAll();
        
        $this->view('home', ['models' => $allModels]);
    }
}
?>
