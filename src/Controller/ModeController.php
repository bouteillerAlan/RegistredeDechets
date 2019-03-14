<?php namespace App\Controller;


use App\Entity\ModeTraitement;
use App\Form\ModeTraitementType;
use App\Repository\ModeTraitementRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class ModeController extends AbstractController {

    /**
     * @var ModeTraitementRepository
     */
    private $modeTraitementRepository;

    /**
     * @var ObjectManager
     */
    private $objectManager;

    public function __construct(ModeTraitementRepository $modeTraitementRepository, ObjectManager $objectManager)
    {
        $this->modeTraitementRepository = $modeTraitementRepository;
        $this->objectManager = $objectManager;
    }

    /**
     * @return Response
     */
    public function index () :Response
    {
        $result = $this->modeTraitementRepository->findAll();

        return $this->render('admin\mode\mode.show.html.twig', [
            'result' => $result
        ]);

    }

    /**
     * @param Request $request
     * @return Response
     */
    public function new (Request $request) :Response
    {
        $entity = new ModeTraitement();
        $form = $this->createForm(ModeTraitementType::class, $entity);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->objectManager->persist($entity);
            $this->objectManager->flush();
            $this->addFlash('success', 'Vous avez bien créé le mode de traitement "'.$entity->getLabel().'"');
            return $this->redirectToRoute('back.mode');
        }

        return $this->render('admin/mode/mode.new.html.twig', [
           'form' => $form->createView()
        ]);
    }

    /**
     * @param ModeTraitement $modeTraitement
     * @param Request $request
     * @return Response
     */
    public function edit (ModeTraitement $modeTraitement, Request $request) :Response
    {
        $form = $this->createForm(ModeTraitementType::class, $modeTraitement);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->objectManager->flush();
            $this->addFlash('success', 'Vous avez bien édité le mode de traitement "'.$modeTraitement->getLabel().'"');
            return $this->redirectToRoute('back.mode');
        }
        return $this->render('admin/mode/mode.edit.html.twig', [
            'result' => $modeTraitement,
            'form' => $form->createView()
        ]);
    }

    /**
     * @param ModeTraitement $modeTraitement
     * @param Request $request
     * @return Response
     */
    public function delete (ModeTraitement $modeTraitement, Request $request) :Response
    {
        $token = $this->isCsrfTokenValid('delete'.$modeTraitement->getId(), $request->get('_token'));

        if ($token) {
            $this->objectManager->remove($modeTraitement);
            $this->objectManager->flush();
            $this->addFlash('success', 'Vous avez bien supprimé le mode de traitement "'.$modeTraitement->getLabel().'"');
        } elseif (!$token) {
            $this->addFlash('error', 'Hu ho! I made a mistake with the token ¯\_(ツ)_/¯');
        }

        return $this->redirectToRoute('back.mode');
    }

}