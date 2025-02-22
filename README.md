[![Actions Status](https://github.com/lizmat/Text-Emoji/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/Text-Emoji/actions) [![Actions Status](https://github.com/lizmat/Text-Emoji/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/Text-Emoji/actions) [![Actions Status](https://github.com/lizmat/Text-Emoji/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/Text-Emoji/actions)

NAME
====

Text::Emoji - provide :text: to emoji translation

SYNOPSIS
========

```raku
use Text::Emoji;

say to-emoji("I :heart: :beer:");  # I ❤️ 🍺

say to-text(":I: ❤️ 🍺");  # I :heart: :beer:
```

DESCRIPTION
===========

The `Text::Emoji` distribution contains information about transforming `:text:` to emoji transliteration. As such it exports a number of subroutines.

It also installs a convenience script `em` that will convert to emojis any arguments from the command line or from standard input.

SUBROUTINES
===========

to-emoji
--------

```raku
say to-emoji("I :heart: :beer:");                     # I ❤️ 🍺

say to-emoji("I :love: :beer:", :love<❤️>);           # I ❤️ 🍺
say to-emoji("I :love: :beer:", :love<heart>);        # I ❤️ 🍺
say to-emoji("I :love: :beer:", %(love => "❤️"));     # I ❤️ 🍺
say to-emoji("I :love: :beer:", %(love => "heart"));  # I ❤️ 🍺

say to-emoji("baby: :baby-bottle::babybottle:");  # baby: 🍼🍼
```

The `to-emoji` subroutine in its simplest form takes a string as the first argument and attempt to transform any known emoji strings of the form `:word:` into the associated emoji. Note that the word *may* contain hyphens, but they are optional.

Additional mapping info may be specified as additional named arguments, or as a hash. The value for each additional mapping may be either the emoji directly, or the text equivalent of the emoji. Note that all text in these additional mappings, should be in **lowercase** only.

to-text
-------

```raku
say to-text("I ❤️ 🍺");                      # I :heart: :beer:
say to-text("I ❤️ 🍺", :love<❤️>);           # I :love: :beer:
say to-text("I ❤️ 🍺", :love<heart>);        # I :love: :beer:
say to-text("I ❤️ 🍺", %(love => "❤️"));     # I :love: :beer:
say to-text("I ❤️ 🍺", %(love => "heart"));  # I :love: :beer:
```

The `to-text` subroutine in its simplest form takes a string as the first argument and attempt to transform any known emojis to the shortest possible `:word:` form known for that emoji.

The same type of additional map information as can be specified with `to-emoji`, can be specified with `to-text`.

raw-emoji-data
--------------

```raku
say raw-emoji-data<❤️>.keys;
# (aliases category description emoji ios_version tags unicode_version)
```

The `raw-emoji-data` subroutine returns a `Map`, keyed to the supported emojis. The value associated with is a `Map` as well, which can be best described by its JSON representation:

    {
      "description": "red heart",
      "category": "Smileys & Emotion",
      "aliases": [
        "heart"
      ],
      "tags": [
        "love"
      ],
      "unicode_version": "",
      "ios_version": "6.0"
    }

SCRIPTS
=======

em
--

    $ em I :heart: :beer:
    I ❤️ 🍺

    $ echo I :heart: :beer: | em
    I ❤️ 🍺

The `em` script converts any text given either on the command line, or from STDIN, to emojis where appropriate.

Mappings provided
=================

Activities
----------

<table class="pod-table">
<thead><tr>
<th>name</th> <th>emoji</th> <th>name</th> <th>emoji</th> <th>name</th> <th>emoji</th>
</tr></thead>
<tbody>
<tr> <td>1st-place-medal</td> <td>🥇</td> <td>2nd-place-medal</td> <td>🥈</td> <td>3rd-place-medal</td> <td>🥉</td> </tr> <tr> <td>8ball</td> <td>🎱</td> <td>art</td> <td>🎨</td> <td>badminton</td> <td>🏸</td> </tr> <tr> <td>balloon</td> <td>🎈</td> <td>bamboo</td> <td>🎍</td> <td>baseball</td> <td>⚾</td> </tr> <tr> <td>basketball</td> <td>🏀</td> <td>black-joker</td> <td>🃏</td> <td>bowling</td> <td>🎳</td> </tr> <tr> <td>boxing-glove</td> <td>🥊</td> <td>chess-pawn</td> <td>♟️</td> <td>christmas-tree</td> <td>🎄</td> </tr> <tr> <td>clubs</td> <td>♣️</td> <td>confetti-ball</td> <td>🎊</td> <td>cricket-game</td> <td>🏏</td> </tr> <tr> <td>crystal-ball</td> <td>🔮</td> <td>curling-stone</td> <td>🥌</td> <td>dart</td> <td>🎯</td> </tr> <tr> <td>diamonds</td> <td>♦️</td> <td>diving-mask</td> <td>🤿</td> <td>dolls</td> <td>🎎</td> </tr> <tr> <td>field-hockey</td> <td>🏑</td> <td>firecracker</td> <td>🧨</td> <td>fireworks</td> <td>🎆</td> </tr> <tr> <td>fishing-pole-and-fish</td> <td>🎣</td> <td>flags</td> <td>🎏</td> <td>flower-playing-cards</td> <td>🎴</td> </tr> <tr> <td>flying-disc</td> <td>🥏</td> <td>football</td> <td>🏈</td> <td>framed-picture</td> <td>🖼️</td> </tr> <tr> <td>game-die</td> <td>🎲</td> <td>gift</td> <td>🎁</td> <td>goal-net</td> <td>🥅</td> </tr> <tr> <td>golf</td> <td>⛳</td> <td>gun</td> <td>🔫</td> <td>hearts</td> <td>♥️</td> </tr> <tr> <td>ice-hockey</td> <td>🏒</td> <td>ice-skate</td> <td>⛸️</td> <td>jack-o-lantern</td> <td>🎃</td> </tr> <tr> <td>jigsaw</td> <td>🧩</td> <td>joystick</td> <td>🕹️</td> <td>kite</td> <td>🪁</td> </tr> <tr> <td>knot</td> <td>🪢</td> <td>lacrosse</td> <td>🥍</td> <td>magic-wand</td> <td>🪄</td> </tr> <tr> <td>mahjong</td> <td>🀄</td> <td>martial-arts-uniform</td> <td>🥋</td> <td>medal-military</td> <td>🎖️</td> </tr> <tr> <td>medal-sports</td> <td>🏅</td> <td>mirror-ball</td> <td>🪩</td> <td>nesting-dolls</td> <td>🪆</td> </tr> <tr> <td>performing-arts</td> <td>🎭</td> <td>pinata</td> <td>🪅</td> <td>ping-pong</td> <td>🏓</td> </tr> <tr> <td>red-envelope</td> <td>🧧</td> <td>reminder-ribbon</td> <td>🎗️</td> <td>ribbon</td> <td>🎀</td> </tr> <tr> <td>rice-scene</td> <td>🎑</td> <td>rugby-football</td> <td>🏉</td> <td>running-shirt-with-sash</td> <td>🎽</td> </tr> <tr> <td>sewing-needle</td> <td>🪡</td> <td>ski</td> <td>🎿</td> <td>sled</td> <td>🛷</td> </tr> <tr> <td>slot-machine</td> <td>🎰</td> <td>soccer</td> <td>⚽</td> <td>softball</td> <td>🥎</td> </tr> <tr> <td>spades</td> <td>♠️</td> <td>sparkler</td> <td>🎇</td> <td>sparkles</td> <td>✨</td> </tr> <tr> <td>tada</td> <td>🎉</td> <td>tanabata-tree</td> <td>🎋</td> <td>teddy-bear</td> <td>🧸</td> </tr> <tr> <td>tennis</td> <td>🎾</td> <td>thread</td> <td>🧵</td> <td>ticket</td> <td>🎫</td> </tr> <tr> <td>tickets</td> <td>🎟️</td> <td>trophy</td> <td>🏆</td> <td>video-game</td> <td>🎮</td> </tr> <tr> <td>volleyball</td> <td>🏐</td> <td>wind-chime</td> <td>🎐</td> <td>yarn</td> <td>🧶</td> </tr> <tr> <td>yo-yo</td> <td>🪀|</td> <td>|</td> <td></td> <td></td> <td></td> </tr>
</tbody>
</table>

Animals & Nature
----------------

<table class="pod-table">
<thead><tr>
<th>name</th> <th>emoji</th> <th>name</th> <th>emoji</th> <th>name</th> <th>emoji</th>
</tr></thead>
<tbody>
<tr> <td>ant</td> <td>🐜</td> <td>baby-chick</td> <td>🐤</td> <td>badger</td> <td>🦡</td> </tr> <tr> <td>bat</td> <td>🦇</td> <td>bear</td> <td>🐻</td> <td>beaver</td> <td>🦫</td> </tr> <tr> <td>bee</td> <td>🐝</td> <td>beetle</td> <td>🪲</td> <td>bird</td> <td>🐦</td> </tr> <tr> <td>bison</td> <td>🦬</td> <td>black-bird</td> <td>🐦‍⬛</td> <td>black-cat</td> <td>🐈‍⬛</td> </tr> <tr> <td>blossom</td> <td>🌼</td> <td>blowfish</td> <td>🐡</td> <td>boar</td> <td>🐗</td> </tr> <tr> <td>bouquet</td> <td>💐</td> <td>bug</td> <td>🐛</td> <td>butterfly</td> <td>🦋</td> </tr> <tr> <td>cactus</td> <td>🌵</td> <td>camel</td> <td>🐫</td> <td>cat</td> <td>🐱</td> </tr> <tr> <td>cat2</td> <td>🐈</td> <td>cherry-blossom</td> <td>🌸</td> <td>chicken</td> <td>🐔</td> </tr> <tr> <td>chipmunk</td> <td>🐿️</td> <td>cockroach</td> <td>🪳</td> <td>coral</td> <td>🪸</td> </tr> <tr> <td>cow</td> <td>🐮</td> <td>cow2</td> <td>🐄</td> <td>cricket</td> <td>🦗</td> </tr> <tr> <td>crocodile</td> <td>🐊</td> <td>deciduous-tree</td> <td>🌳</td> <td>deer</td> <td>🦌</td> </tr> <tr> <td>dodo</td> <td>🦤</td> <td>dog</td> <td>🐶</td> <td>dog2</td> <td>🐕</td> </tr> <tr> <td>dolphin</td> <td>🐬</td> <td>donkey</td> <td>🫏</td> <td>dove</td> <td>🕊️</td> </tr> <tr> <td>dragon</td> <td>🐉</td> <td>dragon-face</td> <td>🐲</td> <td>dromedary-camel</td> <td>🐪</td> </tr> <tr> <td>duck</td> <td>🦆</td> <td>eagle</td> <td>🦅</td> <td>ear-of-rice</td> <td>🌾</td> </tr> <tr> <td>elephant</td> <td>🐘</td> <td>empty-nest</td> <td>🪹</td> <td>evergreen-tree</td> <td>🌲</td> </tr> <tr> <td>fallen-leaf</td> <td>🍂</td> <td>feather</td> <td>🪶</td> <td>feet</td> <td>🐾</td> </tr> <tr> <td>fish</td> <td>🐟</td> <td>flamingo</td> <td>🦩</td> <td>fly</td> <td>🪰</td> </tr> <tr> <td>four-leaf-clover</td> <td>🍀</td> <td>fox-face</td> <td>🦊</td> <td>frog</td> <td>🐸</td> </tr> <tr> <td>giraffe</td> <td>🦒</td> <td>goat</td> <td>🐐</td> <td>goose</td> <td>🪿</td> </tr> <tr> <td>gorilla</td> <td>🦍</td> <td>guide-dog</td> <td>🦮</td> <td>hamster</td> <td>🐹</td> </tr> <tr> <td>hatched-chick</td> <td>🐥</td> <td>hatching-chick</td> <td>🐣</td> <td>hedgehog</td> <td>🦔</td> </tr> <tr> <td>herb</td> <td>🌿</td> <td>hibiscus</td> <td>🌺</td> <td>hippopotamus</td> <td>🦛</td> </tr> <tr> <td>horse</td> <td>🐴</td> <td>hyacinth</td> <td>🪻</td> <td>jellyfish</td> <td>🪼</td> </tr> <tr> <td>kangaroo</td> <td>🦘</td> <td>koala</td> <td>🐨</td> <td>lady-beetle</td> <td>🐞</td> </tr> <tr> <td>leaves</td> <td>🍃</td> <td>leopard</td> <td>🐆</td> <td>lion</td> <td>🦁</td> </tr> <tr> <td>lizard</td> <td>🦎</td> <td>llama</td> <td>🦙</td> <td>lotus</td> <td>🪷</td> </tr> <tr> <td>mammoth</td> <td>🦣</td> <td>maple-leaf</td> <td>🍁</td> <td>microbe</td> <td>🦠</td> </tr> <tr> <td>monkey</td> <td>🐒</td> <td>monkey-face</td> <td>🐵</td> <td>moose</td> <td>🫎</td> </tr> <tr> <td>mosquito</td> <td>🦟</td> <td>mouse</td> <td>🐭</td> <td>mouse2</td> <td>🐁</td> </tr> <tr> <td>mushroom</td> <td>🍄</td> <td>nest-with-eggs</td> <td>🪺</td> <td>octopus</td> <td>🐙</td> </tr> <tr> <td>orangutan</td> <td>🦧</td> <td>otter</td> <td>🦦</td> <td>owl</td> <td>🦉</td> </tr> <tr> <td>ox</td> <td>🐂</td> <td>palm-tree</td> <td>🌴</td> <td>panda-face</td> <td>🐼</td> </tr> <tr> <td>parrot</td> <td>🦜</td> <td>peacock</td> <td>🦚</td> <td>penguin</td> <td>🐧</td> </tr> <tr> <td>pig</td> <td>🐷</td> <td>pig-nose</td> <td>🐽</td> <td>pig2</td> <td>🐖</td> </tr> <tr> <td>polar-bear</td> <td>🐻‍❄️</td> <td>poodle</td> <td>🐩</td> <td>potted-plant</td> <td>🪴</td> </tr> <tr> <td>rabbit</td> <td>🐰</td> <td>rabbit2</td> <td>🐇</td> <td>raccoon</td> <td>🦝</td> </tr> <tr> <td>racehorse</td> <td>🐎</td> <td>ram</td> <td>🐏</td> <td>rat</td> <td>🐀</td> </tr> <tr> <td>rhinoceros</td> <td>🦏</td> <td>rooster</td> <td>🐓</td> <td>rose</td> <td>🌹</td> </tr> <tr> <td>rosette</td> <td>🏵️</td> <td>sauropod</td> <td>🦕</td> <td>scorpion</td> <td>🦂</td> </tr> <tr> <td>seal</td> <td>🦭</td> <td>seedling</td> <td>🌱</td> <td>service-dog</td> <td>🐕‍🦺</td> </tr> <tr> <td>shamrock</td> <td>☘️</td> <td>shark</td> <td>🦈</td> <td>sheep</td> <td>🐑</td> </tr> <tr> <td>shell</td> <td>🐚</td> <td>skunk</td> <td>🦨</td> <td>sloth</td> <td>🦥</td> </tr> <tr> <td>snail</td> <td>🐌</td> <td>snake</td> <td>🐍</td> <td>spider</td> <td>🕷️</td> </tr> <tr> <td>spider-web</td> <td>🕸️</td> <td>sunflower</td> <td>🌻</td> <td>swan</td> <td>🦢</td> </tr> <tr> <td>t-rex</td> <td>🦖</td> <td>tiger</td> <td>🐯</td> <td>tiger2</td> <td>🐅</td> </tr> <tr> <td>tropical-fish</td> <td>🐠</td> <td>tulip</td> <td>🌷</td> <td>turkey</td> <td>🦃</td> </tr> <tr> <td>turtle</td> <td>🐢</td> <td>unicorn</td> <td>🦄</td> <td>water-buffalo</td> <td>🐃</td> </tr> <tr> <td>whale</td> <td>🐳</td> <td>whale2</td> <td>🐋</td> <td>white-flower</td> <td>💮</td> </tr> <tr> <td>wilted-flower</td> <td>🥀</td> <td>wing</td> <td>🪽</td> <td>wolf</td> <td>🐺</td> </tr> <tr> <td>worm</td> <td>🪱</td> <td>zebra</td> <td>🦓|</td> <td></td> <td></td> </tr>
</tbody>
</table>

Flags
-----

<table class="pod-table">
<thead><tr>
<th>name</th> <th>emoji</th> <th>name</th> <th>emoji</th> <th>name</th> <th>emoji</th>
</tr></thead>
<tbody>
<tr> <td>afghanistan</td> <td>🇦🇫</td> <td>aland-islands</td> <td>🇦🇽</td> <td>albania</td> <td>🇦🇱</td> </tr> <tr> <td>algeria</td> <td>🇩🇿</td> <td>american-samoa</td> <td>🇦🇸</td> <td>andorra</td> <td>🇦🇩</td> </tr> <tr> <td>angola</td> <td>🇦🇴</td> <td>anguilla</td> <td>🇦🇮</td> <td>antarctica</td> <td>🇦🇶</td> </tr> <tr> <td>antigua-barbuda</td> <td>🇦🇬</td> <td>argentina</td> <td>🇦🇷</td> <td>armenia</td> <td>🇦🇲</td> </tr> <tr> <td>aruba</td> <td>🇦🇼</td> <td>ascension-island</td> <td>🇦🇨</td> <td>australia</td> <td>🇦🇺</td> </tr> <tr> <td>austria</td> <td>🇦🇹</td> <td>azerbaijan</td> <td>🇦🇿</td> <td>bahamas</td> <td>🇧🇸</td> </tr> <tr> <td>bahrain</td> <td>🇧🇭</td> <td>bangladesh</td> <td>🇧🇩</td> <td>barbados</td> <td>🇧🇧</td> </tr> <tr> <td>belarus</td> <td>🇧🇾</td> <td>belgium</td> <td>🇧🇪</td> <td>belize</td> <td>🇧🇿</td> </tr> <tr> <td>benin</td> <td>🇧🇯</td> <td>bermuda</td> <td>🇧🇲</td> <td>bhutan</td> <td>🇧🇹</td> </tr> <tr> <td>black-flag</td> <td>🏴</td> <td>bolivia</td> <td>🇧🇴</td> <td>bosnia-herzegovina</td> <td>🇧🇦</td> </tr> <tr> <td>botswana</td> <td>🇧🇼</td> <td>bouvet-island</td> <td>🇧🇻</td> <td>brazil</td> <td>🇧🇷</td> </tr> <tr> <td>british-indian-ocean-territory</td> <td>🇮🇴</td> <td>british-virgin-islands</td> <td>🇻🇬</td> <td>brunei</td> <td>🇧🇳</td> </tr> <tr> <td>bulgaria</td> <td>🇧🇬</td> <td>burkina-faso</td> <td>🇧🇫</td> <td>burundi</td> <td>🇧🇮</td> </tr> <tr> <td>cambodia</td> <td>🇰🇭</td> <td>cameroon</td> <td>🇨🇲</td> <td>canada</td> <td>🇨🇦</td> </tr> <tr> <td>canary-islands</td> <td>🇮🇨</td> <td>cape-verde</td> <td>🇨🇻</td> <td>caribbean-netherlands</td> <td>🇧🇶</td> </tr> <tr> <td>cayman-islands</td> <td>🇰🇾</td> <td>central-african-republic</td> <td>🇨🇫</td> <td>ceuta-melilla</td> <td>🇪🇦</td> </tr> <tr> <td>chad</td> <td>🇹🇩</td> <td>checkered-flag</td> <td>🏁</td> <td>chile</td> <td>🇨🇱</td> </tr> <tr> <td>christmas-island</td> <td>🇨🇽</td> <td>clipperton-island</td> <td>🇨🇵</td> <td>cn</td> <td>🇨🇳</td> </tr> <tr> <td>cocos-islands</td> <td>🇨🇨</td> <td>colombia</td> <td>🇨🇴</td> <td>comoros</td> <td>🇰🇲</td> </tr> <tr> <td>congo-brazzaville</td> <td>🇨🇬</td> <td>congo-kinshasa</td> <td>🇨🇩</td> <td>cook-islands</td> <td>🇨🇰</td> </tr> <tr> <td>costa-rica</td> <td>🇨🇷</td> <td>cote-divoire</td> <td>🇨🇮</td> <td>croatia</td> <td>🇭🇷</td> </tr> <tr> <td>crossed-flags</td> <td>🎌</td> <td>cuba</td> <td>🇨🇺</td> <td>curacao</td> <td>🇨🇼</td> </tr> <tr> <td>cyprus</td> <td>🇨🇾</td> <td>czech-republic</td> <td>🇨🇿</td> <td>de</td> <td>🇩🇪</td> </tr> <tr> <td>denmark</td> <td>🇩🇰</td> <td>diego-garcia</td> <td>🇩🇬</td> <td>djibouti</td> <td>🇩🇯</td> </tr> <tr> <td>dominica</td> <td>🇩🇲</td> <td>dominican-republic</td> <td>🇩🇴</td> <td>ecuador</td> <td>🇪🇨</td> </tr> <tr> <td>egypt</td> <td>🇪🇬</td> <td>el-salvador</td> <td>🇸🇻</td> <td>england</td> <td>🏴󠁧󠁢󠁥󠁮󠁧󠁿</td> </tr> <tr> <td>equatorial-guinea</td> <td>🇬🇶</td> <td>eritrea</td> <td>🇪🇷</td> <td>es</td> <td>🇪🇸</td> </tr> <tr> <td>estonia</td> <td>🇪🇪</td> <td>ethiopia</td> <td>🇪🇹</td> <td>eu</td> <td>🇪🇺</td> </tr> <tr> <td>falkland-islands</td> <td>🇫🇰</td> <td>faroe-islands</td> <td>🇫🇴</td> <td>fiji</td> <td>🇫🇯</td> </tr> <tr> <td>finland</td> <td>🇫🇮</td> <td>fr</td> <td>🇫🇷</td> <td>french-guiana</td> <td>🇬🇫</td> </tr> <tr> <td>french-polynesia</td> <td>🇵🇫</td> <td>french-southern-territories</td> <td>🇹🇫</td> <td>gabon</td> <td>🇬🇦</td> </tr> <tr> <td>gambia</td> <td>🇬🇲</td> <td>gb</td> <td>🇬🇧</td> <td>georgia</td> <td>🇬🇪</td> </tr> <tr> <td>ghana</td> <td>🇬🇭</td> <td>gibraltar</td> <td>🇬🇮</td> <td>greece</td> <td>🇬🇷</td> </tr> <tr> <td>greenland</td> <td>🇬🇱</td> <td>grenada</td> <td>🇬🇩</td> <td>guadeloupe</td> <td>🇬🇵</td> </tr> <tr> <td>guam</td> <td>🇬🇺</td> <td>guatemala</td> <td>🇬🇹</td> <td>guernsey</td> <td>🇬🇬</td> </tr> <tr> <td>guinea</td> <td>🇬🇳</td> <td>guinea-bissau</td> <td>🇬🇼</td> <td>guyana</td> <td>🇬🇾</td> </tr> <tr> <td>haiti</td> <td>🇭🇹</td> <td>heard-mcdonald-islands</td> <td>🇭🇲</td> <td>honduras</td> <td>🇭🇳</td> </tr> <tr> <td>hong-kong</td> <td>🇭🇰</td> <td>hungary</td> <td>🇭🇺</td> <td>iceland</td> <td>🇮🇸</td> </tr> <tr> <td>india</td> <td>🇮🇳</td> <td>indonesia</td> <td>🇮🇩</td> <td>iran</td> <td>🇮🇷</td> </tr> <tr> <td>iraq</td> <td>🇮🇶</td> <td>ireland</td> <td>🇮🇪</td> <td>isle-of-man</td> <td>🇮🇲</td> </tr> <tr> <td>israel</td> <td>🇮🇱</td> <td>it</td> <td>🇮🇹</td> <td>jamaica</td> <td>🇯🇲</td> </tr> <tr> <td>jersey</td> <td>🇯🇪</td> <td>jordan</td> <td>🇯🇴</td> <td>jp</td> <td>🇯🇵</td> </tr> <tr> <td>kazakhstan</td> <td>🇰🇿</td> <td>kenya</td> <td>🇰🇪</td> <td>kiribati</td> <td>🇰🇮</td> </tr> <tr> <td>kosovo</td> <td>🇽🇰</td> <td>kr</td> <td>🇰🇷</td> <td>kuwait</td> <td>🇰🇼</td> </tr> <tr> <td>kyrgyzstan</td> <td>🇰🇬</td> <td>laos</td> <td>🇱🇦</td> <td>latvia</td> <td>🇱🇻</td> </tr> <tr> <td>lebanon</td> <td>🇱🇧</td> <td>lesotho</td> <td>🇱🇸</td> <td>liberia</td> <td>🇱🇷</td> </tr> <tr> <td>libya</td> <td>🇱🇾</td> <td>liechtenstein</td> <td>🇱🇮</td> <td>lithuania</td> <td>🇱🇹</td> </tr> <tr> <td>luxembourg</td> <td>🇱🇺</td> <td>macau</td> <td>🇲🇴</td> <td>macedonia</td> <td>🇲🇰</td> </tr> <tr> <td>madagascar</td> <td>🇲🇬</td> <td>malawi</td> <td>🇲🇼</td> <td>malaysia</td> <td>🇲🇾</td> </tr> <tr> <td>maldives</td> <td>🇲🇻</td> <td>mali</td> <td>🇲🇱</td> <td>malta</td> <td>🇲🇹</td> </tr> <tr> <td>marshall-islands</td> <td>🇲🇭</td> <td>martinique</td> <td>🇲🇶</td> <td>mauritania</td> <td>🇲🇷</td> </tr> <tr> <td>mauritius</td> <td>🇲🇺</td> <td>mayotte</td> <td>🇾🇹</td> <td>mexico</td> <td>🇲🇽</td> </tr> <tr> <td>micronesia</td> <td>🇫🇲</td> <td>moldova</td> <td>🇲🇩</td> <td>monaco</td> <td>🇲🇨</td> </tr> <tr> <td>mongolia</td> <td>🇲🇳</td> <td>montenegro</td> <td>🇲🇪</td> <td>montserrat</td> <td>🇲🇸</td> </tr> <tr> <td>morocco</td> <td>🇲🇦</td> <td>mozambique</td> <td>🇲🇿</td> <td>myanmar</td> <td>🇲🇲</td> </tr> <tr> <td>namibia</td> <td>🇳🇦</td> <td>nauru</td> <td>🇳🇷</td> <td>nepal</td> <td>🇳🇵</td> </tr> <tr> <td>netherlands</td> <td>🇳🇱</td> <td>new-caledonia</td> <td>🇳🇨</td> <td>new-zealand</td> <td>🇳🇿</td> </tr> <tr> <td>nicaragua</td> <td>🇳🇮</td> <td>niger</td> <td>🇳🇪</td> <td>nigeria</td> <td>🇳🇬</td> </tr> <tr> <td>niue</td> <td>🇳🇺</td> <td>norfolk-island</td> <td>🇳🇫</td> <td>north-korea</td> <td>🇰🇵</td> </tr> <tr> <td>northern-mariana-islands</td> <td>🇲🇵</td> <td>norway</td> <td>🇳🇴</td> <td>oman</td> <td>🇴🇲</td> </tr> <tr> <td>pakistan</td> <td>🇵🇰</td> <td>palau</td> <td>🇵🇼</td> <td>palestinian-territories</td> <td>🇵🇸</td> </tr> <tr> <td>panama</td> <td>🇵🇦</td> <td>papua-new-guinea</td> <td>🇵🇬</td> <td>paraguay</td> <td>🇵🇾</td> </tr> <tr> <td>peru</td> <td>🇵🇪</td> <td>philippines</td> <td>🇵🇭</td> <td>pirate-flag</td> <td>🏴‍☠️</td> </tr> <tr> <td>pitcairn-islands</td> <td>🇵🇳</td> <td>poland</td> <td>🇵🇱</td> <td>portugal</td> <td>🇵🇹</td> </tr> <tr> <td>puerto-rico</td> <td>🇵🇷</td> <td>qatar</td> <td>🇶🇦</td> <td>rainbow-flag</td> <td>🏳️‍🌈</td> </tr> <tr> <td>reunion</td> <td>🇷🇪</td> <td>romania</td> <td>🇷🇴</td> <td>ru</td> <td>🇷🇺</td> </tr> <tr> <td>rwanda</td> <td>🇷🇼</td> <td>samoa</td> <td>🇼🇸</td> <td>san-marino</td> <td>🇸🇲</td> </tr> <tr> <td>sao-tome-principe</td> <td>🇸🇹</td> <td>saudi-arabia</td> <td>🇸🇦</td> <td>scotland</td> <td>🏴󠁧󠁢󠁳󠁣󠁴󠁿</td> </tr> <tr> <td>senegal</td> <td>🇸🇳</td> <td>serbia</td> <td>🇷🇸</td> <td>seychelles</td> <td>🇸🇨</td> </tr> <tr> <td>sierra-leone</td> <td>🇸🇱</td> <td>singapore</td> <td>🇸🇬</td> <td>sint-maarten</td> <td>🇸🇽</td> </tr> <tr> <td>slovakia</td> <td>🇸🇰</td> <td>slovenia</td> <td>🇸🇮</td> <td>solomon-islands</td> <td>🇸🇧</td> </tr> <tr> <td>somalia</td> <td>🇸🇴</td> <td>south-africa</td> <td>🇿🇦</td> <td>south-georgia-south-sandwich-islands</td> <td>🇬🇸</td> </tr> <tr> <td>south-sudan</td> <td>🇸🇸</td> <td>sri-lanka</td> <td>🇱🇰</td> <td>st-barthelemy</td> <td>🇧🇱</td> </tr> <tr> <td>st-helena</td> <td>🇸🇭</td> <td>st-kitts-nevis</td> <td>🇰🇳</td> <td>st-lucia</td> <td>🇱🇨</td> </tr> <tr> <td>st-martin</td> <td>🇲🇫</td> <td>st-pierre-miquelon</td> <td>🇵🇲</td> <td>st-vincent-grenadines</td> <td>🇻🇨</td> </tr> <tr> <td>sudan</td> <td>🇸🇩</td> <td>suriname</td> <td>🇸🇷</td> <td>svalbard-jan-mayen</td> <td>🇸🇯</td> </tr> <tr> <td>swaziland</td> <td>🇸🇿</td> <td>sweden</td> <td>🇸🇪</td> <td>switzerland</td> <td>🇨🇭</td> </tr> <tr> <td>syria</td> <td>🇸🇾</td> <td>taiwan</td> <td>🇹🇼</td> <td>tajikistan</td> <td>🇹🇯</td> </tr> <tr> <td>tanzania</td> <td>🇹🇿</td> <td>thailand</td> <td>🇹🇭</td> <td>timor-leste</td> <td>🇹🇱</td> </tr> <tr> <td>togo</td> <td>🇹🇬</td> <td>tokelau</td> <td>🇹🇰</td> <td>tonga</td> <td>🇹🇴</td> </tr> <tr> <td>tr</td> <td>🇹🇷</td> <td>transgender-flag</td> <td>🏳️‍⚧️</td> <td>triangular-flag-on-post</td> <td>🚩</td> </tr> <tr> <td>trinidad-tobago</td> <td>🇹🇹</td> <td>tristan-da-cunha</td> <td>🇹🇦</td> <td>tunisia</td> <td>🇹🇳</td> </tr> <tr> <td>turkmenistan</td> <td>🇹🇲</td> <td>turks-caicos-islands</td> <td>🇹🇨</td> <td>tuvalu</td> <td>🇹🇻</td> </tr> <tr> <td>uganda</td> <td>🇺🇬</td> <td>ukraine</td> <td>🇺🇦</td> <td>united-arab-emirates</td> <td>🇦🇪</td> </tr> <tr> <td>united-nations</td> <td>🇺🇳</td> <td>uruguay</td> <td>🇺🇾</td> <td>us</td> <td>🇺🇸</td> </tr> <tr> <td>us-outlying-islands</td> <td>🇺🇲</td> <td>us-virgin-islands</td> <td>🇻🇮</td> <td>uzbekistan</td> <td>🇺🇿</td> </tr> <tr> <td>vanuatu</td> <td>🇻🇺</td> <td>vatican-city</td> <td>🇻🇦</td> <td>venezuela</td> <td>🇻🇪</td> </tr> <tr> <td>vietnam</td> <td>🇻🇳</td> <td>wales</td> <td>🏴󠁧󠁢󠁷󠁬󠁳󠁿</td> <td>wallis-futuna</td> <td>🇼🇫</td> </tr> <tr> <td>western-sahara</td> <td>🇪🇭</td> <td>white-flag</td> <td>🏳️</td> <td>yemen</td> <td>🇾🇪</td> </tr> <tr> <td>zambia</td> <td>🇿🇲</td> <td>zimbabwe</td> <td>🇿🇼|</td> <td></td> <td></td> </tr>
</tbody>
</table>

Food & Drink
------------

<table class="pod-table">
<thead><tr>
<th>name</th> <th>emoji</th> <th>name</th> <th>emoji</th> <th>name</th> <th>emoji</th>
</tr></thead>
<tbody>
<tr> <td>amphora</td> <td>🏺</td> <td>apple</td> <td>🍎</td> <td>avocado</td> <td>🥑</td> </tr> <tr> <td>baby-bottle</td> <td>🍼</td> <td>bacon</td> <td>🥓</td> <td>bagel</td> <td>🥯</td> </tr> <tr> <td>baguette-bread</td> <td>🥖</td> <td>banana</td> <td>🍌</td> <td>beans</td> <td>🫘</td> </tr> <tr> <td>beer</td> <td>🍺</td> <td>beers</td> <td>🍻</td> <td>bell-pepper</td> <td>🫑</td> </tr> <tr> <td>bento</td> <td>🍱</td> <td>beverage-box</td> <td>🧃</td> <td>birthday</td> <td>🎂</td> </tr> <tr> <td>blueberries</td> <td>🫐</td> <td>bowl-with-spoon</td> <td>🥣</td> <td>bread</td> <td>🍞</td> </tr> <tr> <td>broccoli</td> <td>🥦</td> <td>bubble-tea</td> <td>🧋</td> <td>burrito</td> <td>🌯</td> </tr> <tr> <td>butter</td> <td>🧈</td> <td>cake</td> <td>🍰</td> <td>candy</td> <td>🍬</td> </tr> <tr> <td>canned-food</td> <td>🥫</td> <td>carrot</td> <td>🥕</td> <td>champagne</td> <td>🍾</td> </tr> <tr> <td>cheese</td> <td>🧀</td> <td>cherries</td> <td>🍒</td> <td>chestnut</td> <td>🌰</td> </tr> <tr> <td>chocolate-bar</td> <td>🍫</td> <td>chopsticks</td> <td>🥢</td> <td>clinking-glasses</td> <td>🥂</td> </tr> <tr> <td>cocktail</td> <td>🍸</td> <td>coconut</td> <td>🥥</td> <td>coffee</td> <td>☕</td> </tr> <tr> <td>cookie</td> <td>🍪</td> <td>corn</td> <td>🌽</td> <td>crab</td> <td>🦀</td> </tr> <tr> <td>croissant</td> <td>🥐</td> <td>cucumber</td> <td>🥒</td> <td>cup-with-straw</td> <td>🥤</td> </tr> <tr> <td>cupcake</td> <td>🧁</td> <td>curry</td> <td>🍛</td> <td>custard</td> <td>🍮</td> </tr> <tr> <td>cut-of-meat</td> <td>🥩</td> <td>dango</td> <td>🍡</td> <td>doughnut</td> <td>🍩</td> </tr> <tr> <td>dumpling</td> <td>🥟</td> <td>egg</td> <td>🥚</td> <td>eggplant</td> <td>🍆</td> </tr> <tr> <td>falafel</td> <td>🧆</td> <td>fish-cake</td> <td>🍥</td> <td>flatbread</td> <td>🫓</td> </tr> <tr> <td>fondue</td> <td>🫕</td> <td>fork-and-knife</td> <td>🍴</td> <td>fortune-cookie</td> <td>🥠</td> </tr> <tr> <td>fried-egg</td> <td>🍳</td> <td>fried-shrimp</td> <td>🍤</td> <td>fries</td> <td>🍟</td> </tr> <tr> <td>garlic</td> <td>🧄</td> <td>ginger-root</td> <td>🫚</td> <td>grapes</td> <td>🍇</td> </tr> <tr> <td>green-apple</td> <td>🍏</td> <td>green-salad</td> <td>🥗</td> <td>hamburger</td> <td>🍔</td> </tr> <tr> <td>hocho</td> <td>🔪</td> <td>honey-pot</td> <td>🍯</td> <td>hot-pepper</td> <td>🌶️</td> </tr> <tr> <td>hotdog</td> <td>🌭</td> <td>ice-cream</td> <td>🍨</td> <td>ice-cube</td> <td>🧊</td> </tr> <tr> <td>icecream</td> <td>🍦</td> <td>jar</td> <td>🫙</td> <td>kiwi-fruit</td> <td>🥝</td> </tr> <tr> <td>leafy-green</td> <td>🥬</td> <td>lemon</td> <td>🍋</td> <td>lobster</td> <td>🦞</td> </tr> <tr> <td>lollipop</td> <td>🍭</td> <td>mango</td> <td>🥭</td> <td>mate</td> <td>🧉</td> </tr> <tr> <td>meat-on-bone</td> <td>🍖</td> <td>melon</td> <td>🍈</td> <td>milk-glass</td> <td>🥛</td> </tr> <tr> <td>moon-cake</td> <td>🥮</td> <td>oden</td> <td>🍢</td> <td>olive</td> <td>🫒</td> </tr> <tr> <td>onion</td> <td>🧅</td> <td>oyster</td> <td>🦪</td> <td>pancakes</td> <td>🥞</td> </tr> <tr> <td>pea-pod</td> <td>🫛</td> <td>peach</td> <td>🍑</td> <td>peanuts</td> <td>🥜</td> </tr> <tr> <td>pear</td> <td>🍐</td> <td>pie</td> <td>🥧</td> <td>pineapple</td> <td>🍍</td> </tr> <tr> <td>pizza</td> <td>🍕</td> <td>plate-with-cutlery</td> <td>🍽️</td> <td>popcorn</td> <td>🍿</td> </tr> <tr> <td>potato</td> <td>🥔</td> <td>poultry-leg</td> <td>🍗</td> <td>pouring-liquid</td> <td>🫗</td> </tr> <tr> <td>pretzel</td> <td>🥨</td> <td>ramen</td> <td>🍜</td> <td>rice</td> <td>🍚</td> </tr> <tr> <td>rice-ball</td> <td>🍙</td> <td>rice-cracker</td> <td>🍘</td> <td>sake</td> <td>🍶</td> </tr> <tr> <td>salt</td> <td>🧂</td> <td>sandwich</td> <td>🥪</td> <td>shallow-pan-of-food</td> <td>🥘</td> </tr> <tr> <td>shaved-ice</td> <td>🍧</td> <td>shrimp</td> <td>🦐</td> <td>spaghetti</td> <td>🍝</td> </tr> <tr> <td>spoon</td> <td>🥄</td> <td>squid</td> <td>🦑</td> <td>stew</td> <td>🍲</td> </tr> <tr> <td>strawberry</td> <td>🍓</td> <td>stuffed-flatbread</td> <td>🥙</td> <td>sushi</td> <td>🍣</td> </tr> <tr> <td>sweet-potato</td> <td>🍠</td> <td>taco</td> <td>🌮</td> <td>takeout-box</td> <td>🥡</td> </tr> <tr> <td>tamale</td> <td>🫔</td> <td>tangerine</td> <td>🍊</td> <td>tea</td> <td>🍵</td> </tr> <tr> <td>teapot</td> <td>🫖</td> <td>tomato</td> <td>🍅</td> <td>tropical-drink</td> <td>🍹</td> </tr> <tr> <td>tumbler-glass</td> <td>🥃</td> <td>waffle</td> <td>🧇</td> <td>watermelon</td> <td>🍉</td> </tr> <tr> <td>wine-glass</td> <td>🍷</td> <td></td> <td></td> <td></td> <td></td> </tr>
</tbody>
</table>

Objects
-------

<table class="pod-table">
<thead><tr>
<th>name</th> <th>emoji</th> <th>name</th> <th>emoji</th> <th>name</th> <th>emoji</th>
</tr></thead>
<tbody>
<tr> <td>abacus</td> <td>🧮</td> <td>accordion</td> <td>🪗</td> <td>adhesive-bandage</td> <td>🩹</td> </tr> <tr> <td>alembic</td> <td>⚗️</td> <td>athletic-shoe</td> <td>👟</td> <td>axe</td> <td>🪓</td> </tr> <tr> <td>balance-scale</td> <td>⚖️</td> <td>ballet-shoes</td> <td>🩰</td> <td>ballot-box</td> <td>🗳️</td> </tr> <tr> <td>banjo</td> <td>🪕</td> <td>bar-chart</td> <td>📊</td> <td>basket</td> <td>🧺</td> </tr> <tr> <td>bathtub</td> <td>🛁</td> <td>battery</td> <td>🔋</td> <td>bed</td> <td>🛏️</td> </tr> <tr> <td>bell</td> <td>🔔</td> <td>bikini</td> <td>👙</td> <td>billed-cap</td> <td>🧢</td> </tr> <tr> <td>black-nib</td> <td>✒️</td> <td>blue-book</td> <td>📘</td> <td>bomb</td> <td>💣</td> </tr> <tr> <td>book</td> <td>📖</td> <td>bookmark</td> <td>🔖</td> <td>bookmark-tabs</td> <td>📑</td> </tr> <tr> <td>books</td> <td>📚</td> <td>boomerang</td> <td>🪃</td> <td>boot</td> <td>👢</td> </tr> <tr> <td>bow-and-arrow</td> <td>🏹</td> <td>briefcase</td> <td>💼</td> <td>broom</td> <td>🧹</td> </tr> <tr> <td>bubbles</td> <td>🫧</td> <td>bucket</td> <td>🪣</td> <td>bulb</td> <td>💡</td> </tr> <tr> <td>calendar</td> <td>📆</td> <td>calling</td> <td>📲</td> <td>camera</td> <td>📷</td> </tr> <tr> <td>camera-flash</td> <td>📸</td> <td>candle</td> <td>🕯️</td> <td>card-file-box</td> <td>🗃️</td> </tr> <tr> <td>card-index</td> <td>📇</td> <td>card-index-dividers</td> <td>🗂️</td> <td>carpentry-saw</td> <td>🪚</td> </tr> <tr> <td>cd</td> <td>💿</td> <td>chains</td> <td>⛓️</td> <td>chair</td> <td>🪑</td> </tr> <tr> <td>chart</td> <td>💹</td> <td>chart-with-downwards-trend</td> <td>📉</td> <td>chart-with-upwards-trend</td> <td>📈</td> </tr> <tr> <td>clamp</td> <td>🗜️</td> <td>clapper</td> <td>🎬</td> <td>clipboard</td> <td>📋</td> </tr> <tr> <td>closed-book</td> <td>📕</td> <td>closed-lock-with-key</td> <td>🔐</td> <td>coat</td> <td>🧥</td> </tr> <tr> <td>coffin</td> <td>⚰️</td> <td>coin</td> <td>🪙</td> <td>computer</td> <td>💻</td> </tr> <tr> <td>computer-mouse</td> <td>🖱️</td> <td>control-knobs</td> <td>🎛️</td> <td>couch-and-lamp</td> <td>🛋️</td> </tr> <tr> <td>crayon</td> <td>🖍️</td> <td>credit-card</td> <td>💳</td> <td>crossed-swords</td> <td>⚔️</td> </tr> <tr> <td>crown</td> <td>👑</td> <td>crutch</td> <td>🩼</td> <td>dagger</td> <td>🗡️</td> </tr> <tr> <td>dark-sunglasses</td> <td>🕶️</td> <td>date</td> <td>📅</td> <td>desktop-computer</td> <td>🖥️</td> </tr> <tr> <td>diya-lamp</td> <td>🪔</td> <td>dna</td> <td>🧬</td> <td>dollar</td> <td>💵</td> </tr> <tr> <td>door</td> <td>🚪</td> <td>dress</td> <td>👗</td> <td>drop-of-blood</td> <td>🩸</td> </tr> <tr> <td>drum</td> <td>🥁</td> <td>dvd</td> <td>📀</td> <td>electric-plug</td> <td>🔌</td> </tr> <tr> <td>elevator</td> <td>🛗</td> <td>email</td> <td>📧</td> <td>envelope</td> <td>✉️</td> </tr> <tr> <td>envelope-with-arrow</td> <td>📩</td> <td>euro</td> <td>💶</td> <td>eyeglasses</td> <td>👓</td> </tr> <tr> <td>fax</td> <td>📠</td> <td>file-cabinet</td> <td>🗄️</td> <td>file-folder</td> <td>📁</td> </tr> <tr> <td>film-projector</td> <td>📽️</td> <td>film-strip</td> <td>🎞️</td> <td>fire-extinguisher</td> <td>🧯</td> </tr> <tr> <td>flashlight</td> <td>🔦</td> <td>flat-shoe</td> <td>🥿</td> <td>floppy-disk</td> <td>💾</td> </tr> <tr> <td>flute</td> <td>🪈</td> <td>folding-hand-fan</td> <td>🪭</td> <td>fountain-pen</td> <td>🖋️</td> </tr> <tr> <td>funeral-urn</td> <td>⚱️</td> <td>gear</td> <td>⚙️</td> <td>gem</td> <td>💎</td> </tr> <tr> <td>gloves</td> <td>🧤</td> <td>goggles</td> <td>🥽</td> <td>green-book</td> <td>📗</td> </tr> <tr> <td>guitar</td> <td>🎸</td> <td>hair-pick</td> <td>🪮</td> <td>hammer</td> <td>🔨</td> </tr> <tr> <td>hammer-and-pick</td> <td>⚒️</td> <td>hammer-and-wrench</td> <td>🛠️</td> <td>hamsa</td> <td>🪬</td> </tr> <tr> <td>handbag</td> <td>👜</td> <td>headphones</td> <td>🎧</td> <td>headstone</td> <td>🪦</td> </tr> <tr> <td>high-heel</td> <td>👠</td> <td>hiking-boot</td> <td>🥾</td> <td>hook</td> <td>🪝</td> </tr> <tr> <td>identification-card</td> <td>🪪</td> <td>inbox-tray</td> <td>📥</td> <td>incoming-envelope</td> <td>📨</td> </tr> <tr> <td>iphone</td> <td>📱</td> <td>izakaya-lantern</td> <td>🏮</td> <td>jeans</td> <td>👖</td> </tr> <tr> <td>key</td> <td>🔑</td> <td>keyboard</td> <td>⌨️</td> <td>kimono</td> <td>👘</td> </tr> <tr> <td>lab-coat</td> <td>🥼</td> <td>label</td> <td>🏷️</td> <td>ladder</td> <td>🪜</td> </tr> <tr> <td>ledger</td> <td>📒</td> <td>level-slider</td> <td>🎚️</td> <td>link</td> <td>🔗</td> </tr> <tr> <td>lipstick</td> <td>💄</td> <td>lock</td> <td>🔒</td> <td>lock-with-ink-pen</td> <td>🔏</td> </tr> <tr> <td>long-drum</td> <td>🪘</td> <td>lotion-bottle</td> <td>🧴</td> <td>loud-sound</td> <td>🔊</td> </tr> <tr> <td>loudspeaker</td> <td>📢</td> <td>low-battery</td> <td>🪫</td> <td>mag</td> <td>🔍</td> </tr> <tr> <td>mag-right</td> <td>🔎</td> <td>magnet</td> <td>🧲</td> <td>mailbox</td> <td>📫</td> </tr> <tr> <td>mailbox-closed</td> <td>📪</td> <td>mailbox-with-mail</td> <td>📬</td> <td>mailbox-with-no-mail</td> <td>📭</td> </tr> <tr> <td>mans-shoe</td> <td>👞</td> <td>maracas</td> <td>🪇</td> <td>mega</td> <td>📣</td> </tr> <tr> <td>memo</td> <td>📝</td> <td>microphone</td> <td>🎤</td> <td>microscope</td> <td>🔬</td> </tr> <tr> <td>military-helmet</td> <td>🪖</td> <td>minidisc</td> <td>💽</td> <td>mirror</td> <td>🪞</td> </tr> <tr> <td>money-with-wings</td> <td>💸</td> <td>moneybag</td> <td>💰</td> <td>mortar-board</td> <td>🎓</td> </tr> <tr> <td>mouse-trap</td> <td>🪤</td> <td>movie-camera</td> <td>🎥</td> <td>moyai</td> <td>🗿</td> </tr> <tr> <td>musical-keyboard</td> <td>🎹</td> <td>musical-note</td> <td>🎵</td> <td>musical-score</td> <td>🎼</td> </tr> <tr> <td>mute</td> <td>🔇</td> <td>nazar-amulet</td> <td>🧿</td> <td>necktie</td> <td>👔</td> </tr> <tr> <td>newspaper</td> <td>📰</td> <td>newspaper-roll</td> <td>🗞️</td> <td>no-bell</td> <td>🔕</td> </tr> <tr> <td>notebook</td> <td>📓</td> <td>notebook-with-decorative-cover</td> <td>📔</td> <td>notes</td> <td>🎶</td> </tr> <tr> <td>nut-and-bolt</td> <td>🔩</td> <td>old-key</td> <td>🗝️</td> <td>one-piece-swimsuit</td> <td>🩱</td> </tr> <tr> <td>open-file-folder</td> <td>📂</td> <td>orange-book</td> <td>📙</td> <td>outbox-tray</td> <td>📤</td> </tr> <tr> <td>package</td> <td>📦</td> <td>page-facing-up</td> <td>📄</td> <td>page-with-curl</td> <td>📃</td> </tr> <tr> <td>pager</td> <td>📟</td> <td>paintbrush</td> <td>🖌️</td> <td>paperclip</td> <td>📎</td> </tr> <tr> <td>paperclips</td> <td>🖇️</td> <td>pen</td> <td>🖊️</td> <td>pencil2</td> <td>✏️</td> </tr> <tr> <td>petri-dish</td> <td>🧫</td> <td>phone</td> <td>☎️</td> <td>pick</td> <td>⛏️</td> </tr> <tr> <td>pill</td> <td>💊</td> <td>placard</td> <td>🪧</td> <td>plunger</td> <td>🪠</td> </tr> <tr> <td>postal-horn</td> <td>📯</td> <td>postbox</td> <td>📮</td> <td>pouch</td> <td>👝</td> </tr> <tr> <td>pound</td> <td>💷</td> <td>prayer-beads</td> <td>📿</td> <td>printer</td> <td>🖨️</td> </tr> <tr> <td>probing-cane</td> <td>🦯</td> <td>purse</td> <td>👛</td> <td>pushpin</td> <td>📌</td> </tr> <tr> <td>radio</td> <td>📻</td> <td>razor</td> <td>🪒</td> <td>receipt</td> <td>🧾</td> </tr> <tr> <td>rescue-worker-helmet</td> <td>⛑️</td> <td>ring</td> <td>💍</td> <td>roll-of-paper</td> <td>🧻</td> </tr> <tr> <td>round-pushpin</td> <td>📍</td> <td>safety-pin</td> <td>🧷</td> <td>safety-vest</td> <td>🦺</td> </tr> <tr> <td>sandal</td> <td>👡</td> <td>sari</td> <td>🥻</td> <td>satellite</td> <td>📡</td> </tr> <tr> <td>saxophone</td> <td>🎷</td> <td>scarf</td> <td>🧣</td> <td>school-satchel</td> <td>🎒</td> </tr> <tr> <td>scissors</td> <td>✂️</td> <td>screwdriver</td> <td>🪛</td> <td>scroll</td> <td>📜</td> </tr> <tr> <td>shield</td> <td>🛡️</td> <td>shirt</td> <td>👕</td> <td>shopping</td> <td>🛍️</td> </tr> <tr> <td>shopping-cart</td> <td>🛒</td> <td>shorts</td> <td>🩳</td> <td>shower</td> <td>🚿</td> </tr> <tr> <td>smoking</td> <td>🚬</td> <td>soap</td> <td>🧼</td> <td>socks</td> <td>🧦</td> </tr> <tr> <td>sound</td> <td>🔉</td> <td>speaker</td> <td>🔈</td> <td>spiral-calendar</td> <td>🗓️</td> </tr> <tr> <td>spiral-notepad</td> <td>🗒️</td> <td>sponge</td> <td>🧽</td> <td>stethoscope</td> <td>🩺</td> </tr> <tr> <td>straight-ruler</td> <td>📏</td> <td>studio-microphone</td> <td>🎙️</td> <td>swim-brief</td> <td>🩲</td> </tr> <tr> <td>syringe</td> <td>💉</td> <td>telephone-receiver</td> <td>📞</td> <td>telescope</td> <td>🔭</td> </tr> <tr> <td>test-tube</td> <td>🧪</td> <td>thong-sandal</td> <td>🩴</td> <td>toilet</td> <td>🚽</td> </tr> <tr> <td>toolbox</td> <td>🧰</td> <td>toothbrush</td> <td>🪥</td> <td>tophat</td> <td>🎩</td> </tr> <tr> <td>trackball</td> <td>🖲️</td> <td>triangular-ruler</td> <td>📐</td> <td>trumpet</td> <td>🎺</td> </tr> <tr> <td>tv</td> <td>📺</td> <td>unlock</td> <td>🔓</td> <td>vhs</td> <td>📼</td> </tr> <tr> <td>video-camera</td> <td>📹</td> <td>violin</td> <td>🎻</td> <td>wastebasket</td> <td>🗑️</td> </tr> <tr> <td>window</td> <td>🪟</td> <td>womans-clothes</td> <td>👚</td> <td>womans-hat</td> <td>👒</td> </tr> <tr> <td>wrench</td> <td>🔧</td> <td>x-ray</td> <td>🩻</td> <td>yen</td> <td>💴</td> </tr>
</tbody>
</table>

INSPIRATION
===========

Inspired by Simon Harms' [`Avolution::Emoji`](https://github.com/ukn-ubi/Avolution-Emoji) module, but completely re-imagined from scratch using the table provided by the [`gemoji`](https://github.com/github/gemoji) library.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Text-Emoji . Comments and Pull Requests are welcome.

If you like this module, or what I'm doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2024 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

