<?php namespace App\Controller;


use App\Entity\User;
use App\Form\UserType;
use App\Repository\UserRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class UserController extends AbstractController {

    /**
     * @var UserRepository
     */
    private $userRepository;

    /**
     * @var ObjectManager
     */
    private $objectManager;

    public function __construct(UserRepository $userRepository, ObjectManager $objectManager)
    {
        $this->userRepository = $userRepository;
        $this->objectManager = $objectManager;
    }

    /**
     * @return Response
     */
    public function index () :Response
    {
        $result = $this->userRepository->findAll();

        return $this->render('admin\user\user.show.html.twig', [
            'result' => $result
        ]);

    }

    /**
     * @param Request $request
     * @return Response
     */
    public function new (Request $request) :Response
    {
        $entity = new User();
        $form = $this->createForm(UserType::class, $entity);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->objectManager->persist($entity);
            $this->objectManager->flush();
            $this->addFlash('success', 'Vous avez bien créé l\'utilisateur "'.$entity->getUsername().'"');
            return $this->redirectToRoute('back.user');
        }

        return $this->render('admin/user/user.new.html.twig', [
           'form' => $form->createView()
        ]);
    }

    /**
     * @param User $user
     * @param Request $request
     * @return Response
     */
    public function edit (User $user, Request $request) :Response
    {
        $form = $this->createForm(UserType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->objectManager->flush();
            $this->addFlash('success', 'Vous avez bien édité l\'utilisateur "'.$user->getName().'"');
            return $this->redirectToRoute('back.user');
        }
        return $this->render('admin/user/user.edit.html.twig', [
            'result' => $user,
            'form' => $form->createView()
        ]);
    }

    /**
     * @param User $user
     * @param Request $request
     * @return Response
     */
    public function delete (User $user, Request $request) :Response
    {
        $token = $this->isCsrfTokenValid('delete'.$user->getId(), $request->get('_token'));

        if ($token) {
            $this->objectManager->remove($user);
            $this->objectManager->flush();
            $this->addFlash('success', 'Vous avez bien supprimé l\'utilisateur "'.$user->getName().'"');
        } elseif (!$token) {
            $this->addFlash('error', 'Hu ho! I made a mistake with the token ¯\_(ツ)_/¯');
        }

        return $this->redirectToRoute('back.user');
    }

}