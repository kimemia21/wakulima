
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
          "https://www.ft.com/__origami/service/image/v2/images/raw/ftcms%3A3d3afd81-ad1f-4dbe-992d-df03a081f269?source=next-article&fit=scale-down&quality=highest&width=1440&dpr=1",
      description:
          "Abandoning the Kinkou Order and her title of the Fist of Shadow, Akali now strikes alone, ready to be the deadly weapon her people need. Though she holds onto all she learned from her master Shen, she has pledged to defend Ionia from its enemies, one kill at a time. Akali may strike in silence, but her message will be heard loud and clear: fear the assassin with no master."),
  "camile": Champion(
      name: "Camile",
      role: Role.FIGHTER,
      difficulty: Difficulty.MODERATE,
      nickName: "THE STEEL SHADOW",
      imageUrl:
          "https://images.immediate.co.uk/production/volatile/sites/30/2023/08/tea-plantation-2e4af22.jpg?quality=90&resize=556,505",
      description:
          "Weaponized to operate outside the boundaries of the law, Camille is the Principal Intelligencer of Clan Ferros—an elegant and elite agent who ensures the Piltover machine and its Zaunite underbelly runs smoothly. Adaptable and precise, she views sloppy technique as an embarrassment that must be put to order. With a mind as sharp as the blades she bears, Camille's pursuit of superiority through hextech body augmentation has left many to wonder if she is now more machine than woman."),
  "ezreal": Champion(
      name: "Ezreal",
      role: Role.MARKSMAN,
      difficulty: Difficulty.MODERATE,
      nickName: "THE PRODIGAL EXPLORER",
      imageUrl:
          "https://www.thoughtco.com/thmb/QjFYmqeC_tsWT2bsXHP0WC8gwrA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/closeup-of-big-gold-nugget-511603038-5ad92a97fa6bcc00362b919b.jpg",
      description:
          "A dashing adventurer, unknowingly gifted in the magical arts, Ezreal raids long-lost catacombs, tangles with ancient curses, and overcomes seemingly impossible odds with ease. His courage and bravado knowing no bounds, he prefers to improvise his way out of any situation, relying partially on his wits, but mostly on his mystical Shuriman gauntlet, which he uses to unleash devastating arcane blasts. One thing is for sure—whenever Ezreal is around, trouble isn't too far behind. Or ahead. Probably everywhere."),
  "zoe": Champion(
      name: "Zoe",
      role: Role.MAGE,
      difficulty: Difficulty.HIGH,
      nickName: "THE ASPECT OF TWILIGHT",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/004-soymilk.jpg/1200px-004-soymilk.jpg",
      description:
          "As the embodiment of mischief, imagination, and change, Zoe acts as the cosmic messenger of Targon, heralding major events that reshape worlds. Her mere presence warps the arcane mathematics governing realities, sometimes causing cataclysms without conscious effort or malice. This perhaps explains the breezy nonchalance with which Zoe approaches her duties, giving her plenty of time to focus on playing games, tricking mortals, or otherwise amusing herself. An encounter with Zoe can be joyous and life affirming, but it is always more than it appears and often extremely dangerous."),

};