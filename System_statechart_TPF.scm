{
  "modelId": "b325fdb8-a6d7-4bbf-a7b4-278bc6488790",
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "angle": 0,
        "type": "Statechart",
        "id": "00ffb6d1-d225-4bc0-8b73-7df9987f57b7",
        "linkable": false,
        "z": 1,
        "attrs": {
          "name": {
            "text": "System_statechart_TPF"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface:\n    in event EV_SYS_BTN_ON_ACTIVE\n    in event EV_SYS_BTN_ON_IDLE\n    in event EV_SYS_BTN_MENU_ACTIVE\n    in event EV_SYS_BTN_MENU_IDLE\n    in event EV_SYS_BTN_MENU_ENT_ACTIVE\n    in event EV_SYS_BTN_MENU_ENT_IDLE\n    in event EV_SYS_SWITCH_AIRE_A_ACTIVE\n    in event EV_SYS_SWITCH_AIRE_A_IDLE\n    in event EV_SYS_SWITCH_AIRE_B_ACTIVE\n    in event EV_SYS_SWITCH_AIRE_B_IDLE\n    in event EV_SYS_SWITCH_FAILURE_ACTIVE\n    in event EV_SYS_SWITCH_FAILURE_IDLE\n    in event EV_SYS_SWITCH_OFF_ACTIVE\n    in event EV_SYS_SWITCH_OFF_IDLE\n    \ninternal:\n    var tick: integer\n    var tick_sys: integer\n    var aire_a_on : boolean\n    var aire_b_on : boolean\n    var buzzer_on : boolean\n    var display : string \n    const TICK_SWITCH_MAX : integer = 60\n    const MAX_TEMP : integer = 30\n    const TICK_FAILURE_MAX : integer = 40 "
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": -384,
          "y": -458
        },
        "size": {
          "height": 803,
          "width": 1353
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "z": 73,
        "embeds": [
          "a5ec5f0c-8b71-48f0-91cc-ebec938a6d14",
          "56302acf-f587-4a64-8a1a-1e4f24efc236",
          "65dc1c8d-1884-42bd-a5d9-fbe1b6391eb8",
          "ddc3c31b-729a-4ef7-8620-bdfafe127ecb",
          "4b201b95-d08c-4e0d-a38e-ebf31d83c26b",
          "84460ed8-f97f-4087-b6e1-d9e11ee6c6e1",
          "5e89c601-e163-44a1-82bc-403d28fd83e3",
          "abdbbe0d-0673-4f90-bbee-8c140211904a",
          "20eed164-02e9-4c04-8a9c-8c15f1d2caad",
          "d05a7a14-1d92-431b-9b3d-800a1d0a62cc",
          "b8a90d3c-3d92-4b63-aafd-e56c868f8281",
          "5cb2b8e7-0fd6-4d75-ac6a-d29b3e0f4bc9",
          "66cdce11-3d3a-4c38-bf94-bcb5ca9b5507",
          "a917622c-9af7-49ac-a924-20fe81e773d2",
          "56dc1c45-9c56-4f60-9cff-46f70a65a92c",
          "5b5c8fe6-b436-40fb-9dcf-d65fc315b0db",
          "cf87b9c2-11d5-4524-ac6d-17782a2c62f7",
          "185a7b3f-9f73-4a62-8f5b-e42aa8cf6704",
          "2db139fd-3782-4f92-bf08-d77bf4d68e81",
          "fb1bacd1-8fe0-4f1f-a8bc-846d313e9a68",
          "85978ac2-ae34-4b64-8f2d-1594b64983d2",
          "f102b6ae-d08f-49d3-8826-f73519a23597",
          "85bb0f3b-d3ad-4d25-bc7c-67e5462626da"
        ],
        "attrs": {
          "priority": {
            "text": 1
          },
          "name": {
            "text": "SYSTEM"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -216,
          "y": -294
        },
        "size": {
          "height": 142,
          "width": 237
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "cf87b9c2-11d5-4524-ac6d-17782a2c62f7",
        "z": 74,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "attrs": {
          "name": {
            "text": "ST_SYS_XX_IDLE"
          },
          "specification": {
            "text": "entry /\naire_a_on = true\nalways/aire_b_on = false\nalways/buzzer_on = false\nalways/display = \"\"\n"
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": -194,
          "y": -329
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "185a7b3f-9f73-4a62-8f5b-e42aa8cf6704",
        "z": 75,
        "embeds": [
          "53c9d590-1202-4207-923f-7645e1ba1e40"
        ],
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "attrs": {
          "name": {
            "fill": "#555555"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 249,
          "y": -261
        },
        "size": {
          "height": 145,
          "width": 373.46875
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "2db139fd-3782-4f92-bf08-d77bf4d68e81",
        "z": 77,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "embeds": [
          "f62a1f07-0995-4699-ab3c-5cc358b73288"
        ],
        "attrs": {
          "name": {
            "text": "ST_SYS_XX_ACTIVE"
          },
          "specification": {
            "text": "entry / tick--\nalways/ [aire_a_on == true ] /aire_a_on = true\nalways/ [aire_b_on == true ] /aire_b_on = true\nalways/display = \"TEMPERATURA DE MICRO Y AMB\""
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 492,
          "y": -39
        },
        "size": {
          "height": 151,
          "width": 256
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "fb1bacd1-8fe0-4f1f-a8bc-846d313e9a68",
        "z": 79,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "attrs": {
          "name": {
            "text": "ST_SYS_XX_OFF"
          },
          "specification": {
            "text": "entry /\naire_a_on=false\nalways/aire_b_on = false\nalways/buzzer_on = false\nalways/display = \"\"\n\n"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -202,
          "y": -98.5
        },
        "size": {
          "height": 110.78125,
          "width": 207.828125
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "85978ac2-ae34-4b64-8f2d-1594b64983d2",
        "z": 83,
        "embeds": [],
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "attrs": {
          "name": {
            "text": "ST_SYS_XX_STANDBY"
          },
          "specification": {
            "text": "entry /\naire_a_on=false\nalways/aire_b_on = false\nalways/buzzer_on = false\nalways/display = \"MENU\""
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 148.5,
          "y": 9
        },
        "size": {
          "height": 103,
          "width": 207
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "f102b6ae-d08f-49d3-8826-f73519a23597",
        "z": 86,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "attrs": {
          "name": {
            "text": "ST_SYS_XX_FAILURE"
          },
          "specification": {
            "text": "entry /tick--"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": -367,
          "y": 133
        },
        "size": {
          "height": 151,
          "width": 524.6875
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "85bb0f3b-d3ad-4d25-bc7c-67e5462626da",
        "z": 91,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "attrs": {
          "name": {
            "text": "ST_SYS_XX_SWITCH_MOTORS"
          },
          "specification": {
            "text": "always/ [aire_a_on == true && aire_b_on == false] \n/aire_a_on = false aire_b_on = true\nelse/ [aire_b_on == true && aire_a_on == false  ] \n/aire_b_on = false aire_a_on = true\n"
          }
        }
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -194,
          "y": -314
        },
        "id": "53c9d590-1202-4207-923f-7645e1ba1e40",
        "z": 94,
        "parent": "185a7b3f-9f73-4a62-8f5b-e42aa8cf6704",
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "f102b6ae-d08f-49d3-8826-f73519a23597"
        },
        "target": {
          "id": "85bb0f3b-d3ad-4d25-bc7c-67e5462626da",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 179,
              "dy": 44,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_SWITCH_FAILURE_ACTIVE\n[tick == 0]"
              }
            },
            "position": {
              "distance": 0.5096049618411373,
              "offset": -12,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "ddc3c31b-729a-4ef7-8620-bdfafe127ecb",
        "z": 95,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "f102b6ae-d08f-49d3-8826-f73519a23597"
        },
        "target": {
          "id": "85978ac2-ae34-4b64-8f2d-1594b64983d2",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 183,
              "dy": 68,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_BTN_ON_ACTIVE"
              }
            },
            "position": {
              "distance": 0.8455435016680242,
              "offset": 10.105232238769531,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "abdbbe0d-0673-4f90-bbee-8c140211904a",
        "z": 95,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "85bb0f3b-d3ad-4d25-bc7c-67e5462626da"
        },
        "target": {
          "id": "fb1bacd1-8fe0-4f1f-a8bc-846d313e9a68",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 67,
              "dy": 45.89637756347656,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_SWITCH_OFF_ACTIVE"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "4b201b95-d08c-4e0d-a38e-ebf31d83c26b",
        "z": 95,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "vertices": [
          {
            "x": 196,
            "y": 168
          },
          {
            "x": 238,
            "y": 168
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "f102b6ae-d08f-49d3-8826-f73519a23597"
        },
        "target": {
          "id": "fb1bacd1-8fe0-4f1f-a8bc-846d313e9a68",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 131,
              "dy": 56.89637756347656,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_SWITCH_OFF_ACTIVE"
              }
            },
            "position": {
              "distance": 0.4454849392507988,
              "offset": -9,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "20eed164-02e9-4c04-8a9c-8c15f1d2caad",
        "z": 95,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "vertices": [
          {
            "x": 427,
            "y": 56
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "85978ac2-ae34-4b64-8f2d-1594b64983d2"
        },
        "target": {
          "id": "fb1bacd1-8fe0-4f1f-a8bc-846d313e9a68",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 1,
              "dy": 52.89637756347656,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_SWITCH_OFF_ACTIVE"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "b8a90d3c-3d92-4b63-aafd-e56c868f8281",
        "z": 95,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "vertices": [
          {
            "x": 325,
            "y": -84
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "f102b6ae-d08f-49d3-8826-f73519a23597"
        },
        "target": {
          "id": "2db139fd-3782-4f92-bf08-d77bf4d68e81",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 101,
              "dy": 130,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_SWITCH_FAILURE_IDLE"
              }
            },
            "position": {
              "distance": 0.476,
              "offset": 37,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "4"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "84460ed8-f97f-4087-b6e1-d9e11ee6c6e1",
        "z": 95,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2db139fd-3782-4f92-bf08-d77bf4d68e81"
        },
        "target": {
          "id": "f102b6ae-d08f-49d3-8826-f73519a23597",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 127.5,
              "dy": 18,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_SWITCH_FAILURE_ACTIVE\n/tick = TICK_FAILURE_MAX"
              }
            },
            "position": {
              "distance": 0.604,
              "offset": 94,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "3"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "5e89c601-e163-44a1-82bc-403d28fd83e3",
        "z": 95,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "vertices": [],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2db139fd-3782-4f92-bf08-d77bf4d68e81"
        },
        "target": {
          "id": "fb1bacd1-8fe0-4f1f-a8bc-846d313e9a68",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 115,
              "dy": 13.896377563476562,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_SWITCH_OFF_ACTIVE"
              }
            },
            "position": {
              "distance": 0.6459154388868449,
              "offset": -64,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "66cdce11-3d3a-4c38-bf94-bcb5ca9b5507",
        "z": 95,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2db139fd-3782-4f92-bf08-d77bf4d68e81"
        },
        "target": {
          "id": "85978ac2-ae34-4b64-8f2d-1594b64983d2",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 167,
              "dy": 52,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_BTN_ON_ACTIVE"
              }
            },
            "position": {
              "distance": 0.3453984767197287,
              "offset": 17,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "d05a7a14-1d92-431b-9b3d-800a1d0a62cc",
        "z": 95,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "vertices": [
          {
            "x": 5,
            "y": -125
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "fb1bacd1-8fe0-4f1f-a8bc-846d313e9a68"
        },
        "target": {
          "id": "cf87b9c2-11d5-4524-ac6d-17782a2c62f7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 116,
              "dy": 11.896377563476562,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_SWITCH_OFF_IDLE"
              }
            },
            "position": {
              "distance": 0.5012218049429161,
              "offset": 9,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "a917622c-9af7-49ac-a924-20fe81e773d2",
        "z": 95,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "vertices": [
          {
            "x": 527,
            "y": -307
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "185a7b3f-9f73-4a62-8f5b-e42aa8cf6704"
        },
        "target": {
          "id": "cf87b9c2-11d5-4524-ac6d-17782a2c62f7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 100,
              "dy": 22.896377563476562,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "5b5c8fe6-b436-40fb-9dcf-d65fc315b0db",
        "z": 95,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "cf87b9c2-11d5-4524-ac6d-17782a2c62f7"
        },
        "target": {
          "id": "fb1bacd1-8fe0-4f1f-a8bc-846d313e9a68",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 129,
              "dy": 20.896377563476562,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_SWITCH_OFF_ACTIVE"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "5cb2b8e7-0fd6-4d75-ac6a-d29b3e0f4bc9",
        "z": 95,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "vertices": [
          {
            "x": 292,
            "y": -277
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "cf87b9c2-11d5-4524-ac6d-17782a2c62f7"
        },
        "target": {
          "id": "2db139fd-3782-4f92-bf08-d77bf4d68e81",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 9,
              "dy": 44.89637756347656,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_BTN_ON_ACTIVE\n/tick = TICK_SWITCH_MAX"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "56dc1c45-9c56-4f60-9cff-46f70a65a92c",
        "z": 95,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2db139fd-3782-4f92-bf08-d77bf4d68e81"
        },
        "target": {
          "id": "2db139fd-3782-4f92-bf08-d77bf4d68e81",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 213,
              "dy": 31,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_BTN_ON_IDLE[tick>0]"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "4"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "f62a1f07-0995-4699-ab3c-5cc358b73288",
        "z": 96,
        "parent": "2db139fd-3782-4f92-bf08-d77bf4d68e81",
        "vertices": [
          {
            "x": 674,
            "y": -367
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2db139fd-3782-4f92-bf08-d77bf4d68e81"
        },
        "target": {
          "id": "85bb0f3b-d3ad-4d25-bc7c-67e5462626da",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 504,
              "dy": 122,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_BTN_ON_IDLE\n[tick == 0]"
              }
            },
            "position": {
              "distance": 0.6362433520233832,
              "offset": 18.00000000000003,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "5"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "65dc1c8d-1884-42bd-a5d9-fbe1b6391eb8",
        "z": 97,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "vertices": [
          {
            "x": 873,
            "y": -186
          },
          {
            "x": 911,
            "y": 49
          },
          {
            "x": 911,
            "y": 255
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "85bb0f3b-d3ad-4d25-bc7c-67e5462626da"
        },
        "target": {
          "id": "cf87b9c2-11d5-4524-ac6d-17782a2c62f7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 9,
              "dy": 92,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_BTN_ON_IDLE"
              }
            },
            "position": {
              "distance": 0.4824561403508772,
              "offset": -82,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "56302acf-f587-4a64-8a1a-1e4f24efc236",
        "z": 98,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "85978ac2-ae34-4b64-8f2d-1594b64983d2"
        },
        "target": {
          "id": "cf87b9c2-11d5-4524-ac6d-17782a2c62f7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 97,
              "dy": 72,
              "rotate": true
            }
          },
          "priority": true
        },
        "router": {
          "name": "orthogonal",
          "args": {
            "padding": 8
          }
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_SYS_BTN_ON_ACTIVE"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "2"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "id": "a5ec5f0c-8b71-48f0-91cc-ebec938a6d14",
        "z": 99,
        "parent": "7bc999a7-8282-4899-bedd-d527c7f64e91",
        "vertices": [
          {
            "x": -98,
            "y": -146
          },
          {
            "x": -78,
            "y": -146
          }
        ],
        "attrs": {}
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "SystemStatechartTpf",
          "statemachinePrefix": "systemStatechartTpf",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": "",
          "exitState": "",
          "generic": ""
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}