
import 'package:app/contant.dart';



class Champion {
  final String name;
  final String nickName;
  final Role role;
  final Difficulty difficulty;
  final String description;
  final String imageUrl;

  const Champion(
      {required this.name,
      required this.nickName,
      required this.difficulty,
      required this.role,
      required this.imageUrl,
      required this.description});
}


final championsMap = {
  "akali": Champion(
      name: "Akali",
      role: Role.ASSASIN,
      difficulty: Difficulty.MODERATE,
      nickName: "THE ROGUE ASSASSIN",
      imageUrl:
          "https://img.freepik.com/free-photo/flat-lay-assortment-fresh-autumnal-vegetables_23-2148647916.jpg?size=626&ext=jpg&ga=GA1.1.1141335507.1719100800&semt=ais_user",
      description:
          "Abandoning the Kinkou Order and her title of the Fist of Shadow, Akali now strikes alone, ready to be the deadly weapon her people need. Though she holds onto all she learned from her master Shen, she has pledged to defend Ionia from its enemies, one kill at a time. Akali may strike in silence, but her message will be heard loud and clear: fear the assassin with no master."),
  "camile": Champion(
      name: "Camile",
      role: Role.FIGHTER,
      difficulty: Difficulty.MODERATE,
      nickName: "THE STEEL SHADOW",
      imageUrl:
          "https://us.123rf.com/450wm/kaewphoto/kaewphoto1406/kaewphoto140600053/29603263-still-life-vegetables-herbs-and-fruit-as-ingredients-in-cooking.jpg?ver=6",
      description:
          "Weaponized to operate outside the boundaries of the law, Camille is the Principal Intelligencer of Clan Ferros—an elegant and elite agent who ensures the Piltover machine and its Zaunite underbelly runs smoothly. Adaptable and precise, she views sloppy technique as an embarrassment that must be put to order. With a mind as sharp as the blades she bears, Camille's pursuit of superiority through hextech body augmentation has left many to wonder if she is now more machine than woman."),
  "ezreal": Champion(
      name: "Ezreal",
      role: Role.MARKSMAN,
      difficulty: Difficulty.MODERATE,
      nickName: "THE PRODIGAL EXPLORER",
      imageUrl:
          "https://st3.depositphotos.com/7417846/15304/i/450/depositphotos_153042042-stock-photo-portrait-of-a-happy-young.jpg",
      description:
          "A dashing adventurer, unknowingly gifted in the magical arts, Ezreal raids long-lost catacombs, tangles with ancient curses, and overcomes seemingly impossible odds with ease. His courage and bravado knowing no bounds, he prefers to improvise his way out of any situation, relying partially on his wits, but mostly on his mystical Shuriman gauntlet, which he uses to unleash devastating arcane blasts. One thing is for sure—whenever Ezreal is around, trouble isn't too far behind. Or ahead. Probably everywhere."),
  "zoe": Champion(
      name: "Zoe",
      role: Role.MAGE,
      difficulty: Difficulty.HIGH,
      nickName: "THE ASPECT OF TWILIGHT",
      imageUrl:
          "https://img.baba-blog.com/2023/02/a-bunch-of-farm-produce-isolated-on-the-ground.jpeg?x-oss-process=style%2Flarge",
      description:
          "As the embodiment of mischief, imagination, and change, Zoe acts as the cosmic messenger of Targon, heralding major events that reshape worlds. Her mere presence warps the arcane mathematics governing realities, sometimes causing cataclysms without conscious effort or malice. This perhaps explains the breezy nonchalance with which Zoe approaches her duties, giving her plenty of time to focus on playing games, tricking mortals, or otherwise amusing herself. An encounter with Zoe can be joyous and life affirming, but it is always more than it appears and often extremely dangerous."),
  "irelia": Champion(
      name: "Irelia",
      role: Role.FIGHTER,
      difficulty: Difficulty.MODERATE,
      nickName: "THE BLADE DANCER",
      imageUrl:
          "https://www.nhhomemagazine.com/content/uploads/data-import/ee29c2de/6128-GardenRX1marchapril2013.jpg",
      description:
          "The Noxian occupation of Ionia produced many heroes, none more unlikely than young Irelia of Navori. Trained in the ancient dances of her province, she adapted her art for war, using the graceful and carefully practised movements to levitate a host of deadly blades. After proving herself as a fighter, she was thrust into the role of resistance leader and figurehead, and to this day remains dedicated to the preservation of her homeland."),
  "poppy": Champion(
      name: "Poppy",
      role: Role.TANKER,
      difficulty: Difficulty.MODERATE,
      nickName: "KEEPER OF THE HAMMER",
      imageUrl:
          "https://www.beautifulnews.com/sites/default/files/styles/thumbnail/public/story/image/Limpopo_LivhuwaniNemagaungani_FarmingEntrepreneur-7440.jpg?h=09ef2bee&itok=qXxhe97g",
      description:
          "Runeterra has no shortage of valiant champions, but few are as tenacious as Poppy. Bearing the legendary hammer of Orlon, a weapon twice her size, this determined yordle has spent untold years searching in secret for the fabled “Hero of Demacia,” said to be its rightful wielder. Until then, she dutifully charges into battle, pushing back the kingdom's enemies with every whirling strike."),
};