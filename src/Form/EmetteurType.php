<?php

namespace App\Form;

use App\Entity\CodeDr;
use App\Entity\Emetteur;
use App\Entity\Entreprise;
use App\Entity\ModeTraitement;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EmetteurType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('id_bsd', TextType::class)
            ->add('designation', TextType::class)
            ->add('code_nomenclature', TextType::class)
            ->add('quantite', NumberType::class)
            ->add('commentaire', TextType::class, [
                'required' => false
            ])
            ->add('fichier_bsd', FileType::class, [
                'required' => true
            ])

            //mode traitement
            ->add('mode_traitement', EntityType::class, [
                'class' => ModeTraitement::class,
                'choice_label' => 'label',
                'multiple' => false
            ])

            //code dr
            ->add('code_dr', EntityType::class, [
                'class' => CodeDr::class,
                'choice_label' => 'code',
                'multiple' => false
            ])
            ->add('code_dr_traitement', EntityType::class, [
                'class' => CodeDr::class,
                'choice_label' => 'code',
                'multiple' => false
            ])


            //entreprises
            ->add('entreposage', EntityType::class, [
                'class' => Entreprise::class,
                'choice_label' => 'nom',
                'multiple' => false
            ])
            ->add('entreprise_traitement', EntityType::class, [
                'class' => Entreprise::class,
                'choice_label' => 'nom',
                'multiple' => false
            ])
            ->add('transporteur', EntityType::class, [
                'class' => Entreprise::class,
                'choice_label' => 'nom',
                'multiple' => false
            ])

            //date
            ->add('date_enlevement', TextType::class, [
                'attr' => ['class' => 'datepicker'],
            ])
            ->add('date_admission', TextType::class, [
                'attr' => ['class' => 'datepicker'],
            ])
            ->add('date_traitement', TextType::class, [
                'attr' => ['class' => 'datepicker'],
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Emetteur::class,
        ]);
    }
}
