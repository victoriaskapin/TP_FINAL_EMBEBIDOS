{
  "modelId": "a9fd845d-3ce0-4ca9-9239-54acdebd1d61",
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
            "text": "Actuator_state_chart_TPF"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface: \n    in event EV_LED_01_ON\n    in event EV_LED_01_OFF\n    in event EV_LED_BLINK\n\ninternal: \n    var tick: integer\n    var tick_sys: integer\n    var led_on : boolean\n    const TICK_BLINK_MAX: integer = 50"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 398,
          "y": 95
        },
        "size": {
          "height": 505,
          "width": 764
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "a77fa9d4-0f0d-4489-b42d-9fbe30569284",
        "z": 70,
        "embeds": [
          "2d74b148-3998-46bc-8cc1-06f7ee110520",
          "6ec84461-b3af-4af3-8108-3804c5088ef0",
          "bb5249bb-f0cd-4c4e-b046-b35f36899856",
          "c736fb58-6549-4cde-9530-1a859c1efadd",
          "5f940500-828d-4297-a72f-374f09c04e4c",
          "9c8bd5b2-b365-40dc-9974-cccd9d820fb5",
          "9070680a-9293-4d7a-b1db-65e8a4a30d24",
          "2af49025-ab8b-4ebc-bd1e-b0e50ff37f82",
          "ff2176d2-118b-4a69-9602-02591cca8fda",
          "5a8b0f75-e28c-4c60-9203-fd2d4e61a53a",
          "de7ac5c1-79b4-45c6-80b9-5cbc7dd853ec"
        ],
        "attrs": {
          "priority": {
            "text": 1
          },
          "name": {
            "text": "ACTUATOR"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 433.625,
          "y": 185
        },
        "size": {
          "height": 96,
          "width": 150
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "2af49025-ab8b-4ebc-bd1e-b0e50ff37f82",
        "z": 71,
        "parent": "a77fa9d4-0f0d-4489-b42d-9fbe30569284",
        "attrs": {
          "name": {
            "text": "ST_LED_OFF "
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 612,
          "y": 444
        },
        "size": {
          "height": 96,
          "width": 182.796875
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "ff2176d2-118b-4a69-9602-02591cca8fda",
        "z": 76,
        "parent": "a77fa9d4-0f0d-4489-b42d-9fbe30569284",
        "attrs": {
          "name": {
            "text": "ST_LED_ON"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "ff2176d2-118b-4a69-9602-02591cca8fda"
        },
        "target": {
          "id": "2af49025-ab8b-4ebc-bd1e-b0e50ff37f82",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 19,
              "dy": 29,
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
                "text": "EV_LED_01_OFF"
              }
            },
            "position": {
              "distance": 0.6770363664021503,
              "offset": 11.202103193329865,
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
        "id": "9070680a-9293-4d7a-b1db-65e8a4a30d24",
        "z": 83,
        "vertices": [],
        "parent": "a77fa9d4-0f0d-4489-b42d-9fbe30569284",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "2af49025-ab8b-4ebc-bd1e-b0e50ff37f82"
        },
        "target": {
          "id": "ff2176d2-118b-4a69-9602-02591cca8fda",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 74.796875,
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
                "text": "EV_LED_01_ON"
              }
            },
            "position": {
              "distance": 0.5819672131147541,
              "offset": -47,
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
        "id": "9c8bd5b2-b365-40dc-9974-cccd9d820fb5",
        "z": 83,
        "parent": "a77fa9d4-0f0d-4489-b42d-9fbe30569284",
        "vertices": [
          {
            "x": 530,
            "y": 337
          }
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 858,
          "y": 185
        },
        "size": {
          "height": 127.578125,
          "width": 279.84375
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "5a8b0f75-e28c-4c60-9203-fd2d4e61a53a",
        "z": 84,
        "parent": "a77fa9d4-0f0d-4489-b42d-9fbe30569284",
        "embeds": [
          "c68b961e-c811-4048-b453-977ab31adba7"
        ],
        "attrs": {
          "name": {
            "text": "ST_LED_BLINK"
          },
          "specification": {
            "text": "always / \n[tick == TICK_BLINK_MAX/2]\n/ led_on =true\nelse / [tick == 0] /led_on = false\n/tick == TICK_BLINK_MAX"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "2af49025-ab8b-4ebc-bd1e-b0e50ff37f82"
        },
        "target": {
          "id": "5a8b0f75-e28c-4c60-9203-fd2d4e61a53a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 91,
              "dy": 38.31549072265625,
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
                "text": "EV_LED_BLINK\n/tick = TICK_BLINK_MAX"
              }
            },
            "position": {
              "distance": 0.5768237323373774,
              "offset": 24.000007324218757,
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
        "id": "6ec84461-b3af-4af3-8108-3804c5088ef0",
        "z": 85,
        "parent": "a77fa9d4-0f0d-4489-b42d-9fbe30569284",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "ff2176d2-118b-4a69-9602-02591cca8fda"
        },
        "target": {
          "id": "5a8b0f75-e28c-4c60-9203-fd2d4e61a53a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 62,
              "dy": 55.31549072265625,
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
                "text": "EV_LED_BLINK\n/tick = TICK_BLINK_MAX"
              }
            },
            "position": {
              "distance": 0.6197505266643187,
              "offset": -53,
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
        "id": "bb5249bb-f0cd-4c4e-b046-b35f36899856",
        "z": 85,
        "parent": "a77fa9d4-0f0d-4489-b42d-9fbe30569284",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "5a8b0f75-e28c-4c60-9203-fd2d4e61a53a"
        },
        "target": {
          "id": "2af49025-ab8b-4ebc-bd1e-b0e50ff37f82",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 149.375,
              "dy": 15,
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
                "text": "EV_LED_01_OFF\n"
              }
            },
            "position": {
              "distance": 0.5349198503984138,
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
        "id": "c736fb58-6549-4cde-9530-1a859c1efadd",
        "z": 85,
        "parent": "a77fa9d4-0f0d-4489-b42d-9fbe30569284",
        "vertices": [],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "5a8b0f75-e28c-4c60-9203-fd2d4e61a53a"
        },
        "target": {
          "id": "ff2176d2-118b-4a69-9602-02591cca8fda",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 93.796875,
              "dy": 46,
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
                "text": "EV_LED_01_ON"
              }
            },
            "position": {
              "distance": 0.38287454320547054,
              "offset": -44,
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
        "id": "5f940500-828d-4297-a72f-374f09c04e4c",
        "z": 85,
        "parent": "a77fa9d4-0f0d-4489-b42d-9fbe30569284",
        "vertices": [
          {
            "x": 990,
            "y": 387
          }
        ],
        "attrs": {}
      },
      {
        "type": "Entry",
        "position": {
          "x": 490,
          "y": 148
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "entryKind": "Initial",
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "de7ac5c1-79b4-45c6-80b9-5cbc7dd853ec",
        "z": 86,
        "embeds": [
          "93e306cd-0f87-4ec5-b238-0f33368cbb87"
        ],
        "parent": "a77fa9d4-0f0d-4489-b42d-9fbe30569284",
        "attrs": {
          "name": {
            "fill": "#555555"
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
          "x": 490,
          "y": 163
        },
        "id": "93e306cd-0f87-4ec5-b238-0f33368cbb87",
        "z": 87,
        "parent": "de7ac5c1-79b4-45c6-80b9-5cbc7dd853ec",
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
          "id": "de7ac5c1-79b4-45c6-80b9-5cbc7dd853ec"
        },
        "target": {
          "id": "2af49025-ab8b-4ebc-bd1e-b0e50ff37f82",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 69.012451171875,
              "dy": 16,
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
            "position": {
              "distance": 0.689214773187123,
              "offset": -86.00000976562478,
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
        "id": "2d74b148-3998-46bc-8cc1-06f7ee110520",
        "z": 88,
        "vertices": [],
        "parent": "a77fa9d4-0f0d-4489-b42d-9fbe30569284",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "5a8b0f75-e28c-4c60-9203-fd2d4e61a53a"
        },
        "target": {
          "id": "5a8b0f75-e28c-4c60-9203-fd2d4e61a53a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 222,
              "dy": 5,
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
                "text": "EV_LED_BLINK /tick--"
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
        "id": "c68b961e-c811-4048-b453-977ab31adba7",
        "z": 89,
        "parent": "5a8b0f75-e28c-4c60-9203-fd2d4e61a53a",
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
          "moduleName": "ActuatorStateChartTpf",
          "statemachinePrefix": "actuatorStateChartTpf",
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