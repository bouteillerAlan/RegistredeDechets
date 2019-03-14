<?php

namespace App\Repository;

use App\Entity\ModeTraitement;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method ModeTraitement|null find($id, $lockMode = null, $lockVersion = null)
 * @method ModeTraitement|null findOneBy(array $criteria, array $orderBy = null)
 * @method ModeTraitement[]    findAll()
 * @method ModeTraitement[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ModeTraitementRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, ModeTraitement::class);
    }

    /**
     * @return mixed
     */
    public function findTotal()
    {
        return $this->createQueryBuilder('m')
            ->select('COUNT(m)')
            ->getQuery()
            ->getResult()
            ;
    }

    // /**
    //  * @return ModeTraitement[] Returns an array of ModeTraitement objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('m')
            ->andWhere('m.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('m.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?ModeTraitement
    {
        return $this->createQueryBuilder('m')
            ->andWhere('m.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
