<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20190310174416 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('CREATE TABLE code_dr (id INT AUTO_INCREMENT NOT NULL, type VARCHAR(255) NOT NULL, code VARCHAR(255) NOT NULL, commentaire LONGTEXT DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE entreposage (id INT AUTO_INCREMENT NOT NULL, entreprise_id INT NOT NULL, INDEX IDX_2825F3ACA4AEAFEA (entreprise_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE entreprise (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, siret VARCHAR(255) NOT NULL, siren VARCHAR(255) NOT NULL, adresse VARCHAR(255) NOT NULL, recepisse VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE mode_traitement (id INT AUTO_INCREMENT NOT NULL, label VARCHAR(255) NOT NULL, commentaire LONGTEXT DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE traitement (id INT AUTO_INCREMENT NOT NULL, entreprise_id INT NOT NULL, code_dr_id INT NOT NULL, mode_traitement_id INT NOT NULL, date_admission DATETIME NOT NULL, date_traitement DATETIME NOT NULL, INDEX IDX_2A356D27A4AEAFEA (entreprise_id), INDEX IDX_2A356D271EF34BE9 (code_dr_id), INDEX IDX_2A356D27F99DEB1A (mode_traitement_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('CREATE TABLE transporteur (id INT AUTO_INCREMENT NOT NULL, entreprise_id INT NOT NULL, INDEX IDX_A2564975A4AEAFEA (entreprise_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ENGINE = InnoDB');
        $this->addSql('ALTER TABLE entreposage ADD CONSTRAINT FK_2825F3ACA4AEAFEA FOREIGN KEY (entreprise_id) REFERENCES entreprise (id)');
        $this->addSql('ALTER TABLE traitement ADD CONSTRAINT FK_2A356D27A4AEAFEA FOREIGN KEY (entreprise_id) REFERENCES entreprise (id)');
        $this->addSql('ALTER TABLE traitement ADD CONSTRAINT FK_2A356D271EF34BE9 FOREIGN KEY (code_dr_id) REFERENCES code_dr (id)');
        $this->addSql('ALTER TABLE traitement ADD CONSTRAINT FK_2A356D27F99DEB1A FOREIGN KEY (mode_traitement_id) REFERENCES mode_traitement (id)');
        $this->addSql('ALTER TABLE transporteur ADD CONSTRAINT FK_A2564975A4AEAFEA FOREIGN KEY (entreprise_id) REFERENCES entreprise (id)');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');

        $this->addSql('ALTER TABLE traitement DROP FOREIGN KEY FK_2A356D271EF34BE9');
        $this->addSql('ALTER TABLE entreposage DROP FOREIGN KEY FK_2825F3ACA4AEAFEA');
        $this->addSql('ALTER TABLE traitement DROP FOREIGN KEY FK_2A356D27A4AEAFEA');
        $this->addSql('ALTER TABLE transporteur DROP FOREIGN KEY FK_A2564975A4AEAFEA');
        $this->addSql('ALTER TABLE traitement DROP FOREIGN KEY FK_2A356D27F99DEB1A');
        $this->addSql('DROP TABLE code_dr');
        $this->addSql('DROP TABLE entreposage');
        $this->addSql('DROP TABLE entreprise');
        $this->addSql('DROP TABLE mode_traitement');
        $this->addSql('DROP TABLE traitement');
        $this->addSql('DROP TABLE transporteur');
    }
}