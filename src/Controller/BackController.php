<?php namespace App\Controller;

use App\Entity\Emetteur;
use App\Entity\EmetteurSearch;
use App\Form\EmetteurSearchType;
use App\Form\EmetteurType;
use App\Repository\CodeDrRepository;
use App\Repository\EmetteurRepository;
use App\Repository\EntrepriseRepository;
use App\Repository\ModeTraitementRepository;
use App\Repository\UserRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\File;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\File\Exception\FileException;

class BackController extends AbstractController {

    /**
     * @var EmetteurRepository
     */
    private $emetteurRepository;

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
     * @param CodeDrRepository $codeDrRepository
     * @param EntrepriseRepository $entrepriseRepository
     * @param ModeTraitementRepository $modeTraitementRepository
     * @param UserRepository $userRepository
     * @return Response
     * @throws \Exception
     */
    public function index (PaginatorInterface $paginator, Request $request, CodeDrRepository $codeDrRepository, EntrepriseRepository $entrepriseRepository, ModeTraitementRepository $modeTraitementRepository, UserRepository $userRepository) :Response
    {
        /// Search function
        $search = new EmetteurSearch();
        $form = $this->createForm(EmetteurSearchType::class, $search);
        $form->handleRequest($request);

        /// Pagination and result
        $result = $paginator->paginate(
            $this->emetteurRepository->findAllorSearch($search),
            $request->query->getInt('page', 1),
            10
        );

        $totalUser = $userRepository->findTotal();
        $totalCode = $codeDrRepository->findTotal();
        $totalEntreprise = $entrepriseRepository->findTotal();
        $totalMode = $modeTraitementRepository->findTotal();

        return $this->render('admin/backhome.html.twig', [
            'formSearch' => $form->createView(),
            'result' => $result,
            'totalUser' => $totalUser[0][1],
            'totalCode' => $totalCode[0][1],
            'totalEntreprise' => $totalEntreprise[0][1],
            'totalMode' => $totalMode[0][1]
        ]);

    }

    /**
     * @param Request $request
     * @return Response
     */
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

    /**
     * @param Request $request
     * @param Emetteur $emetteur
     * @return Response
     */
    public function edit (Request $request, Emetteur $emetteur) :Response
    {
        /////////// FILE GESTION ///////////
        //keep the file path on object style
        $name = $this->getParameter('file_directory').'/'.$emetteur->getFichierBsd();
        $file = (object) new File($name);
        //make the path
        $emetteur->setFichierBsd($file);

        $form = $this->createForm(EmetteurType::class, $emetteur);
        $form->handleRequest($request);

        //save the name
        $oldFile = $file->getFilename();

        if ($form->isSubmitted() && $form->isValid()) {

            //if user make a new file
            if ($emetteur->getFichierBsd() != null) {

                //store the file
                $file = $emetteur->getFichierBsd();

                //the name
                $path = $emetteur->getIdBsd().'.'.$file->guessExtension();

                //move the file in the right path
                try {
                    $file->move($this->getParameter('file_directory'), $path);
                } catch (FileException $e) {
                    var_dump('error file upload :: '.$e);
                    die();
                }

                //store the name
                $emetteur->setFichierBsd($path);

            } else {
                //keep the same name
                $emetteur->setFichierBsd($oldFile);
            }

            $this->objectManager->flush();
            $this->addFlash('success', 'Vous avez bien modifié le BSD "'.$emetteur->getIdBsd().'"');
            return $this->redirectToRoute('back');

        }

        return $this->render('admin/backmodif.html.twig', [
            'result' => $emetteur,
            'formEmetteur' => $form->createView()
        ]);

    }

    /**
     * @param Request $request
     * @param Emetteur $emetteur
     * @return Response
     */
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