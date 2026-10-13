Ce module vous donne les bases du développement avec Flutter : le langage Dart, les widgets, la mise en page, l'état d'un écran, la navigation et les formulaires.

> [!objectifs]
> À la fin de ce module, vous saurez :
> 1. Écrire du code Dart simple.
> 2. Construire une interface avec des widgets.
> 3. Mettre en page avec Row, Column et ListView.
> 4. Gérer l'état d'un écran.
> 5. Naviguer entre écrans et vérifier un formulaire.

## Les bases de Dart

```dart
void main() {
  String nom = 'Mialy';
  int quantite = 3;
  double prix = 2500.0;
  bool livraison = true;

  double total = quantite * prix;
  print('Bonjour $nom, total : $total Ar');

  List<String> plats = ['Romazava', 'Ravitoto', 'Mofo gasy'];
  for (final plat in plats) {
    print(plat);
  }

  if (livraison) {
    print('Livraison demandée');
  }
}
```

| Notion | Exemple |
| --- | --- |
| **Types** | `String`, `int`, `double`, `bool`, `List`, `Map` |
| **Interpolation** | `'Total : $total Ar'` |
| **Fonctions** | `double calculerTotal(int q, double p) => q * p;` |
| **Classes** | Modèle de données : `class Plat { final String nom; final double prix; ... }` |
| **Null safety** | `String?` indique qu'une valeur peut être vide |

> [!definition] Null safety
> Un mécanisme de Dart qui empêche d'utiliser une valeur vide par erreur. Si une variable peut être vide, son type se termine par `?`, et le code doit vérifier ce cas.

## Tout est widget

> [!definition] Widget
> Un élément de l'interface : un texte, un bouton, une image, une colonne, un écran entier. Une application Flutter est un arbre de widgets imbriqués.

| Widget | Usage |
| --- | --- |
| `Text` | Afficher un texte |
| `ElevatedButton` | Bouton |
| `Image` | Image locale ou en ligne |
| `TextField` | Champ de saisie |
| `Scaffold` | Structure d'un écran (barre du haut, contenu, bouton flottant) |
| `Padding`, `SizedBox` | Espacements |

## La mise en page

| Widget | Usage |
| --- | --- |
| `Column` | Éléments empilés verticalement |
| `Row` | Éléments côte à côte |
| `Expanded` | Prendre l'espace disponible |
| `ListView` | Liste qui défile |
| `Card` | Carte avec ombre |

```dart
ListView.builder(
  itemCount: plats.length,
  itemBuilder: (context, index) {
    final plat = plats[index];
    return Card(
      child: ListTile(
        title: Text(plat.nom),
        subtitle: Text('${plat.prix} Ar'),
        trailing: const Icon(Icons.add_shopping_cart),
      ),
    );
  },
)
```

## L'état d'un écran

| Type de widget | Usage |
| --- | --- |
| `StatelessWidget` | L'écran ne change pas tout seul |
| `StatefulWidget` | L'écran change selon les actions (compteur, panier, formulaire) |

```dart
class PagePanier extends StatefulWidget {
  const PagePanier({super.key});

  @override
  State<PagePanier> createState() => _PagePanierState();
}

class _PagePanierState extends State<PagePanier> {
  int nombreArticles = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mon panier')),
      body: Center(child: Text('Articles : $nombreArticles')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => nombreArticles++),
        child: const Icon(Icons.add),
      ),
    );
  }
}
```

> [!astuce]
> `setState` indique à Flutter que l'état a changé et qu'il faut **redessiner** l'écran. Pour les applications plus grandes, on utilise des outils de gestion d'état (Provider, Riverpod, Bloc), que vous découvrirez au niveau Avancé.

## Navigation et formulaires

```dart
// Aller vers l'écran de détail
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => PageDetail(plat: plat)),
);

// Revenir en arrière
Navigator.pop(context);
```

| Vérification d'un formulaire | Exemple |
| --- | --- |
| Champ obligatoire | Le nom ne doit pas être vide |
| Format | Numéro de téléphone malgache à 10 chiffres commençant par 03 |
| Message clair | « Veuillez saisir un numéro valide (ex. 034 12 345 67) » |
| Bouton désactivé | Tant que le formulaire n'est pas valide |

> [!madagascar]
> Adaptez les formulaires au contexte : format des **numéros malgaches**, adresses souvent décrites par un quartier et un repère plutôt qu'un numéro de rue, noms longs. Un formulaire pensé pour l'Europe bloque souvent les utilisateurs malgaches.

> [!retenir]
> - Dart : types, interpolation, fonctions, classes, null safety.
> - Une application Flutter est un arbre de widgets.
> - Column, Row, Expanded, ListView et Card pour la mise en page.
> - StatefulWidget et setState pour les écrans qui changent.
> - Navigator pour changer d'écran ; formulaires vérifiés et adaptés au contexte local.

## Exercice pratique : une petite application

> [!exercice] Exercice pratique · 5 heures
> 1. Créez une classe `Plat` et une liste de 6 plats.
> 2. Affichez-les dans un `ListView` avec des cartes.
> 3. Ajoutez un compteur de panier qui augmente quand on touche un plat.
> 4. Créez un écran de détail et un formulaire de commande (nom, téléphone, quartier) avec vérification.
>
> **À livrer** : le lien du dépôt GitHub et une courte vidéo de l'application sur votre téléphone.
