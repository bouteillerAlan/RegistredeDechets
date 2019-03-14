<?php

namespace App\Repository;

use App\Entity\CodeDr;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\ORM\Query;
use Symfony\Bridge\Doctrine\RegistryInterface;

/**
 * @method CodeDr|null find($id, $lockMode = null, $lockVersion = null)
 * @method CodeDr|null findOneBy(array $criteria, array $orderBy = null)
 * @method CodeDr[]    findAll()
 * @method CodeDr[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CodeDrRepository extends ServiceEntityRepository
{
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, CodeDr::class);
    }

    /**
     * @return mixed
     */
    public function findTotal()
    {
        return $this->createQueryBuilder('c')
            ->select('COUNT(c)')
            ->getQuery()
            ->getResult()
            ;
    }


    /*
    public function findOneBySomeField($value): ?CodeDr
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
