<?php namespace App\Controller;


use App\Entity\Entreprise;
use App\Form\EntrepriseType;
use App\Repository\EntrepriseRepository;
use App\Repository\UserRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class EntreController extends AbstractController {

    /**
     * @var EntrepriseRepository
     */
    private $entrepriseRepository;

    /**
     * @var ObjectManager
     */
    private $objectManager;

    public function __construct(EntrepriseRepository $entrepriseRepository, ObjectManager $objectManager)
    {
        $this->entrepriseRepository = $entrepriseRepository;
        $this->objectManager = $objectManager;
    }

    /**
     * @return Response
     */
    public function index () :Response
    {
        $result = $this->entrepriseRepository->findAll();

        return $this->render('admin\entre\entre.show.html.twig', [
            'result' => $result
        ]);

    }

    /**
     * @param Request $request
     * @return Response
     */
    public function new (Request $request) :Response
    {
        $entity = new Entreprise();
        $form = $this->createForm(EntrepriseType::class, $entity);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->objectManager->persist($entity);
            $this->objectManager->flush();
            $this->addFlash('success', 'Vous avez bien créé l\'entreprise "'.$entity->getNom().'"');
            return $this->redirectToRoute('back.entre');
        }

        return $this->render('admin/entre/entre.new.html.twig', [
           'form' => $form->createView()
        ]);
    }

    /**
     * @param Entreprise $entreprise
     * @param Request $request
     * @return Response
     */
    public function edit (Entreprise $entreprise, Request $request) :Response
    {
        $form = $this->createForm(EntrepriseType::class, $entreprise);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->objectManager->flush();
            $this->addFlash('success', 'Vous avez bien édité l\'entreprise "'.$entreprise->getNom().'"');
            return $this->redirectToRoute('back.entre');
        }
        return $this->render('admin/entre/entre.edit.html.twig', [
            'result' => $entreprise,
            'form' => $form->createView()
        ]);
    }

    /**
     * @param Entreprise $entreprise
     * @param Request $request
     * @return Response
     */
    public function delete (Entreprise $entreprise, Request $request) :Response
    {
        $token = $this->isCsrfTokenValid('delete'.$entreprise->getId(), $request->get('_token'));

        if ($token) {
            $this->objectManager->remove($entreprise);
            $this->objectManager->flush();
            $this->addFlash('success', 'Vous avez bien supprimé l\'entreprise "'.$entreprise->getNom().'"');
        } elseif (!$token) {
            $this->addFlash('error', 'Hu ho! I made a mistake with the token ¯\_(ツ)_/¯');
        }

        return $this->redirectToRoute('back.entre');
    }

}