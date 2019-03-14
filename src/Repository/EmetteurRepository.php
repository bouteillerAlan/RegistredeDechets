<?php

namespace App\Repository;

use App\Entity\Emetteur;
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
    public function __construct(RegistryInterface $registry)
    {
        parent::__construct($registry, Emetteur::class);
    }

}
