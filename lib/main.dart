import 'package:flutter/material.dart';

import 'deck_api.dart';
import 'models.dart';
import 'study_screens.dart';

const _deckPalette = <Color>[
  Color(0xFF8C4A32),
  Color(0xFF6F5B35),
  Color(0xFFA65A3F),
  Color(0xFF765044),
  Color(0xFF9B673D),
  Color(0xFF5E6241),
  Color(0xFFB36A45),
  Color(0xFF684638),
];

void main() => runApp(const MemoireApp());

class MemoireApp extends StatelessWidget {
  const MemoireApp({super.key, this.apiClient = const HttpDeckApiClient()});

  final DeckApiClient apiClient;

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Memoire',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFFAF6F0),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF805238),
        surface: const Color(0xFFFFFCF7),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFFAF6F0),
        surfaceTintColor: Colors.transparent,
      ),
      cardTheme: const CardThemeData(
        color: Color(0xFFFFFCF7),
        surfaceTintColor: Colors.transparent,
      ),
    ),
    home: AppHome(apiClient: apiClient),
  );
}

class AppHome extends StatefulWidget {
  const AppHome({super.key, required this.apiClient});

  final DeckApiClient apiClient;

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int _tab = 0;
  final List<Deck> _decks = [
    Deck(
      'Essential English',
      'Languages',
      const Color(0xFF8C4A32),
      Icons.translate_rounded,
      [
        StudyCard('To figure out', 'To understand or find the answer.'),
        StudyCard('A challenge', 'A difficult task that tests your abilities.'),
        StudyCard('Eventually', 'In the end, especially after some time.'),
        StudyCard('To achieve', 'To succeed in reaching a goal.'),
        StudyCard('A habit', 'Something you do regularly.'),
        StudyCard('Although', 'Despite the fact that; even though.'),
        StudyCard('To improve', 'To make or become better.'),
        StudyCard('A goal', 'Something you want to achieve.'),
        StudyCard('To remind', 'To help someone remember something.'),
        StudyCard('A choice', 'An act of selecting between options.'),
        StudyCard('To avoid', 'To keep away from or prevent something.'),
        StudyCard('However', 'Despite that; used to introduce a contrast.'),
        StudyCard('To expect', 'To think that something will happen.'),
        StudyCard('A mistake', 'Something that is incorrect.'),
        StudyCard('To realize', 'To become aware of or understand something.'),
        StudyCard('A skill', 'An ability to do something well.'),
        StudyCard(
          'To borrow',
          'To take something temporarily and return it later.',
        ),
        StudyCard('Quiet', 'Making little or no noise.'),
        StudyCard('To afford', 'To have enough money or time for something.'),
        StudyCard('Advice', 'A suggestion about what someone should do.'),
      ],
    ),
    Deck(
      'Python Basics',
      'Development',
      const Color(0xFF6F5B35),
      Icons.code_rounded,
      [
        StudyCard('What does len() do?', 'It returns the length of an object.'),
        StudyCard(
          'How do you create a list?',
          'Use square brackets: [1, 2, 3].',
        ),
        StudyCard('How do you display text?', 'Use print("Hello").'),
        StudyCard(
          'How do you create a variable?',
          'Assign a value, for example name = "Ada".',
        ),
        StudyCard('Which type represents an integer?', 'int'),
        StudyCard('Which type represents a decimal number?', 'float'),
        StudyCard('Which type represents True or False?', 'bool'),
        StudyCard('How do you write a comment?', 'Start it with the # symbol.'),
        StudyCard(
          'What does input() do?',
          'It asks the user to enter a value.',
        ),
        StudyCard(
          'How do you convert a value to an integer?',
          'Use int(value).',
        ),
        StudyCard('How do you test a condition?', 'Use an if statement.'),
        StudyCard('How do you add an alternative branch?', 'Use else or elif.'),
        StudyCard('How do you iterate over a list?', 'Use a for loop.'),
        StudyCard(
          'How do you repeat an action?',
          'Use a for loop or a while loop.',
        ),
        StudyCard('How do you define a function?', 'Use def function_name():.'),
        StudyCard(
          'What does return do?',
          'It sends a value back from a function.',
        ),
        StudyCard(
          'How do you create a dictionary?',
          'Use curly braces with key-value pairs.',
        ),
        StudyCard('What is the index of the first item?', 'Index 0.'),
        StudyCard(
          'How do you add an item to a list?',
          'Use list.append(item).',
        ),
        StudyCard(
          'What does import do?',
          'It makes code from a module available.',
        ),
      ],
    ),
    Deck(
      'Human Anatomy',
      'Biology',
      const Color(0xFFA65A3F),
      Icons.favorite_rounded,
      [
        StudyCard('Which organ pumps blood?', 'The heart.'),
        StudyCard('Which organs help you breathe?', 'The lungs.'),
        StudyCard('About how many bones are in an adult body?', '206 bones.'),
        StudyCard('What is the largest organ in the body?', 'The skin.'),
        StudyCard(
          'Which organs filter blood and produce urine?',
          'The kidneys.',
        ),
        StudyCard('Which organs digest food?', 'The stomach and intestines.'),
        StudyCard('Which bone protects the brain?', 'The skull.'),
        StudyCard('Which muscle helps you breathe?', 'The diaphragm.'),
        StudyCard('Which organ produces insulin?', 'The pancreas.'),
        StudyCard('Where is the femur?', 'In the thigh.'),
        StudyCard(
          'What is the role of red blood cells?',
          'To carry oxygen through the blood.',
        ),
        StudyCard(
          'What is the role of white blood cells?',
          'To help defend the body against infection.',
        ),
        StudyCard('Which organ controls the nervous system?', 'The brain.'),
        StudyCard('How many chambers does the human heart have?', 'Four.'),
        StudyCard(
          'What is the role of the small intestine?',
          'To absorb most nutrients from food.',
        ),
        StudyCard('What fluid lubricates the joints?', 'Synovial fluid.'),
        StudyCard('What is the upper-arm bone called?', 'The humerus.'),
        StudyCard('What connects muscles to bones?', 'Tendons.'),
        StudyCard('What connects bones to each other?', 'Ligaments.'),
        StudyCard(
          'What is one main role of the liver?',
          'To process nutrients and help remove substances from the body.',
        ),
      ],
    ),
    Deck('Docker & DevOps', 'DevOps', const Color(0xFF5E6241), Icons.sailing_rounded, [
      StudyCard(
        'Quel problème Docker résout-il principalement ?',
        'Il empaquette l’application et ses dépendances dans un environnement reproductible, limitant les écarts entre développement, test et production.',
      ),
      StudyCard(
        'Quelle différence entre une image Docker et un conteneur ?',
        'Une image est un modèle en lecture seule ; un conteneur est une instance exécutable de cette image, avec une couche inscriptible.',
      ),
      StudyCard(
        'Que signifie « image en couches » et pourquoi est-ce utile ?',
        'Une image est composée de couches réutilisables et mises en cache. Cela économise du stockage et accélère les builds lorsque les couches précédentes n’ont pas changé.',
      ),
      StudyCard(
        'Docker utilise-t-il un noyau différent pour chaque conteneur ?',
        'Non. Les conteneurs partagent le noyau de l’hôte ; une VM possède son propre système invité. Les conteneurs démarrent généralement plus vite, mais isolent moins fortement.',
      ),
      StudyCard(
        'Pourquoi traiter un conteneur comme éphémère ?',
        'On le remplace plutôt que de le maintenir en modifiant son système de fichiers. La configuration est externalisée, les données persistantes placées dans des volumes et les journaux envoyés vers stdout/stderr.',
      ),
      StudyCard(
        'Quelles sont les étapes habituelles pour créer et lancer une image ?',
        'Écrire un Dockerfile, construire avec `docker build -t app:1.0 .`, démarrer avec `docker run`, inspecter l’exécution puis arrêter et supprimer le conteneur.',
      ),
      StudyCard(
        'À quoi sert l’instruction FROM ?',
        'Elle définit l’image de base depuis laquelle le build commence. Choisir une image maintenue et adaptée à l’application réduit la surface d’attaque et les dépendances inutiles.',
      ),
      StudyCard(
        'Que fait WORKDIR dans un Dockerfile ?',
        'Elle définit le répertoire de travail des instructions suivantes et du processus, en créant le répertoire s’il manque.',
      ),
      StudyCard(
        'Quelle différence entre COPY et ADD ?',
        'COPY copie des fichiers locaux du contexte de build. ADD offre aussi des fonctions supplémentaires, comme l’extraction d’archives locales ; préférer COPY sauf besoin explicite de ces fonctions.',
      ),
      StudyCard(
        'Quelle différence entre RUN, CMD et ENTRYPOINT ?',
        'RUN s’exécute pendant le build et crée une couche. CMD fournit la commande ou les arguments par défaut au démarrage. ENTRYPOINT définit le programme principal du conteneur.',
      ),
      StudyCard(
        'Que fait EXPOSE dans un Dockerfile ?',
        'Elle documente le port que l’application écoute dans le conteneur ; elle ne publie pas ce port sur l’hôte. Pour le publier, utiliser par exemple `docker run -p 8080:80 image`.',
      ),
      StudyCard(
        'Pourquoi ajouter un fichier .dockerignore ?',
        'Il exclut du contexte de build des fichiers inutiles ou sensibles, comme `.git`, les dépendances locales ou des fichiers de configuration, ce qui réduit la taille et les risques de fuite.',
      ),
      StudyCard(
        'Comment optimiser le cache lors d’un build applicatif ?',
        'Copier d’abord les manifestes de dépendances, installer celles-ci, puis copier le code source. Une modification du code ne force ainsi pas la réinstallation des dépendances.',
      ),
      StudyCard(
        'À quoi sert un build multi-stage ?',
        'Il sépare les étapes de compilation et l’image d’exécution finale. On ne copie dans celle-ci que les artefacts requis, ce qui réduit sa taille et évite d’y inclure les outils de build.',
      ),
      StudyCard(
        'Pourquoi exécuter un conteneur avec un utilisateur non-root ?',
        'Pour limiter l’impact d’une compromission : le processus dispose de moins de privilèges que s’il s’exécutait en root.',
      ),
      StudyCard(
        'Pourquoi épingler une version d’image plutôt que d’utiliser latest ?',
        'Un tag explicite rend les déploiements plus prévisibles. Pour une immutabilité maximale, référencer l’image par digest et mettre à jour volontairement ses versions.',
      ),
      StudyCard(
        'Quel est le rôle d’un registre d’images ?',
        'Stocker et distribuer des images. Un pipeline peut y pousser une image construite, puis les environnements de déploiement la récupérer.',
      ),
      StudyCard(
        'Qu’est-ce que le contexte de build Docker ?',
        'L’ensemble des fichiers transmis au moteur pour construire l’image. Le chemin final de `docker build` le désigne ; un contexte réduit accélère le build et limite les fichiers accessibles par COPY.',
      ),
      StudyCard(
        'Quelle différence entre `docker run` et `docker start` ?',
        '`docker run` crée un nouveau conteneur à partir d’une image et le démarre. `docker start` redémarre un conteneur déjà créé.',
      ),
      StudyCard(
        'Que signifient `-d`, `--name` et `-p` dans docker run ?',
        '`-d` lance en arrière-plan, `--name` attribue un nom au conteneur et `-p hôte:conteneur` publie un port du conteneur sur l’hôte.',
      ),
      StudyCard(
        'Comment consulter les conteneurs, les journaux et la configuration ?',
        '`docker ps` liste les conteneurs actifs, `docker ps -a` inclut les arrêtés, `docker logs -f nom` suit les logs et `docker inspect nom` affiche les détails.',
      ),
      StudyCard(
        'Quand utiliser `docker exec` plutôt que `docker run` ?',
        '`docker exec` lance une commande dans un conteneur déjà actif, par exemple `docker exec -it web sh`. `docker run` crée un nouveau conteneur.',
      ),
      StudyCard(
        'Un conteneur « running » garantit-il que l’application fonctionne ?',
        'Non. Cela indique surtout que son processus principal tourne. Un HEALTHCHECK peut vérifier l’état applicatif, mais il faut aussi surveiller les métriques et les dépendances.',
      ),
      StudyCard(
        'Comment diagnostiquer un conteneur qui s’arrête immédiatement ?',
        'Examiner `docker logs`, `docker inspect` et le code de sortie ; vérifier la commande de démarrage, la configuration, les permissions et les dépendances nécessaires.',
      ),
      StudyCard(
        'Quelle différence entre volume Docker et bind mount ?',
        'Un volume est géré par Docker et convient aux données persistantes. Un bind mount relie un chemin précis de l’hôte au conteneur, souvent pratique en développement.',
      ),
      StudyCard(
        'Que devient la donnée stockée dans un volume si le conteneur est supprimé ?',
        'Elle persiste indépendamment du cycle de vie du conteneur, sauf si le volume lui-même est supprimé.',
      ),
      StudyCard(
        'À quoi sert un réseau Docker défini par l’utilisateur ?',
        'À relier les conteneurs. Sur un réseau user-defined, ils peuvent généralement se joindre par nom de conteneur ou de service.',
      ),
      StudyCard(
        'Faut-il publier un port pour que deux conteneurs communiquent ?',
        'Non, pas s’ils communiquent sur le même réseau Docker. La publication `-p` sert à rendre un port accessible depuis l’hôte ou l’extérieur.',
      ),
      StudyCard(
        'À quoi sert Docker Compose ?',
        'À décrire et gérer une application multi-conteneurs — services, réseaux, volumes et configuration — à partir d’un fichier Compose.',
      ),
      StudyCard(
        'Pourquoi `depends_on` ne suffit-il pas toujours à garantir qu’une dépendance est prête ?',
        'Il peut ordonner le démarrage, mais un service peut être démarré sans être prêt à répondre. Utiliser un healthcheck et une condition de santé lorsque c’est pris en charge, et rendre l’application tolérante aux retries.',
      ),
      StudyCard(
        'Pourquoi définir des limites CPU et mémoire pour un conteneur ?',
        'Pour limiter la consommation de ressources et protéger les autres charges de travail. Une limite mémoire dépassée peut provoquer un arrêt OOM.',
      ),
      StudyCard(
        'À quoi sert une politique de redémarrage ?',
        'À préciser si Docker doit relancer un conteneur après son arrêt ou celui du moteur. Elle ne remplace ni la supervision ni le diagnostic de la cause.',
      ),
      StudyCard(
        'Comment gérer les secrets nécessaires à une application conteneurisée ?',
        'Ne pas les intégrer dans l’image ni les committer dans le dépôt. Utiliser un gestionnaire de secrets ou le mécanisme sécurisé de la plateforme, et limiter les accès.',
      ),
      StudyCard(
        'Quelles vérifications de sécurité faire sur une image ?',
        'Utiliser une image de base maintenue et minimale, analyser ses vulnérabilités, appliquer les mises à jour, limiter les privilèges et éviter les secrets dans les couches.',
      ),
      StudyCard(
        'Pourquoi le socket Docker est-il sensible ?',
        'Un accès au socket donne souvent des capacités très élevées sur l’hôte, notamment la création de conteneurs privilégiés. Ne pas le monter ou l’exposer sans nécessité et contrôle strict.',
      ),
      StudyCard(
        'Que vérifier si le conteneur est tué avec un état OOM ?',
        'Vérifier la mémoire utilisée et les limites, rechercher une fuite ou un pic de charge, puis ajuster l’application ou ses ressources avec des valeurs adaptées.',
      ),
      StudyCard(
        'Comment Docker s’intègre-t-il dans un pipeline CI/CD ?',
        'Le pipeline peut tester le code, construire et analyser l’image, la publier avec un tag traçable dans un registre, puis déclencher son déploiement.',
      ),
      StudyCard(
        'Docker remplace-t-il Kubernetes ?',
        'Non. Docker fournit notamment des outils de build et d’exécution de conteneurs. Kubernetes orchestre le déploiement et l’exploitation de charges conteneurisées sur un cluster.',
      ),
      StudyCard(
        'Pourquoi envoyer les logs d’un conteneur vers stdout et stderr ?',
        'Les plateformes peuvent les collecter et les centraliser sans dépendre de fichiers de logs conservés dans le système de fichiers éphémère du conteneur.',
      ),
      StudyCard(
        'Pourquoi préférer la forme exec pour CMD ou ENTRYPOINT ?',
        'La forme JSON, par exemple `CMD ["node", "server.js"]`, lance directement le processus afin qu’il reçoive correctement les signaux d’arrêt.',
      ),
      StudyCard(
        'Quelles étapes suivre pour réduire la taille d’une image ?',
        'Choisir une base adaptée, limiter les paquets et les fichiers copiés, exploiter le cache, nettoyer les artefacts temporaires et utiliser un build multi-stage.',
      ),
      StudyCard(
        'Dans quels cas Docker n’est-il pas automatiquement le meilleur choix ?',
        'Quand il faut un noyau spécifique, une isolation forte pour du code non fiable, une application graphique de bureau, ou lorsqu’une application simple fonctionne déjà sans bénéfice à la conteneuriser.',
      ),
    ]),
    Deck('Linux & DevOps', 'Linux', const Color(0xFF6F5B35), Icons.terminal_rounded, [
      StudyCard(
        'Quelle différence entre le noyau Linux, une distribution et un shell ?',
        'Le noyau gère les ressources et le matériel. Une distribution assemble le noyau et les outils système. Le shell interprète les commandes, par exemple Bash ou Zsh.',
      ),
      StudyCard(
        'Que représentent les répertoires `/etc`, `/var`, `/home`, `/tmp` et `/proc` ?',
        '`/etc` contient la configuration système, `/var` les données variables comme les logs, `/home` les répertoires utilisateurs, `/tmp` les fichiers temporaires et `/proc` des informations exposées par le noyau.',
      ),
      StudyCard(
        'Comment vérifier le répertoire courant et lister les fichiers cachés avec leurs détails ?',
        '`pwd` affiche le répertoire courant ; `ls -la` liste les fichiers, y compris les fichiers cachés, avec leurs permissions et propriétaires.',
      ),
      StudyCard(
        'Quelle différence entre un chemin absolu et un chemin relatif ?',
        'Un chemin absolu commence à la racine `/`. Un chemin relatif est interprété depuis le répertoire courant ; `.` désigne le répertoire courant et `..` son parent.',
      ),
      StudyCard(
        'Comment suivre en temps réel les nouvelles lignes d’un journal ?',
        'Utiliser `tail -f /chemin/du/log` ; `tail -F` est souvent préférable quand le fichier peut être recréé lors d’une rotation.',
      ),
      StudyCard(
        'Comment rechercher un fichier par nom et une chaîne dans des fichiers ?',
        '`find /chemin -name "motif"` recherche des fichiers ; `grep -R "texte" /chemin` recherche du texte récursivement.',
      ),
      StudyCard(
        'Que font un pipe et les redirections `>`, `>>` et `2>` ?',
        '`|` transmet la sortie standard d’une commande à l’entrée d’une autre. `>` remplace un fichier, `>>` ajoute à la fin et `2>` redirige la sortie d’erreur.',
      ),
      StudyCard(
        'Comment rendre une variable d’environnement disponible aux processus enfants ?',
        'L’exporter dans le shell, par exemple `export APP_ENV=production`. La portée ne s’étend pas automatiquement à d’autres sessions.',
      ),
      StudyCard(
        'Quels gestionnaires de paquets rencontrer sur Ubuntu, RHEL et Alpine ?',
        'Ubuntu/Debian utilise généralement `apt`, les systèmes RHEL `dnf` (ou parfois `yum`) et Alpine `apk`.',
      ),
      StudyCard(
        'Comment lire les permissions Unix `rwxr-x---` ?',
        'Le propriétaire a lecture, écriture et exécution ; le groupe a lecture et exécution ; les autres n’ont aucun droit.',
      ),
      StudyCard(
        'Que signifient les modes `755` et `640` dans chmod ?',
        '`755` donne rwx au propriétaire et r-x au groupe et aux autres. `640` donne rw- au propriétaire, r-- au groupe et aucun droit aux autres.',
      ),
      StudyCard(
        'Quelle différence entre `chmod` et `chown` ?',
        '`chmod` modifie les permissions d’un fichier ; `chown` change son propriétaire et éventuellement son groupe.',
      ),
      StudyCard(
        'Pourquoi appliquer le moindre privilège avec sudo ?',
        'N’élever les privilèges que pour les actions nécessaires. Éviter de faire tourner un service ou un script complet en root réduit l’impact d’une erreur ou d’une compromission.',
      ),
      StudyCard(
        'Comment trouver le PID et les détails d’un processus ?',
        '`ps aux` affiche les processus ; `pgrep -a nom` recherche un processus par nom. `top` ou `htop` permet ensuite d’observer leur activité.',
      ),
      StudyCard(
        'Quelle différence entre SIGTERM et SIGKILL ?',
        'SIGTERM (`kill PID`) demande au processus de s’arrêter proprement et peut être intercepté. SIGKILL (`kill -9 PID`) force l’arrêt et ne peut pas être intercepté ; à réserver au dernier recours.',
      ),
      StudyCard(
        'Comment analyser rapidement la charge et l’utilisation CPU ?',
        '`uptime` affiche la charge moyenne, tandis que `top` ou `ps` aide à identifier les processus consommateurs. Une charge élevée doit être interprétée selon le nombre de CPU et le type de travail.',
      ),
      StudyCard(
        'Comment distinguer l’espace libre d’un système de fichiers de la taille d’un dossier ?',
        '`df -h` affiche l’espace des systèmes de fichiers ; `du -sh /chemin` estime l’espace occupé par un dossier.',
      ),
      StudyCard(
        'Comment vérifier les ports en écoute et les connexions réseau ?',
        '`ss -lntp` affiche les sockets TCP en écoute et leurs processus (selon les permissions). `ss -tunap` aide à examiner les sockets TCP/UDP.',
      ),
      StudyCard(
        'Un nom de domaine ne se résout pas : que vérifier ?',
        'Vérifier la résolution avec `getent hosts nom` ou `dig nom`, puis les paramètres DNS du système, la connectivité réseau et la disponibilité du résolveur.',
      ),
      StudyCard(
        'Comment tester une URL HTTP depuis un serveur ?',
        '`curl -I https://example.com` vérifie la réponse et les en-têtes ; `curl -v` ajoute des détails utiles au diagnostic TLS et réseau.',
      ),
      StudyCard(
        'Comment sécuriser une connexion SSH par clé ?',
        'Utiliser une paire de clés, installer uniquement la clé publique côté serveur et protéger la clé privée. Restreindre les comptes et les accès ; désactiver l’authentification par mot de passe seulement après avoir testé l’accès par clé.',
      ),
      StudyCard(
        'Comment vérifier et redémarrer un service avec systemd ?',
        '`systemctl status nom.service` consulte son état ; `sudo systemctl restart nom.service` le redémarre. Vérifier ensuite son statut et ses journaux.',
      ),
      StudyCard(
        'Comment consulter les journaux d’un service systemd ?',
        '`journalctl -u nom.service` filtre par unité ; ajouter `-f` pour suivre les nouveaux événements ou `--since "1 hour ago"` pour borner la période.',
      ),
      StudyCard(
        'Où chercher les logs système et pourquoi les consulter autour de l’incident ?',
        'Utiliser `journalctl` et les journaux applicatifs pertinents. Comparer les événements juste avant et après l’incident aide à identifier la cause sans supposer qu’un seul message est déterminant.',
      ),
      StudyCard(
        'À quoi sert cron et comment vérifier une tâche planifiée ?',
        'Cron exécute des commandes selon une planification. Vérifier la crontab utilisateur (`crontab -l`), les chemins et variables d’environnement, puis les logs et codes de sortie de la tâche.',
      ),
      StudyCard(
        'Pourquoi un script Bash devrait-il avoir un shebang et des chemins explicites ?',
        'Le shebang, par exemple `#!/usr/bin/env bash`, indique l’interpréteur attendu. Les tâches automatisées ont un environnement réduit : définir les chemins, valider les entrées et gérer les erreurs évite les échecs dus au contexte.',
      ),
      StudyCard(
        'Que signifie le code de sortie d’une commande Linux ?',
        'En général, `0` indique le succès et une valeur non nulle un échec. `\$?` contient le code de la commande précédente ; il faut le vérifier sans l’écraser par une autre commande.',
      ),
      StudyCard(
        'Pourquoi entourer les variables de guillemets dans un script shell ?',
        'Les guillemets doubles empêchent le découpage inattendu en mots et l’expansion des jokers, par exemple `"\$file"`. Les guillemets simples empêchent aussi l’expansion des variables.',
      ),
      StudyCard(
        'Un serveur web ne répond plus : quels contrôles Linux faire en premier ?',
        'Vérifier l’état du service et ses logs, le processus, le port en écoute, la résolution DNS, la connectivité et les règles réseau ; examiner ensuite ressources et changements récents.',
      ),
      StudyCard(
        'Un disque est plein : comment localiser le problème sans supprimer à l’aveugle ?',
        'Confirmer avec `df -h`, trouver les répertoires volumineux avec `du -xhd1 /chemin`, vérifier les fichiers supprimés encore ouverts (`lsof +L1`) et appliquer une politique de rotation/nettoyage sûre.',
      ),
      StudyCard(
        'Que signifie un arrêt OOM sous Linux et comment investiguer ?',
        'Le noyau a tué un processus faute de mémoire disponible ou après dépassement d’une limite. Examiner `free -h`, les processus, les limites du service/conteneur et les messages noyau via `journalctl -k`.',
      ),
      StudyCard(
        'Après un incident de production, quelles précautions prendre avant de modifier le serveur ?',
        'Collecter les symptômes et logs, noter l’heure et les changements récents, vérifier l’impact et préserver les éléments de diagnostic. Éviter les suppressions, redémarrages ou modifications irréversibles sans hypothèse et plan de retour arrière.',
      ),
    ]),
    Deck('Git pour DevOps', 'Git', const Color(0xFFA65A3F), Icons.account_tree_rounded, [
      StudyCard(
        'À quoi sert Git dans une équipe DevOps ?',
        'Git versionne le code, les scripts, l’infrastructure, les pipelines et la documentation. Son historique facilite revue, traçabilité, collaboration et retour à une version connue.',
      ),
      StudyCard(
        'Pourquoi Git est-il qualifié de système distribué ?',
        'Chaque clone contient l’historique complet et permet de consulter et créer des commits localement sans connexion au dépôt distant.',
      ),
      StudyCard(
        'Quelles sont les différences entre répertoire de travail, index et dépôt Git ?',
        'Le répertoire de travail contient les fichiers modifiés, l’index (staging area) prépare le prochain commit, et le dépôt stocke les commits et références.',
      ),
      StudyCard(
        'Que montre `git status` et pourquoi l’utiliser souvent ?',
        'Il indique la branche courante et les changements non suivis, non indexés ou prêts à committer. Il évite d’inclure accidentellement des fichiers dans un commit.',
      ),
      StudyCard(
        'Que fait `git add` exactement ?',
        'Il ajoute au staging les changements sélectionnés pour le prochain commit ; ce n’est pas encore un commit. `git add -p` permet de sélectionner des portions de changements.',
      ),
      StudyCard(
        'Qu’est-ce qu’un commit Git de bonne qualité ?',
        'Un snapshot cohérent, testé et aussi ciblé que possible, avec un message clair décrivant l’intention. Les commits atomiques sont plus faciles à relire, bisecter et annuler.',
      ),
      StudyCard(
        'Quelle différence entre `git diff` et `git diff --staged` ?',
        '`git diff` montre les changements non indexés ; `git diff --staged` montre ceux qui seront inclus dans le prochain commit.',
      ),
      StudyCard(
        'Comment consulter l’historique condensé et inspecter un commit ?',
        '`git log --oneline --graph --decorate` affiche un historique compact ; `git show <commit>` détaille un commit et son diff.',
      ),
      StudyCard(
        'Pourquoi créer une branche pour une tâche ?',
        'Une branche isole le travail d’une fonctionnalité ou d’un correctif du flux principal, facilite la revue et permet de collaborer sans mélanger des changements incomplets.',
      ),
      StudyCard(
        'Comment créer et changer de branche avec les commandes modernes ?',
        '`git switch -c feature/nom` crée une branche et s’y positionne ; `git switch main` revient sur `main`.',
      ),
      StudyCard(
        'Quelle différence entre `git fetch` et `git pull` ?',
        '`git fetch` télécharge les références distantes sans modifier la branche de travail. `git pull` récupère puis intègre les changements, généralement par merge ou rebase selon la configuration.',
      ),
      StudyCard(
        'Quelles différences entre merge et rebase ?',
        'Merge intègre une branche et peut créer un commit de merge en préservant la topologie. Rebase rejoue les commits sur une autre base et réécrit leurs identifiants pour obtenir une histoire linéaire.',
      ),
      StudyCard(
        'Pourquoi éviter de rebaser une branche partagée sans coordination ?',
        'Le rebase réécrit les commits. Les collaborateurs qui possèdent encore l’ancienne histoire peuvent rencontrer des divergences et devoir réparer leurs branches.',
      ),
      StudyCard(
        'Comment résoudre un conflit de merge de manière sûre ?',
        'Identifier les fichiers en conflit avec `git status`, éditer les marqueurs en conservant l’intention correcte, tester, puis marquer résolu avec `git add` et terminer le merge ou le rebase.',
      ),
      StudyCard(
        'Quelle différence entre `git revert` et `git reset` ?',
        '`git revert` crée un nouveau commit qui inverse un commit existant, sans réécrire l’histoire partagée. `git reset` déplace la référence de branche et peut retirer des commits de son histoire.',
      ),
      StudyCard(
        'Que font les modes `--soft`, `--mixed` et `--hard` de git reset ?',
        '`--soft` garde index et fichiers ; `--mixed` (par défaut) garde les fichiers mais vide l’index des changements concernés ; `--hard` réinitialise aussi les fichiers suivis et peut détruire du travail.',
      ),
      StudyCard(
        'Comment annuler une modification locale d’un fichier sans toucher aux autres ?',
        'Utiliser `git restore -- chemin` pour restaurer depuis l’index, ou `git restore --source=HEAD -- chemin` pour revenir au dernier commit. Vérifier d’abord `git diff`, car le changement local sera perdu.',
      ),
      StudyCard(
        'À quoi sert `git reflog` après une mauvaise manipulation de branche ?',
        'Le reflog conserve localement les déplacements récents des références. Il peut aider à retrouver un commit après un reset ou un rebase, tant que l’objet existe encore.',
      ),
      StudyCard(
        'À quoi sert `git cherry-pick` ?',
        'À appliquer le changement d’un commit précis sur la branche courante, en créant un nouveau commit. C’est utile pour transférer un correctif ciblé, mais il faut éviter les duplications involontaires.',
      ),
      StudyCard(
        'Comment mettre temporairement de côté des changements avec Git ?',
        '`git stash push -m "description"` sauvegarde provisoirement des modifications. `git stash list` les liste, puis `git stash pop` les réapplique et retire l’entrée si l’application réussit.',
      ),
      StudyCard(
        'Que fait `git commit --amend` et quel est son risque ?',
        'Il remplace le dernier commit par un nouveau, par exemple pour corriger son message ou y ajouter un changement. Il réécrit l’histoire : à éviter sur un commit déjà partagé sans coordination.',
      ),
      StudyCard(
        'Pourquoi préférer `git push --force-with-lease` à `git push --force` ?',
        '`--force-with-lease` refuse normalement d’écraser la branche distante si elle a avancé depuis la dernière observation locale. Cela réduit le risque de supprimer le travail d’un collègue.',
      ),
      StudyCard(
        'Qu’est-ce qu’une branche de suivi distant et comment définir son upstream ?',
        'C’est une branche locale liée à une branche distante, utilisée pour les opérations push/pull par défaut. `git push -u origin nom-branche` publie la branche et définit son upstream.',
      ),
      StudyCard(
        'À quoi servent les tags Git dans un processus de livraison ?',
        'Ils nomment des points de l’historique, souvent des versions de release. Les tags annotés (`git tag -a`) contiennent des métadonnées et sont adaptés aux versions importantes.',
      ),
      StudyCard(
        'Pourquoi un fichier déjà suivi reste-t-il versionné après ajout dans `.gitignore` ?',
        '`.gitignore` empêche surtout l’ajout accidentel des fichiers non suivis. Pour retirer un fichier de l’index sans le supprimer localement, utiliser `git rm --cached fichier`, puis committer ce changement.',
      ),
      StudyCard(
        'Comment empêcher l’exposition d’un secret committé par erreur ?',
        'Révoquer ou renouveler immédiatement le secret ; le supprimer du dernier commit ne suffit pas car il peut rester dans l’historique et les clones. Suivre la procédure de purge du dépôt et prévenir les équipes concernées.',
      ),
      StudyCard(
        'Comment identifier le commit qui a introduit une régression avec git bisect ?',
        'Marquer une révision connue comme mauvaise avec `git bisect start`, une bonne avec `git bisect good <commit>`, puis tester les révisions proposées jusqu’à trouver le commit fautif.',
      ),
      StudyCard(
        'À quoi sert `git blame` et quelle précaution prendre en l’interprétant ?',
        'Il indique quels commits ont modifié chaque ligne. Il fournit un point de départ pour comprendre l’historique, mais n’attribue pas à lui seul la responsabilité ni le contexte complet.',
      ),
      StudyCard(
        'Qu’est-ce qu’un HEAD détaché et comment éviter de perdre un commit créé dans cet état ?',
        'HEAD pointe directement sur un commit plutôt que sur une branche. Le travail committé peut être conservé en créant immédiatement une branche avec `git switch -c nom`.',
      ),
      StudyCard(
        'Quel est le rôle d’une pull request ou merge request dans un workflow DevOps ?',
        'Elle permet de proposer une intégration, discuter et relire le diff, exécuter les contrôles CI et obtenir les validations requises avant de fusionner.',
      ),
      StudyCard(
        'Un pipeline CI échoue sur une branche : quelles vérifications Git faire ?',
        'Comparer le commit et le diff avec une exécution réussie, vérifier les fichiers suivis et les changements de pipeline, reproduire les tests localement et examiner les logs du job.',
      ),
      StudyCard(
        'Pourquoi vérifier `git status` et le diff avant un commit ou un push ?',
        'Pour confirmer la branche active et les fichiers concernés, repérer des secrets ou fichiers générés et vérifier que le commit publié ne contient que les changements prévus.',
      ),
    ]),
  ];

  int get _cardCount =>
      _decks.fold<int>(0, (sum, deck) => sum + deck.cards.length);
  int get _masteredCount =>
      _decks.fold<int>(0, (sum, deck) => sum + deck.mastered);

  @override
  void initState() {
    super.initState();
    _loadSavedDecks();
  }

  Future<void> _loadSavedDecks() async {
    try {
      final savedDecks = await widget.apiClient.fetchDecks();
      if (!mounted) return;
      setState(() {
        for (final savedDeck in savedDecks) {
          if (_decks.any((deck) => deck.backendId == savedDeck.id)) continue;
          final color = _deckPalette[_decks.length % _deckPalette.length];
          _decks.add(
            Deck(
              savedDeck.name,
              savedDeck.subject,
              color,
              Icons.auto_awesome_rounded,
              savedDeck.cards
                  .map(
                    (card) =>
                        StudyCard(card.front, card.back, backendId: card.id),
                  )
                  .toList(),
              backendId: savedDeck.id,
            ),
          );
        }
      });
    } on Exception catch (error) {
      if (mounted) _showBackendError(error);
    }
  }

  void _showBackendError(Object error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Backend request failed. Changes were not saved: $error'),
      ),
    );
  }

  Future<void> _createDeck() async {
    final name = await showDialog<String>(
      context: context,
      builder: (_) => const _DeckNameDialog(),
    );
    if (!mounted || name == null || name.isEmpty) return;
    late final int backendId;
    try {
      backendId = await widget.apiClient.createDeck(name, 'Personnel');
    } on Exception catch (error) {
      if (mounted) _showBackendError(error);
      return;
    }
    if (!mounted) return;
    setState(() {
      final color = _deckPalette[_decks.length % _deckPalette.length];
      _decks.add(
        Deck(
          name,
          'Personnel',
          color,
          Icons.auto_awesome_rounded,
          [],
          backendId: backendId,
        ),
      );
    });
  }

  Future<StudyCard?> _showCardForm({StudyCard? card}) => showDialog<StudyCard>(
    context: context,
    builder: (_) => _CardFormDialog(card: card),
  );

  Future<void> _addCardTo(Deck deck) async {
    final card = await _showCardForm();
    if (!mounted || card == null) return;
    var savedCard = card;
    if (deck.backendId case final deckId?) {
      try {
        final cardId = await widget.apiClient.createCard(
          deckId,
          card.front,
          card.back,
        );
        savedCard = StudyCard(card.front, card.back, backendId: cardId);
      } on Exception catch (error) {
        if (mounted) _showBackendError(error);
        return;
      }
    }
    if (mounted) setState(() => deck.cards.add(savedCard));
  }

  Future<void> _editCard(Deck deck, StudyCard oldCard) async {
    final updated = await _showCardForm(card: oldCard);
    if (!mounted || updated == null) return;
    if (deck.backendId case final deckId?) {
      if (oldCard.backendId case final cardId?) {
        try {
          await widget.apiClient.updateCard(
            deckId,
            cardId,
            updated.front,
            updated.back,
          );
        } on Exception catch (error) {
          if (mounted) _showBackendError(error);
          return;
        }
      }
    }
    setState(() {
      oldCard
        ..front = updated.front
        ..back = updated.back;
    });
  }

  Future<void> _deleteCard(Deck deck, StudyCard card) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete this flashcard?'),
        content: const Text('This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (!mounted || confirmed != true) return;
    if (deck.backendId case final deckId?) {
      if (card.backendId case final cardId?) {
        try {
          await widget.apiClient.deleteCard(deckId, cardId);
        } on Exception catch (error) {
          if (mounted) _showBackendError(error);
          return;
        }
      }
    }
    setState(() => deck.cards.remove(card));
  }

  void _study(Deck deck) {
    if (deck.cards.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Add a flashcard to this deck first.')),
      );
      return;
    }
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (_) => StudyPage(
          deck: deck,
          onMastered: () => setState(() => deck.mastered++),
        ),
      ),
    );
  }

  void _manageDeck(Deck deck) {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (_) => _DeckManager(
          deck: deck,
          onStudy: () => _study(deck),
          onAddCard: () => _addCardTo(deck),
          onEditCard: (card) => _editCard(deck, card),
          onDeleteCard: (card) => _deleteCard(deck, card),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      _Dashboard(
        decks: _decks,
        totalCards: _cardCount,
        masteredCards: _masteredCount,
        onStudy: _study,
        onOpenLibrary: () => setState(() => _tab = 1),
        onCreateDeck: _createDeck,
      ),
      _Library(
        decks: _decks,
        onStudy: _study,
        onCreateDeck: _createDeck,
        onManageDeck: _manageDeck,
      ),
      ProgressScreen(
        decks: _decks,
        cards: _cardCount,
        mastered: _masteredCount,
        onCreateDeck: _createDeck,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(index: _tab, children: pages),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _tab,
        onDestinationSelected: (index) => setState(() => _tab = index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.style_outlined),
            selectedIcon: Icon(Icons.style_rounded),
            label: 'Decks',
          ),
          NavigationDestination(
            icon: Icon(Icons.insights_outlined),
            selectedIcon: Icon(Icons.insights_rounded),
            label: 'Progress',
          ),
        ],
      ),
      floatingActionButton: _tab < 2
          ? FloatingActionButton.extended(
              onPressed: () {
                if (_decks.isNotEmpty) _addCardTo(_decks.first);
              },
              icon: const Icon(Icons.add),
              label: const Text('New flashcard'),
            )
          : null,
    );
  }
}

class _DeckNameDialog extends StatefulWidget {
  const _DeckNameDialog();

  @override
  State<_DeckNameDialog> createState() => _DeckNameDialogState();
}

class _DeckNameDialogState extends State<_DeckNameDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _controller.text.trim();
    if (name.isNotEmpty) Navigator.of(context).pop(name);
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('New deck'),
    content: TextField(
      controller: _controller,
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(labelText: 'Deck name'),
      onSubmitted: (_) => _submit(),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('Cancel'),
      ),
      FilledButton(onPressed: _submit, child: const Text('Create')),
    ],
  );
}

class _CardFormDialog extends StatefulWidget {
  const _CardFormDialog({this.card});

  final StudyCard? card;

  @override
  State<_CardFormDialog> createState() => _CardFormDialogState();
}

class _CardFormDialogState extends State<_CardFormDialog> {
  late final TextEditingController _questionController;
  late final TextEditingController _answerController;

  @override
  void initState() {
    super.initState();
    _questionController = TextEditingController(text: widget.card?.front ?? '');
    _answerController = TextEditingController(text: widget.card?.back ?? '');
  }

  @override
  void dispose() {
    _questionController.dispose();
    _answerController.dispose();
    super.dispose();
  }

  void _submit() {
    final question = _questionController.text.trim();
    final answer = _answerController.text.trim();
    if (question.isNotEmpty && answer.isNotEmpty) {
      Navigator.of(context).pop(StudyCard(question, answer));
    }
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    scrollable: true,
    title: Text(widget.card == null ? 'New flashcard' : 'Edit flashcard'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: _questionController,
          autofocus: true,
          textCapitalization: TextCapitalization.sentences,
          maxLines: 3,
          decoration: const InputDecoration(labelText: 'Question / front'),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _answerController,
          textCapitalization: TextCapitalization.sentences,
          maxLines: 3,
          decoration: const InputDecoration(labelText: 'Answer / back'),
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: const Text('Cancel'),
      ),
      FilledButton(
        onPressed: _submit,
        child: Text(widget.card == null ? 'Add' : 'Save'),
      ),
    ],
  );
}

class _Dashboard extends StatelessWidget {
  const _Dashboard({
    required this.decks,
    required this.totalCards,
    required this.masteredCards,
    required this.onStudy,
    required this.onOpenLibrary,
    required this.onCreateDeck,
  });

  final List<Deck> decks;
  final int totalCards;
  final int masteredCards;
  final ValueChanged<Deck> onStudy;
  final VoidCallback onOpenLibrary;
  final VoidCallback onCreateDeck;

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.fromLTRB(22, 24, 22, 90),
    children: [
      const Text('Hello 👋', style: TextStyle(color: Color(0xFF77685C))),
      const SizedBox(height: 4),
      const Text(
        'Ready to learn?',
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
      ),
      const SizedBox(height: 24),
      Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF70432F), Color(0xFFA66A43)],
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Expanded(
                  child: Text(
                    'TODAY\'S GOAL',
                    style: TextStyle(
                      color: Colors.white70,
                      letterSpacing: 1.2,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(Icons.local_fire_department, color: Color(0xFFFFD18A)),
                Text('  3-day streak', style: TextStyle(color: Colors.white)),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              '$masteredCards',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 38,
              ),
            ),
            Text(
              'flashcards mastered out of $totalCards',
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: totalCards == 0
                    ? 0
                    : (masteredCards / totalCards).clamp(0.0, 1.0),
                minHeight: 7,
                color: const Color(0xFFFFD18A),
                backgroundColor: Colors.white24,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 27),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Continue studying',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          TextButton(onPressed: onOpenLibrary, child: const Text('See all')),
        ],
      ),
      const SizedBox(height: 8),
      ...decks
          .take(3)
          .map(
            (deck) => Padding(
              padding: const EdgeInsets.only(bottom: 11),
              child: _DeckTile(deck: deck, onTap: () => onStudy(deck)),
            ),
          ),
      OutlinedButton.icon(
        onPressed: onCreateDeck,
        icon: const Icon(Icons.create_new_folder_outlined),
        label: const Text('Create a deck'),
      ),
    ],
  );
}

class _DeckTile extends StatelessWidget {
  const _DeckTile({required this.deck, required this.onTap});

  final Deck deck;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Material(
    color: const Color(0xFFFFFCF7),
    borderRadius: BorderRadius.circular(20),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: deck.color.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(deck.icon, color: deck.color),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deck.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${deck.subject} · ${deck.cards.length} flashcards',
                    style: const TextStyle(
                      color: Color(0xFF77685C),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.play_circle_fill_rounded, color: deck.color, size: 32),
          ],
        ),
      ),
    ),
  );
}

class _Library extends StatelessWidget {
  const _Library({
    required this.decks,
    required this.onStudy,
    required this.onCreateDeck,
    required this.onManageDeck,
  });

  final List<Deck> decks;
  final ValueChanged<Deck> onStudy;
  final VoidCallback onCreateDeck;
  final ValueChanged<Deck> onManageDeck;

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.fromLTRB(22, 24, 22, 90),
    children: [
      const Text(
        'Your library',
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
      ),
      const SizedBox(height: 6),
      Text(
        '${decks.length} decks · ${decks.fold<int>(0, (sum, deck) => sum + deck.cards.length)} flashcards',
        style: const TextStyle(color: Color(0xFF77685C)),
      ),
      const SizedBox(height: 22),
      ...decks.map(
        (deck) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _DeckTile(deck: deck, onTap: () => onStudy(deck)),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () => onManageDeck(deck),
                  icon: const Icon(Icons.edit_note),
                  label: const Text('Manage flashcards'),
                ),
              ),
            ],
          ),
        ),
      ),
      OutlinedButton.icon(
        onPressed: onCreateDeck,
        icon: const Icon(Icons.add),
        label: const Text('Create a deck'),
      ),
    ],
  );
}

class _DeckManager extends StatefulWidget {
  const _DeckManager({
    required this.deck,
    required this.onStudy,
    required this.onAddCard,
    required this.onEditCard,
    required this.onDeleteCard,
  });

  final Deck deck;
  final VoidCallback onStudy;
  final Future<void> Function() onAddCard;
  final Future<void> Function(StudyCard) onEditCard;
  final Future<void> Function(StudyCard) onDeleteCard;

  @override
  State<_DeckManager> createState() => _DeckManagerState();
}

class _DeckManagerState extends State<_DeckManager> {
  Future<void> _run(Future<void> Function() action) async {
    await action();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(widget.deck.name),
      actions: [
        IconButton(
          onPressed: widget.onStudy,
          tooltip: 'Study this deck',
          icon: const Icon(Icons.play_arrow_rounded),
        ),
      ],
    ),
    body: widget.deck.cards.isEmpty
        ? const Center(
            child: Text('No flashcards yet. Add your first question!'),
          )
        : ListView.separated(
            padding: const EdgeInsets.all(18),
            itemCount: widget.deck.cards.length,
            separatorBuilder: (_, _) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final card = widget.deck.cards[index];
              return Card(
                color: const Color(0xFFFFFCF7),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.front,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Text(
                        card.back,
                        style: const TextStyle(color: Color(0xFF77685C)),
                      ),
                      const Divider(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            tooltip: 'Edit',
                            onPressed: () =>
                                _run(() => widget.onEditCard(card)),
                            icon: const Icon(Icons.edit_outlined),
                          ),
                          IconButton(
                            tooltip: 'Delete',
                            onPressed: () =>
                                _run(() => widget.onDeleteCard(card)),
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Color(0xFFAD4939),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: () => _run(widget.onAddCard),
      icon: const Icon(Icons.add),
      label: const Text('Add flashcard'),
    ),
  );
}
