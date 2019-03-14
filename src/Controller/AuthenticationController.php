<?php namespace App\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class AuthenticationController extends AbstractController {

    public function indexRedirect () :Response
    {
        return $this->redirectToRoute('back');
    }

    public function login (AuthenticationUtils $authenticationUtils) :Response
    {

        $lastUser = $authenticationUtils->getLastUsername();
        $lastError = $authenticationUtils->getLastAuthenticationError();

        return $this->render('login.html.twig', [
            'lastUser' => $lastUser,
            'error' => $lastError
        ]);

    }

}