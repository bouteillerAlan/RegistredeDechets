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
     * @ORM\ManyToOne(targetEntity="App\Entity\Entreprise")
     * @ORM\JoinColumn(nullable=false)
     */
    private $entreposage;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Entreprise")
     * @ORM\JoinColumn(nullable=false)
     */
    private $transporteur;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\CodeDr")
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

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Entreprise")
     * @ORM\JoinColumn(nullable=false)
     */
    private $entreprise_traitement;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\Codedr")
     * @ORM\JoinColumn(nullable=false)
     */
    private $code_dr_traitement;

    /**
     * @ORM\ManyToOne(targetEntity="App\Entity\ModeTraitement")
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

    /**
     * @param $date
     * @return \DateTime
     * @throws \Exception
     */
    private function DateTransform ($date) {
        $d = new \DateTime ( \DateTime::createFromFormat('d/m/Y', $date)->format('Y-m-d H:i:s'));
        return $d;
    }

    public function getDateEnlevement(): ?\DateTime
    {
        return $this->date_enlevement;
    }

    public function setDateEnlevement(string $date_enlevement): self
    {
        $this->date_enlevement = $this->DateTransform($date_enlevement);

        return $this;
    }

    public function getDateAdmission(): ?\DateTime
    {
        return $this->date_admission;
    }

    public function setDateAdmission(string $date_admission): self
    {
        $this->date_admission = $this->DateTransform($date_admission);

        return $this;
    }

    public function getDateTraitement(): ?\DateTime
    {
        return $this->date_traitement;
    }

    public function setDateTraitement(string $date_traitement): self
    {
        $this->date_traitement = $this->DateTransform($date_traitement);

        return $this;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEntreposage(): ?entreprise
    {
        return $this->entreposage;
    }

    public function setEntreposage(?entreprise $entreposage): self
    {
        $this->entreposage = $entreposage;

        return $this;
    }

    public function getTransporteur(): ?entreprise
    {
        return $this->transporteur;
    }

    public function setTransporteur(?entreprise $transporteur): self
    {
        $this->transporteur = $transporteur;

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

    public function getEntrepriseTraitement(): ?entreprise
    {
        return $this->entreprise_traitement;
    }

    public function setEntrepriseTraitement(?entreprise $entreprise): self
    {
        $this->entreprise_traitement = $entreprise;

        return $this;
    }

    public function getCodeDrTraitement(): ?codedr
    {
        return $this->code_dr_traitement;
    }

    public function setCodeDrTraitement(?codedr $code_dr): self
    {
        $this->code_dr_traitement = $code_dr;

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

}
