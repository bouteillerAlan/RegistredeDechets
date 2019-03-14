<?php namespace App\Controller;

use App\Entity\Emetteur;
use App\Form\EmetteurType;
use App\Repository\EmetteurRepository;
use App\Repository\EntrepriseRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class BackController extends AbstractController {

    /**
     * @var EmetteurRepository
     */
    private $emetteurRepository;

    private $test;

    /**
     * @var ObjectManager
     */
    private $objectManager;

    /**
     * BackController constructor.
     * @param EmetteurRepository $emetteurRepository
     * @param ObjectManager $objectManager
     */
    public function __construct(EmetteurRepository $emetteurRepository, ObjectManager $objectManager, EntrepriseRepository $test)
    {
        $this->objectManager = $objectManager;
        $this->emetteurRepository = $emetteurRepository;
        $this->test = $test;
    }

    /**
     * @param PaginatorInterface $paginator
     * @param Request $request
     * @return Response
     */
    public function index (PaginatorInterface $paginator, Request $request) :Response
    {
        $result = $paginator->paginate(
            $this->emetteurRepository->findAll(),
            $request->query->getInt('page', 1),
            5
        );


        return $this->render('admin/backhome.html.twig', [
            'result' => $result
        ]);

    }

    public function new (Request $request) :Response
    {
        $emetteur = new Emetteur();

        $formEmetteur = $this->createForm(EmetteurType::class, $emetteur);

        $formEmetteur->handleRequest($request);

        if ($formEmetteur->isSubmitted() && $formEmetteur->isValid()) {

            $file = $formEmetteur->get('fichier_bsd')->getData();
            $fileName = $emetteur->getIdBsd().'.'.$file->guessExtension();

            try {
                $file->move($this->getParameter('file_directory'), $fileName);
            } catch (FileException $e) {
                $this->addFlash('error', 'Erreur pendant l\'upload de votre fichier : '.$e);
            }

            $emetteur->setFichierBsd($fileName);

            $this->objectManager->persist($emetteur);
            $this->objectManager->flush();
            $this->addFlash('success', 'Vous avez bien créé le BSD "'.$emetteur->getIdBsd().'"');
            return $this->redirectToRoute('back');
        }

        return $this->render('admin/backnew.html.twig', [
            'formEmetteur' => $formEmetteur->createView()
        ]);

    }

    public function modif (Request $request, Emetteur $emetteur) :Response
    {
        $form = $this->createForm(EmetteurType::class, $emetteur);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->objectManager->flush();
            $this->addFlash('success', 'Vous avez bien modifié le BSD "'.$emetteur->getIdBsd().'"');
            return $this->redirectToRoute('back');
        }

        return $this->render('admin/backmodif.html.twig', [
            'result' => $emetteur,
            'form' => $form->createView()
        ]);

    }

    public function delete (Request $request, Emetteur $emetteur) :Response
    {
        $token = $this->isCsrfTokenValid('delete'.$emetteur->getId(), $request->get('_token'));

        if ($token) {
            $this->objectManager->remove($emetteur);
            $this->objectManager->flush();
            $this->addFlash('success', 'Vous avez bien supprimé le BSD "'.$emetteur->getIdBsd().'"');
        } elseif (!$token) {
            $this->addFlash('error', 'Hu ho! I made a mistake with the token ¯\_(ツ)_/¯');
        }

        return $this->redirectToRoute('back');
    }


}