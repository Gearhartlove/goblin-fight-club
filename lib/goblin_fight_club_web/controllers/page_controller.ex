defmodule GoblinFightClubWeb.PageController do
  use GoblinFightClubWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def monster(conn, _params) do
    
      json(conn, Jason.decode!(owlbear())) 
  end


  defp owlbear do
~S"""
{
    "_id": "X03vq2RWi2jiA6Ri",
    "img": "systems/pf2e/icons/default-icons/npc.svg",
    "items": [
        {
            "_id": "sqceAJWlpdKGnHvx",
            "img": "systems/pf2e/icons/default-icons/melee.svg",
            "name": "Talon",
            "sort": 100000,
            "system": {
                "attack": {
                    "value": ""
                },
                "attackEffects": {
                    "custom": "",
                    "value": [
                        "grab"
                    ]
                },
                "bonus": {
                    "value": 14
                },
                "damageRolls": {
                    "9486b2kk8mrlln50qt9w": {
                        "damage": "1d10+6",
                        "damageType": "piercing"
                    }
                },
                "description": {
                    "value": ""
                },
                "publication": {
                    "license": "OGL",
                    "remaster": false,
                    "title": ""
                },
                "rules": [],
                "slug": null,
                "traits": {
                    "rarity": "common",
                    "value": [
                        "agile"
                    ]
                },
                "weaponType": {
                    "value": "melee"
                }
            },
            "type": "melee"
        },
        {
            "_id": "LIdmD7VqztundfTh",
            "img": "systems/pf2e/icons/default-icons/melee.svg",
            "name": "Beak",
            "sort": 200000,
            "system": {
                "attack": {
                    "value": ""
                },
                "attackEffects": {
                    "custom": "",
                    "value": []
                },
                "bonus": {
                    "value": 14
                },
                "damageRolls": {
                    "ekcdli6u03agzl4ogde6": {
                        "damage": "1d12+6",
                        "damageType": "piercing"
                    }
                },
                "description": {
                    "value": ""
                },
                "publication": {
                    "license": "OGL",
                    "remaster": false,
                    "title": ""
                },
                "rules": [],
                "slug": null,
                "traits": {
                    "rarity": "common",
                    "value": []
                },
                "weaponType": {
                    "value": "melee"
                }
            },
            "type": "melee"
        },
        {
            "_id": "vTXaShzYmcNbRjzk",
            "img": "systems/pf2e/icons/actions/OneAction.webp",
            "name": "Bloodcurdling Screech",
            "sort": 300000,
            "system": {
                "actionType": {
                    "value": "action"
                },
                "actions": {
                    "value": 1
                },
                "category": "offensive",
                "description": {
                    "value": "<p>The owlbear unleashes a loud screech that terrifies its prey. Each creature in an @Template[emanation|distance:80] must attempt a @Check[will|dc:20] save. Regardless of the result, creatures are temporarily immune for 1 minute.</p>\n<hr />\n<p><strong>Critical Success</strong> The creature is unaffected.</p>\n<p><strong>Success</strong> The creature is @UUID[Compendium.pf2e.conditionitems.Item.Frightened]{Frightened 1}.</p>\n<p><strong>Failure</strong> The creature is @UUID[Compendium.pf2e.conditionitems.Item.Frightened]{Frightened 2}.</p>\n<p><strong>Critical Failure</strong> The creature is @UUID[Compendium.pf2e.conditionitems.Item.Fleeing] for 1 round and @UUID[Compendium.pf2e.conditionitems.Item.Frightened]{Frightened 3}.</p>"
                },
                "publication": {
                    "license": "OGL",
                    "remaster": false,
                    "title": ""
                },
                "rules": [],
                "slug": null,
                "traits": {
                    "rarity": "common",
                    "value": [
                        "auditory",
                        "emotion",
                        "fear",
                        "mental"
                    ]
                }
            },
            "type": "action"
        },
        {
            "_id": "vudcfpUT9un2pDOP",
            "img": "systems/pf2e/icons/actions/OneAction.webp",
            "name": "Gnaw",
            "sort": 400000,
            "system": {
                "actionType": {
                    "value": "action"
                },
                "actions": {
                    "value": 1
                },
                "category": "offensive",
                "description": {
                    "value": "<p><strong>Requirements</strong> The owlbear has a creature @UUID[Compendium.pf2e.conditionitems.Item.Grabbed] with its talons.</p>\n<hr />\n<p><strong>Effect</strong> The owlbear attempts to disembowel the creature with a beak Strike. If the Strike hits, the target must attempt a @Check[will|dc:22] save.</p>\n<hr />\n<p><strong>Critical Success</strong> The target is unaffected.</p>\n<p><strong>Success</strong> The target is @UUID[Compendium.pf2e.conditionitems.Item.Sickened]{Sickened 1}.</p>\n<p><strong>Failure</strong> The target is sickened 1 and @UUID[Compendium.pf2e.conditionitems.Item.Slowed]{Slowed 1} as long as it remains sickened.</p>"
                },
                "publication": {
                    "license": "OGL",
                    "remaster": false,
                    "title": ""
                },
                "rules": [],
                "slug": null,
                "traits": {
                    "rarity": "common",
                    "value": []
                }
            },
            "type": "action"
        },
        {
            "_id": "qCmKPruRObzVL1Dr",
            "img": "systems/pf2e/icons/actions/TwoActions.webp",
            "name": "Screeching Advance",
            "sort": 500000,
            "system": {
                "actionType": {
                    "value": "action"
                },
                "actions": {
                    "value": 2
                },
                "category": "offensive",
                "description": {
                    "value": "<p>The owlbear makes a Bloodcurdling Screech and Strides twice. All creatures within @Template[emanation|distance:80]{80 feet} of the owlbear at any point during this movement are subjected to the effects of Bloodcurdling Screech.</p>"
                },
                "publication": {
                    "license": "OGL",
                    "remaster": false,
                    "title": ""
                },
                "rules": [],
                "slug": null,
                "traits": {
                    "rarity": "common",
                    "value": [
                        "auditory",
                        "emotion",
                        "fear",
                        "mental"
                    ]
                }
            },
            "type": "action"
        },
        {
            "_id": "TyHmjC5wvxo29J5L",
            "_stats": {
                "compendiumSource": "Compendium.pf2e.bestiary-ability-glossary-srd.Item.Tkd8sH4pwFIPzqTr"
            },
            "img": "systems/pf2e/icons/actions/OneAction.webp",
            "name": "Grab",
            "sort": 600000,
            "system": {
                "actionType": {
                    "value": "action"
                },
                "actions": {
                    "value": 1
                },
                "category": "offensive",
                "description": {
                    "value": "<p>@Localize[PF2E.NPC.Abilities.Glossary.Grab]</p>"
                },
                "publication": {
                    "license": "OGL",
                    "remaster": false,
                    "title": "Pathfinder Bestiary"
                },
                "rules": [],
                "slug": "grab",
                "traits": {
                    "rarity": "common",
                    "value": []
                }
            },
            "type": "action"
        }
    ],
    "name": "Owlbear",
    "system": {
        "abilities": {
            "cha": {
                "mod": 0
            },
            "con": {
                "mod": 5
            },
            "dex": {
                "mod": 1
            },
            "int": {
                "mod": -4
            },
            "str": {
                "mod": 6
            },
            "wis": {
                "mod": 3
            }
        },
        "attributes": {
            "ac": {
                "details": "",
                "value": 21
            },
            "allSaves": {
                "value": ""
            },
            "hp": {
                "details": "",
                "max": 70,
                "temp": 0,
                "value": 70
            },
            "speed": {
                "otherSpeeds": [],
                "value": 25
            }
        },
        "details": {
            "blurb": "",
            "languages": {
                "details": "",
                "value": []
            },
            "level": {
                "value": 4
            },
            "privateNotes": "",
            "publicNotes": "<p>With the body of a powerful brown bear and the keen senses of an owl, the owlbear is a dangerous territorial predator, fearlessly attacking any creature that strays into its domain. Those who run afoul of an owlbear hear its terrifying screech only seconds before the massive creature is upon them, ripping them apart with deadly talons and a powerful beak.</p>\n<p>Although their origin is lost to time, owlbears are assumed to be the result of a magical experiment to make a more cunning predator. According to the legend, the wizard was too successful and ended up being the flrst victim of the beast. Today, owlbears can be found around the world, with a variety of features. While the most common subspecies looks like a brown bear with the features of a great horned owl, owlbears from the frozen north might resemble polar bears mixed with snowy owls, and in temperate rain forests they might resemble black bears with the heads of barn owls.</p>\n<p>Most owlbears live solitary lives, gathering only to mate and raise cubs, which are hatched from eggs. An owlbear's territory usually extends to around 5 miles from its lair, with clear signs of its habitat appearing with 1 mile (clawed up trees, gigantic feathers, and shredded carcasses). The lair of an owlbear rarely holds anything of value, but some adventurers have found trinkets, coins, and even jewelry in the massive pellets of undigested bones these monsters leave behind.</p>",
            "publication": {
                "license": "OGL",
                "remaster": false,
                "title": "Pathfinder Bestiary"
            }
        },
        "initiative": {
            "statistic": "perception"
        },
        "perception": {
            "details": "",
            "mod": 13,
            "senses": [
                {
                    "type": "low-light-vision"
                },
                {
                    "acuity": "imprecise",
                    "range": 30,
                    "type": "scent"
                }
            ]
        },
        "resources": {},
        "saves": {
            "fortitude": {
                "saveDetail": "",
                "value": 13
            },
            "reflex": {
                "saveDetail": "",
                "value": 7
            },
            "will": {
                "saveDetail": "",
                "value": 11
            }
        },
        "skills": {
            "acrobatics": {
                "base": 7
            },
            "athletics": {
                "base": 14
            },
            "intimidation": {
                "base": 10
            }
        },
        "traits": {
            "rarity": "common",
            "size": {
                "value": "lg"
            },
            "value": [
                "animal"
            ]
        }
    },
    "type": "npc"
}
"""
  end
end
