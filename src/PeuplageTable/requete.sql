## CODE DR
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('D', 'D 1','Dépôt sur ou dans le sol (par exemple, mise en décharge, etc.) ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('D', 'D 2','Traitement en milieu terrestre (par exemple, biodégradation de déchets liquides ou de boues dans les sols, etc.) ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('D', 'D 3','Injection en profondeur (par exemple, injection des déchets pompables dans des puits, des dômes de sel ou des failles géologiques naturelles, etc.) ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('D', 'D 4','Lagunage (par exemple, déversement de déchets liquides ou de boues dans des puits, des étangs ou des bassins, etc.) ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('D', 'D 5','Mise en décharge spécialement aménagée (par exemple, placement dans des alvéoles étanches séparées, recouvertes et isolées les unes et les autres et de l’environnement, etc.) ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('D', 'D 6','Rejet dans le milieu aquatique sauf l’immersion ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('D', 'D 7','Immersion, y compris enfouissement dans le sous-sol marin ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('D', 'D 8','Traitement biologique non spécifié ailleurs dans la présente annexe, aboutissant à des composés ou à des mélanges qui sont éliminés selon l’un des procédés numérotés D 1 à D 12 ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('D', 'D 9','Traitement physico-chimique non spécifié ailleurs dans la présente annexe, aboutissant à des composés ou à des mélanges qui sont éliminés selon l’un des procédés numérotés D 1 à D 12 (par exemple, évaporation, séchage, calcination, etc.) ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('D', 'D 10','Incinération à terre ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('D', 'D 11','Incinération en mer ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('D', 'D 12','Stockage permanent (par exemple, placement de conteneurs dans une mine, etc.) ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('D', 'D 13','Regroupement préalablement à l’une des opérations numérotées D 1 à D 12 ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('D', 'D 14','Reconditionnement préalablement à l’une des opérations numérotées D 1 à D 13 ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('D', 'D 15','Stockage préalablement à l’une des opérations numérotées D 1 à D 14 (à l’exclusion du stockage temporaire, avant collecte, sur le site de production). ');

INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('R', 'R 1','Utilisation principale comme combustible ou autre moyen de produire de l’énergie ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('R', 'R 2','Récupération ou régénération des solvants ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('R', 'R 3','Recyclage ou récupération des substances organiques qui ne sont pas utilisées comme solvants (y compris les opérations de compostage et autres transformations biologiques) ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('R', 'R 4','Recyclage ou récupération des métaux et des composés métalliques ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('R', 'R 5','Recyclage ou récupération d’autres matières inorganiques ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('R', 'R 6','Régénération des acides ou des bases ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('R', 'R 7','Récupération des produits servant à capter les polluants ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('R', 'R 8','Récupération des produits provenant des catalyseurs ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('R', 'R 9','Régénération ou autres réemplois des huiles ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('R', 'R 10','Épandage sur le sol au profit de l’agriculture ou de l’écologie ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('R', 'R 11','Utilisation de déchets résiduels obtenus à partir de l’une des opérations numérotées R 1 à R 10 ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('R', 'R 12','Échange de déchets en vue de les soumettre à l’une des opérations numérotées R 1 à R 11 ');
INSERT INTO `code_dr` (`type`, `code`, `commentaire`) VALUES ('R', 'R 13','Stockage de déchets préalablement à l’une des opérations numérotées R 1 à R 12 (à l’exclusion du stockage temporaire, avant collecte, sur le site de production). ');

## ENTREPRISE
INSERT INTO `entreprise` (`nom`, `siret`, `siren`, `adresse`, `recepisse`) VALUES ('CRI33', '84810113500012','848101135','1 le Chai 33410 LOUPIAC','2019-T-021');

## MODE TRAITEMENT
INSERT INTO `mode_traitement` (`label`, `commentaire`) VALUES ('Regroupement avant valorisation', '');

## USER
# it's a default user admin:admin
# change before prod
INSERT INTO `user` (`name`, `password`) VALUES ('admin', '$12$yG4DvY5VMPpHDUfpIIRNo.iusVy0pBQZcwJbqk7A2adbmZ.kZt6rW');
INSERT INTO `user` (`name`, `password`) VALUES ('backup', '$13$MOVtvkLpZBQSglOROaVcuOGok02IhDbzJRDmzdTgnk6vk9i8x17g.');

## EMETTEUR
INSERT INTO `emetteur` (`code_dr_id`, `entreposage_id`, `transporteur_id`, `entreprise_traitement_id`, `code_dr_traitement_id`, `mode_traitement_id`, `id_bsd`, `fichier_bsd`, `date_enlevement`, `designation`, `code_nomenclature`, `quantite`, `date_admission`, `date_traitement`, `commentaire`) VALUES (5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20 17:36:16', 'designation', 'code nomen', 1.50000, '2019-03-28 17:36:16', '2019-03-30 17:36:16', 'commentaire');
