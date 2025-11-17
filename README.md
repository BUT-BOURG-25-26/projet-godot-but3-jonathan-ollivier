# Supermarket Alone

Jonathan OLLIVIER

Même concept que Supermarket Together, mais sans le multijoueur. Le projet étant assez complexe, il est jouable sur téléphone mais est plutot conçu pour être joué sur PC. J'ai essayé de produire le code le + clean possible en appliquant des principes de base de qualité de développement (Séparation des responsabilités, design pattern Oberver, utilisation d'héritage...), ce qui fait que le projet est facilement extensible (ex: rajouter un nouvel article se fait par la simple création d'une ressource Godot, directement via l'interface de l'éditeur).


# Points

## Mouvements du joueur (2 pts)

déplacement libre, saut

## Actions du personnage (2 pts) 

porter des cartons, placer des produits dans les rayons, frapper les clients, rendre la monnaie, placer des meubles (frigo, caisse, rayon)

## Gameplay elements (2 pts)

Apparition de NPC, qui prennent des produits et passent en caisse pour les payer, besoin de remplir à nouveau les rayons vides

## Génération du niveau (2 pts)

(discuté ensemble) pas vraiment de sens dans le projet, les NPC apparaissent à une position aléatoire, et les éléments peuvent être placés manuellement par le joueur

## Game Loop (2 pts)

Les NPC apparaissent à l'infini, achetent des produits (qu'on vend avec une marge de profit), on rachete des produits, on agrandit le magasin en placant de nouveaux rayons pour proposer + de produits...

## UI (2 pts)

Menu principal, "game over", si le joueur déclare la banqueroute avec des statistiques sur la partie

## Gestion du score (1pts)

La monnaie fait office de score

## Fournir une APK (1 pts)

/

## Bonus (6 pts)

Originalité du jeu, projet ambitieux
