<?php

namespace App\Repository;

use App\Entity\Emetteur;
use App\Entity\EmetteurSearch;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method Emetteur|null find($id, $lockMode = null, $lockVersion = null)
 * @method Emetteur|null findOneBy(array $criteria, array $orderBy = null)
 * @method Emetteur[]    findAll()
 * @method Emetteur[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class EmetteurRepository extends ServiceEntityRepository
{
    /**
     * EmetteurRepository constructor.
     * @param RegistryInterface $registry
     */
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Emetteur::class);
    }

    /**
     * @param $date
     * @return \DateTime
     * @throws \Exception
     */
    private function DateTransform ($date) {
        $d = new \DateTime ( \DateTime::createFromFormat('d/m/Y', $date)->format('Y-m-d'));
        return $d;
    }

    /**
     * @param $data
     * @param $type
     * @return Emetteur[]
     */
    public function findAllShorted ($data, $type)
    {
        return $this->findBy(array(), array($data => $type));
    }

    /**
     * @param EmetteurSearch $search
     * @return Query
     * @throws \Exception
     */
    public function findAllorSearch (EmetteurSearch $search)
    {
        $query = $this->createQueryBuilder('b')
            ->join('b.entreposage', 'p')->addSelect('p')
            ->join('b.mode_traitement', 'o')->addSelect('o')
            ->join('b.code_dr', 'i')->addSelect('i')
            ->join('b.code_dr_traitement', 'u')->addSelect('u')
            ->join('b.entreprise_traitement', 'y')->addSelect('y')
            ->join('b.transporteur', 't')->addSelect('t')
        ;

        if ($search->getCodeBsd()) {
            $query = $query->andWhere('b.id_bsd = :codebsd')->setParameter('codebsd', $search->getCodeBsd());
        }

        if ($search->getEntreprise()) {
            $query = $query->andWhere('p.nom = :entreprise')
                ->orWhere('y.nom = :entreprise')
                ->orWhere('t.nom = :entreprise')
                ->setParameter('entreprise', $search->getEntreprise());
        }

        if ($search->getDateMin()) {
            $query = $query->andWhere('b.date_enlevement >= :dateMin')
                ->setParameter('dateMin', $this->DateTransform($search->getDateMin()));
        }

        if ($search->getDateMax()) {
            $query = $query->andWhere('b.date_enlevement <= :dateMax')
                ->setParameter('dateMax', $this->DateTransform($search->getDateMax()));
        }

        return $query->orderBy('b.id', 'DESC')
            ->getQuery();
    }

}
