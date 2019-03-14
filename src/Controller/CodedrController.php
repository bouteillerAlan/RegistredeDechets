<?php namespace App\Controller;


use App\Entity\CodeDr;
use App\Form\CodeDrType;
use App\Repository\CodeDrRepository;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class CodedrController extends AbstractController {

    /**
     * @var CodeDrRepository
     */
    private $codeDrRepository;

    /**
     * @var ObjectManager
     */
    private $objectManager;

    public function __construct(CodeDrRepository $codeDrRepository, ObjectManager $objectManager)
    {
        $this->codeDrRepository = $codeDrRepository;
        $this->objectManager = $objectManager;
    }

    /**
     * @return Response
     */
    public function index () :Response
    {
        $result = $this->codeDrRepository->findAll();

        return $this->render('admin\codedr\codedr.show.html.twig', [
            'result' => $result
        ]);

    }

    /**
     * @param Request $request
     * @return Response
     */
    public function new (Request $request) :Response
    {
        $entity = new CodeDr();
        $form = $this->createForm(CodeDrType::class, $entity);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->objectManager->persist($entity);
            $this->objectManager->flush();
            $this->addFlash('success', 'Vous avez bien créé le Code D/R "'.$entity->getCode().'"');
            return $this->redirectToRoute('back.codedr');
        }

        return $this->render('admin/codedr/codedr.new.html.twig', [
           'form' => $form->createView()
        ]);
    }

    /**
     * @param CodeDr $codeDr
     * @param Request $request
     * @return Response
     */
    public function edit (CodeDr $codeDr, Request $request) :Response
    {
        $form = $this->createForm(CodeDrType::class, $codeDr);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->objectManager->flush();
            $this->addFlash('success', 'Vous avez bien édité le code D/R "'.$codeDr->getCode().'"');
            return $this->redirectToRoute('back.codedr');
        }
        return $this->render('admin/codedr/codedr.edit.html.twig', [
            'result' => $codeDr,
            'form' => $form->createView()
        ]);
    }

    /**
     * @param CodeDr $codeDr
     * @param Request $request
     * @return Response
     */
    public function delete (CodeDr $codeDr, Request $request) :Response
    {
        $token = $this->isCsrfTokenValid('delete'.$codeDr->getId(), $request->get('_token'));

        if ($token) {
            $this->objectManager->remove($codeDr);
            $this->objectManager->flush();
            $this->addFlash('success', 'Vous avez bien supprimé le code D/R "'.$codeDr->getCode().'"');
        } elseif (!$token) {
            $this->addFlash('error', 'Hu ho! I made a mistake with the token ¯\_(ツ)_/¯');
        }

        return $this->redirectToRoute('back.codedr');
    }

}