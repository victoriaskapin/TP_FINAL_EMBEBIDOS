{
  "modelId": "1be00b20-48d8-47b1-b556-76aa82b42f72",
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
            "text": "Sensor_state_chart_TPF Local"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface: \n    in event EV_BTN_01_UP\n    in event EV_BTN_01_DOWN\n    in event EV_SYS_01_SIGNAL_DOWN\n    in event EV_SYS_SIGNAL_UP\n    out event EV_SYS_01_DOWN\n    \ninternal: \n    var tick: integer\n    var tick_sys: integer\n    var car_in_entry : boolean \n    var car_entrying : boolean\n    const DEL_BTN_01_MAX: integer = 50"
          }
        }
      },
      {
        "type": "Region",
        "position": {
          "x": 564,
          "y": -82
        },
        "size": {
          "height": 448,
          "width": 743
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "289b623c-c0d4-4b0f-a15c-37313cc06e5d",
        "z": 2,
        "embeds": [
          "2dae2fd5-fe65-411a-9a0b-a0d1b2b60afb",
          "b713b565-05f1-4e29-925b-d3cb61ccd8a6",
          "4fae59db-5527-47ba-9c1c-f77c771df232",
          "8b2bfae2-0e7d-4b02-b2f8-c290820e4426",
          "3f624751-5439-4440-8680-60d313ee66b2",
          "ab99bb51-d6f8-4107-b8d7-575a77527c9d",
          "9e9146ce-c048-4e66-802b-4ba205ee8d99",
          "c4fbfb3a-92f4-441b-a507-74a52f5adf1d",
          "745d07ff-cd64-49dd-869a-e9a1fa811b55",
          "03a47837-99e3-4bcd-839b-a27b40d5ca0e",
          "a9d8f68a-8403-4864-8b80-f534e7dd0f3e",
          "7292e491-67ea-4d59-9c6f-71397583ce13"
        ],
        "attrs": {
          "priority": {
            "text": 1
          },
          "name": {
            "text": "SENSORS"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 871,
          "y": -17.00000762939453
        },
        "size": {
          "height": 60,
          "width": 71.015625
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "c4fbfb3a-92f4-441b-a507-74a52f5adf1d",
        "z": 3,
        "parent": "289b623c-c0d4-4b0f-a15c-37313cc06e5d",
        "attrs": {
          "name": {
            "text": "ST_UP"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 871,
          "y": 235
        },
        "size": {
          "height": 60,
          "width": 71.015625
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "745d07ff-cd64-49dd-869a-e9a1fa811b55",
        "z": 4,
        "parent": "289b623c-c0d4-4b0f-a15c-37313cc06e5d",
        "attrs": {
          "name": {
            "text": "ST_DOWN"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 1036,
          "y": 93.99999618530273
        },
        "size": {
          "height": 60,
          "width": 72.015625
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "03a47837-99e3-4bcd-839b-a27b40d5ca0e",
        "z": 5,
        "parent": "289b623c-c0d4-4b0f-a15c-37313cc06e5d",
        "embeds": [
          "c72a165f-0c37-48eb-8d06-2cab337a259b",
          "f6f9968e-7d0d-4ebb-8f7b-fcead15767e7"
        ],
        "attrs": {
          "name": {
            "text": "ST_FALLING"
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 688,
          "y": 95
        },
        "size": {
          "height": 60,
          "width": 93.625
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "a9d8f68a-8403-4864-8b80-f534e7dd0f3e",
        "z": 6,
        "parent": "289b623c-c0d4-4b0f-a15c-37313cc06e5d",
        "embeds": [
          "4aa78af3-7f2c-43a2-8b29-3d215faacdfa",
          "ed6d6b82-a4eb-4921-b8b0-b5bb843cd42f"
        ],
        "attrs": {
          "name": {
            "text": "ST_INCREASING"
          }
        }
      },
      {
        "type": "Entry",
        "position": {
          "x": 899.0078125,
          "y": -65
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
        "id": "7292e491-67ea-4d59-9c6f-71397583ce13",
        "z": 7,
        "parent": "289b623c-c0d4-4b0f-a15c-37313cc06e5d",
        "embeds": [
          "bd10d7f6-4823-4eb7-8f59-b13f325f475f"
        ],
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
          "x": 899.0078125,
          "y": -50
        },
        "id": "bd10d7f6-4823-4eb7-8f59-b13f325f475f",
        "z": 8,
        "parent": "7292e491-67ea-4d59-9c6f-71397583ce13",
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
          "id": "7292e491-67ea-4d59-9c6f-71397583ce13"
        },
        "target": {
          "id": "c4fbfb3a-92f4-441b-a507-74a52f5adf1d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 39,
              "dy": 9.428579330444336,
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
        "id": "2dae2fd5-fe65-411a-9a0b-a0d1b2b60afb",
        "z": 9,
        "parent": "289b623c-c0d4-4b0f-a15c-37313cc06e5d",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "745d07ff-cd64-49dd-869a-e9a1fa811b55"
        },
        "target": {
          "id": "a9d8f68a-8403-4864-8b80-f534e7dd0f3e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 40,
              "dy": 29.428571701049805,
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
                "text": "EV_BTN_01_UP \n/tick = DEL_BTN_01_MAX"
              }
            },
            "position": {
              "distance": 0.5626430989341319,
              "offset": -21.810897660381045,
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
        "id": "b713b565-05f1-4e29-925b-d3cb61ccd8a6",
        "z": 10,
        "parent": "289b623c-c0d4-4b0f-a15c-37313cc06e5d",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "a9d8f68a-8403-4864-8b80-f534e7dd0f3e"
        },
        "target": {
          "id": "745d07ff-cd64-49dd-869a-e9a1fa811b55",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 21,
              "dy": 16.428573608398438,
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
                "text": "EV_BTN_01_DOWN\n[tick == 0]"
              }
            },
            "position": {
              "distance": 0.26336117186162583,
              "offset": 19.47259521484375,
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
        "id": "4fae59db-5527-47ba-9c1c-f77c771df232",
        "z": 11,
        "vertices": [],
        "parent": "289b623c-c0d4-4b0f-a15c-37313cc06e5d",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "a9d8f68a-8403-4864-8b80-f534e7dd0f3e"
        },
        "target": {
          "id": "c4fbfb3a-92f4-441b-a507-74a52f5adf1d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 14,
              "dy": 29.42858123779297,
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
                "text": "EV_BTN_01_UP [tick == 0]\n/raise EV_SYS_SIGNAL_UP"
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
        "id": "8b2bfae2-0e7d-4b02-b2f8-c290820e4426",
        "z": 12,
        "vertices": [
          {
            "x": 724,
            "y": 60
          }
        ],
        "parent": "289b623c-c0d4-4b0f-a15c-37313cc06e5d",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "03a47837-99e3-4bcd-839b-a27b40d5ca0e"
        },
        "target": {
          "id": "c4fbfb3a-92f4-441b-a507-74a52f5adf1d",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 33,
              "dy": 59.42858123779297,
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
                "text": "EV_BTN_01_UP\n[tick == 0]"
              }
            },
            "position": {
              "distance": 0.3709560040367615,
              "offset": 23,
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
        "id": "3f624751-5439-4440-8680-60d313ee66b2",
        "z": 13,
        "parent": "289b623c-c0d4-4b0f-a15c-37313cc06e5d",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "03a47837-99e3-4bcd-839b-a27b40d5ca0e"
        },
        "target": {
          "id": "745d07ff-cd64-49dd-869a-e9a1fa811b55",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 35,
              "dy": 36.42857360839844,
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
                "text": "EV_BTN_01_DOWN\n[tick == 0]\n/raise EV_SYS_01_SIGNAL_DOWN"
              }
            },
            "position": {
              "distance": 0.49913373534165706,
              "offset": -25.38789155473184,
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
        "id": "ab99bb51-d6f8-4107-b8d7-575a77527c9d",
        "z": 14,
        "vertices": [
          {
            "x": 1069,
            "y": 223
          }
        ],
        "parent": "289b623c-c0d4-4b0f-a15c-37313cc06e5d",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "c4fbfb3a-92f4-441b-a507-74a52f5adf1d"
        },
        "target": {
          "id": "03a47837-99e3-4bcd-839b-a27b40d5ca0e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 33,
              "dy": 11.42857551574707,
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
                "text": "EV_BTN_01_DOWN / tick =DEL_BTN_01_MAX"
              }
            },
            "position": {
              "distance": 0.625855644895402,
              "offset": -50.53212284993749,
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
        "id": "9e9146ce-c048-4e66-802b-4ba205ee8d99",
        "z": 15,
        "parent": "289b623c-c0d4-4b0f-a15c-37313cc06e5d",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "03a47837-99e3-4bcd-839b-a27b40d5ca0e"
        },
        "target": {
          "id": "03a47837-99e3-4bcd-839b-a27b40d5ca0e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 64.0078125,
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
            "attrs": {
              "text": {
                "text": "EV_BTN_01_UP\n[tick > 0]\n/ tick -- "
              }
            },
            "position": {
              "distance": 0.6121045405730817,
              "offset": -47.5883209005527,
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
        "id": "c72a165f-0c37-48eb-8d06-2cab337a259b",
        "z": 16,
        "vertices": [
          {
            "x": 1138,
            "y": 74
          }
        ],
        "parent": "03a47837-99e3-4bcd-839b-a27b40d5ca0e",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "03a47837-99e3-4bcd-839b-a27b40d5ca0e"
        },
        "target": {
          "id": "03a47837-99e3-4bcd-839b-a27b40d5ca0e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 36,
              "dy": 34.42857551574707,
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
                "text": "EV_BTN_01_DOWN \n[tick > 0] \n/tick--"
              }
            },
            "position": {
              "distance": 0.4432351594670999,
              "offset": 60.17794797244423,
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
        "id": "f6f9968e-7d0d-4ebb-8f7b-fcead15767e7",
        "z": 17,
        "vertices": [
          {
            "x": 1143,
            "y": 152.43
          }
        ],
        "parent": "03a47837-99e3-4bcd-839b-a27b40d5ca0e",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "a9d8f68a-8403-4864-8b80-f534e7dd0f3e"
        },
        "target": {
          "id": "a9d8f68a-8403-4864-8b80-f534e7dd0f3e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 63.012451171875,
              "dy": 14,
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
                "text": "EV_BTN_01_DOWN\n[tick > 0]\n/tick -- "
              }
            },
            "position": {
              "distance": 0.785059387888213,
              "offset": -61.506807203320975,
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
        "id": "4aa78af3-7f2c-43a2-8b29-3d215faacdfa",
        "z": 18,
        "parent": "a9d8f68a-8403-4864-8b80-f534e7dd0f3e",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "a9d8f68a-8403-4864-8b80-f534e7dd0f3e"
        },
        "target": {
          "id": "a9d8f68a-8403-4864-8b80-f534e7dd0f3e",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 7,
              "dy": 41.42857360839844,
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
                "text": "EV_BTN_01_UP\n[tick > 0] \n/ tick--"
              }
            },
            "position": {
              "distance": 0.23655710626148355,
              "offset": -43.773556763922215,
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
        "id": "ed6d6b82-a4eb-4921-b8b0-b5bb843cd42f",
        "z": 19,
        "vertices": [
          {
            "x": 651,
            "y": 122.00000381469727
          },
          {
            "x": 651,
            "y": 97
          },
          {
            "x": 673,
            "y": 71.00000381469727
          }
        ],
        "parent": "a9d8f68a-8403-4864-8b80-f534e7dd0f3e",
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
          "moduleName": "SensorStateChartTpf",
          "statemachinePrefix": "sensorStateChartTpf",
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