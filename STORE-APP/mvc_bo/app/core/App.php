<?php
class App
{
    // Default controller(class) & methode values :
    protected $controller = "home";
    protected $method = "index";
    protected $params = [];

    public function __construct()
    {
        $url = $this->parseUrl();
        // var_dump($url); // return all values of $_GET['url'] array
        // if file name of controller exist in /controllers and === url[0]:
        if (file_exists('../app/controllers/' . $url[0] . '.php')) {
            $this->controller = $url[0];
            unset($url[0]);
        }

        require_once '../app/controllers/' . $this->controller . '.php';

        $this->controller = new $this->controller;
        // if method name exist in controller class and === url[1]:
        if (isset($url[1])) {
            if (method_exists($this->controller, $url[1])) {
                $this->method = $url[1];
                unset($url[1]);
            }
        }

        $this->params = $url ? array_values($url) : [];
        // var_dump($url); // return just last one value of $_GET['url'] array

        // Call a callback with an array of parameters:
        // $this->params: The parameters to be passed to the callback, as an indexed array.
        // Passed $this->params to $this->method of $this->controller:
        call_user_func_array([$this->controller, $this->method], $this->params);
        // Retourne la valeur retournée par la fonction de rappel, ou FALSE si une erreur survient.
    }

    public function parseUrl()
    {
        if (isset($_GET['url'])) {
            // Get array values of $_GET['url']
            return $url = explode('/', filter_var(rtrim($_GET['url'], '/'), FILTER_SANITIZE_URL));
        }
    }

}