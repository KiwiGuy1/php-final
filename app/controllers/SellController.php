<?php

class SellController extends Controller
{
    public function index()
    {
        $this->view('sell');
    }

    public function add()
    {
        $car = $this->model('Car');
        $car->add($_POST);
        header('Location: /car/list');
    }
}
?>
