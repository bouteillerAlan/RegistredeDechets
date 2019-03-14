<?php namespace App\Entity;

use DateTime;

class EmetteurSearch {

    /**
     * @var string|null
     */
    private $codeBsd;

    /**
     * @var string|null
     */
    private $entreprise;

    /**
     * @var datetime|null
     */
    private $dateMin;

    /**
     * @var datetime|null
     */
    private $dateMax;

    /**
     * @param $date
     * @return \DateTime
     * @throws \Exception
     */
    private function DateTransform ($date) {
        $d = new \DateTime ( \DateTime::createFromFormat('d/m/Y', $date)->format('Y-m-d H:i:s'));
        return $d;
    }

    /**
     * @param $date
     * @param $format
     * @return null
     */
    private function dateToString ($date, $format) {
        if ($date === null) {
            return null;
        } else {
            return $date->format($format);
        }
    }

    /**
     * @param string|null $codeBsd
     * @return EmetteurSearch
     */
    public function setCodeBsd(string $codeBsd): EmetteurSearch
    {
        $this->codeBsd = $codeBsd;
        return $this;
    }

    /**
     * @return string|null
     */
    public function getCodeBsd(): ?string
    {
        return $this->codeBsd;
    }

    /**
     * @param string|null $entreprise
     * @return EmetteurSearch
     */
    public function setEntreprise(string $entreprise): EmetteurSearch
    {
        $this->entreprise = $entreprise;
        return $this;
    }

    /**
     * @return string|null
     */
    public function getEntreprise(): ?string
    {
        return $this->entreprise;
    }

    /**
     * @param string $dateMin
     * @return EmetteurSearch
     * @throws \Exception
     */
    public function setDateMin(string $dateMin): EmetteurSearch
    {
        $this->dateMin = $this->DateTransform($dateMin);
        return $this;
    }

    /**
     * @return string|null
     */
    public function getDateMin(): ?string
    {
        return $this->dateToString($this->dateMin, 'd/m/Y');
    }

    /**
     * @param string $dateMax
     * @return EmetteurSearch
     * @throws \Exception
     */
    public function setDateMax(string $dateMax): EmetteurSearch
    {
        $this->dateMax = $this->DateTransform($dateMax);
        return $this;
    }

    /**
     * @return string|null
     */
    public function getDateMax(): ?string
    {
        return $this->dateToString($this->dateMax, 'd/m/Y');
    }


}
