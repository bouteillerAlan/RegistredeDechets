<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\TraitementRepository")
 */
class Traitement
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\entreprise")
     * @ORM\JoinColumn(nullable=false)
     */
    private $entreprise;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\codedr")
     * @ORM\JoinColumn(nullable=false)
     */
    private $code_dr;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\modetraitement")
     * @ORM\JoinColumn(nullable=false)
     */
    private $mode_traitement;

    /**
     * @ORM\Column(type="datetime")
     */
    private $date_admission;

    /**
     * @ORM\Column(type="datetime")
     */
    private $date_traitement;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEntreprise(): ?entreprise
    {
        return $this->entreprise;
    }

    public function setEntreprise(?entreprise $entreprise): self
    {
        $this->entreprise = $entreprise;

        return $this;
    }

    public function getCodeDr(): ?codedr
    {
        return $this->code_dr;
    }

    public function setCodeDr(?codedr $code_dr): self
    {
        $this->code_dr = $code_dr;

        return $this;
    }

    public function getModeTraitement(): ?modetraitement
    {
        return $this->mode_traitement;
    }

    public function setModeTraitement(?modetraitement $mode_traitement): self
    {
        $this->mode_traitement = $mode_traitement;

        return $this;
    }

    public function getDateAdmission(): ?\DateTimeInterface
    {
        return $this->date_admission;
    }

    public function setDateAdmission(\DateTimeInterface $date_admission): self
    {
        $this->date_admission = $date_admission;

        return $this;
    }

    public function getDateTraitement(): ?\DateTimeInterface
    {
        return $this->date_traitement;
    }

    public function setDateTraitement(\DateTimeInterface $date_traitement): self
    {
        $this->date_traitement = $date_traitement;

        return $this;
    }
}
