<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\EmetteurRepository")
 */
class Emetteur
{
    /**
     * @ORM\Id()
     * @ORM\GeneratedValue()
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\entreposage")
     * @ORM\JoinColumn(nullable=false)
     */
    private $entreposage;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\transporteur")
     * @ORM\JoinColumn(nullable=false)
     */
    private $transporteur;

    /**
     * @ORM\OneToOne(targetEntity="App\Entity\traitement", cascade={"persist", "remove"})
     * @ORM\JoinColumn(nullable=false)
     */
    private $traitement;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\codedr")
     * @ORM\JoinColumn(nullable=false)
     */
    private $code_dr;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $id_bsd;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $fichier_bsd;

    /**
     * @ORM\Column(type="datetime")
     */
    private $date_enlevement;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $designation;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $code_nomenclature;

    /**
     * @ORM\Column(type="decimal", precision=10, scale=5)
     */
    private $quantite;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $commentaire;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEntreposage(): ?entreposage
    {
        return $this->entreposage;
    }

    public function setEntreposage(?entreposage $entreposage): self
    {
        $this->entreposage = $entreposage;

        return $this;
    }

    public function getTransporteur(): ?transporteur
    {
        return $this->transporteur;
    }

    public function setTransporteur(?transporteur $transporteur): self
    {
        $this->transporteur = $transporteur;

        return $this;
    }

    public function getTraitement(): ?traitement
    {
        return $this->traitement;
    }

    public function setTraitement(traitement $traitement): self
    {
        $this->traitement = $traitement;

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

    public function getIdBsd(): ?string
    {
        return $this->id_bsd;
    }

    public function setIdBsd(string $id_bsd): self
    {
        $this->id_bsd = $id_bsd;

        return $this;
    }

    public function getFichierBsd(): ?string
    {
        return $this->fichier_bsd;
    }

    public function setFichierBsd(string $fichier_bsd): self
    {
        $this->fichier_bsd = $fichier_bsd;

        return $this;
    }

    public function getDateEnlevement(): ?\DateTimeInterface
    {
        return $this->date_enlevement;
    }

    public function setDateEnlevement(\DateTimeInterface $date_enlevement): self
    {
        $this->date_enlevement = $date_enlevement;

        return $this;
    }

    public function getDesignation(): ?string
    {
        return $this->designation;
    }

    public function setDesignation(string $designation): self
    {
        $this->designation = $designation;

        return $this;
    }

    public function getCodeNomenclature(): ?string
    {
        return $this->code_nomenclature;
    }

    public function setCodeNomenclature(string $code_nomenclature): self
    {
        $this->code_nomenclature = $code_nomenclature;

        return $this;
    }

    public function getQuantite()
    {
        return $this->quantite;
    }

    public function setQuantite($quantite): self
    {
        $this->quantite = $quantite;

        return $this;
    }

    public function getCommentaire(): ?string
    {
        return $this->commentaire;
    }

    public function setCommentaire(?string $commentaire): self
    {
        $this->commentaire = $commentaire;

        return $this;
    }
}
