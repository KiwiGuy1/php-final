<?php

class CarController extends Controller
{
    public function list()
    {
        $car = $this->model('Car');
        $cars = $car->getAll();
        
        $this->view('list', ['cars' => $cars]);
    }

    public function view($id)
    {
        $car = $this->model('Car');
        $carDetails = $car->getById($id);
        $this->view('car', ['car' => $carDetails]);
    }
}
?>
