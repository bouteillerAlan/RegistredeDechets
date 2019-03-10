<?php

namespace App\Repository;

use App\Entity\Entreposage;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method Entreposage|null find($id, $lockMode = null, $lockVersion = null)
 * @method Entreposage|null findOneBy(array $criteria, array $orderBy = null)
 * @method Entreposage[]    findAll()
 * @method Entreposage[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class EntreposageRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Entreposage::class);
    }

    // /**
    //  * @return Entreposage[] Returns an array of Entreposage objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('e.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?Entreposage
    {
        return $this->createQueryBuilder('e')
            ->andWhere('e.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
