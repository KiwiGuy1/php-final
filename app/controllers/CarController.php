<?php

class CarController extends Controller
{
    public function list()
    {
        $car = $this->model('Car');
        $cars = $car->getAll();

        $this->view('list', ['cars' => $cars]);
    }
    public function search(){

        $make = $_GET['make'] ?? '';
        $model = $_GET['model'] ?? '';
        $year = $_GET['year'] ?? '';
        $price = $_GET['price'] ?? '';    
        if($make == '' && $model == '' && $year == '' && $price == ''){
            $this->view('search', ['cars' => []]);
            return;
        }

        $carModel = $this->model('Car');
        $cars = $carModel->search($make, $model, $year, $price);

        // Pass the cars data to the view
        $this->view('search', ['cars' => $cars]);
        }
}
?>
