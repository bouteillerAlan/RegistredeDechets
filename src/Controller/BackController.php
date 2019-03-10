<?php namespace App\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;

class BackController extends AbstractController {


    public function index () :Response
    {

        return $this->render('backhome.html.twig');

    }

    public function new () :Response
    {

        return $this->render('backnew.html.twig');

    }

    public function modif () :Response
    {

        return $this->render('backmodif.html.twig');

    }


}