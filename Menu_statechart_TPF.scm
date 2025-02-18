{
  "modelId": "af63acbb-8318-40db-8f5a-91c033eb94f9",
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
        "id": "78749915-0da0-40a2-862f-9e8d94c7c68e",
        "linkable": false,
        "z": 1,
        "attrs": {
          "name": {
            "text": "interactive_menu_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\n@SuperSteps(no)\n\ninterface: \n\n    in event btn_enter\n    in event btn_next\n\n    internal: \n    var menu_flag               :boolean\n    var motor_id                :integer=0\n    var submenu_1               :integer\n    var tiempo_falla            :integer=0\n    var tiempo_conmutacion      :integer=0\n    var set_point_temperatura   :integer=0\n\nconst MENU_01_MAX    :integer = 2\n\nconst MENU_02_0_MAX  :integer = 2\nconst MENU_02_1_MAX  :integer = 3\nconst MENU_02_2_MAX  :integer = 3\n    "
          }
        }
      },
      {
        "type": "State",
        "position": {
          "x": 427,
          "y": 65.5
        },
        "size": {
          "height": 86,
          "width": 137
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "847caf02-f577-4ed4-8c31-583d6bca12a7",
        "z": 332,
        "embeds": [
          "5cc7ad85-d296-4af4-9b2a-b7571db8ea75",
          "bb7c2f0d-b8ea-48d7-b1f5-a7ce340022fb"
        ],
        "attrs": {
          "name": {
            "text": "st_set_up_menu_1"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "847caf02-f577-4ed4-8c31-583d6bca12a7"
        },
        "target": {
          "id": "847caf02-f577-4ed4-8c31-583d6bca12a7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 75,
              "dy": 51,
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
                "text": "btn_next/\nsubmenu_1 = 0;\nmenu_flag=false"
              }
            },
            "position": {
              "distance": 0.5120847571140363,
              "offset": -36.54473114013672,
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
        "id": "bb7c2f0d-b8ea-48d7-b1f5-a7ce340022fb",
        "z": 333,
        "parent": "847caf02-f577-4ed4-8c31-583d6bca12a7",
        "vertices": [
          {
            "x": 475,
            "y": -37.5
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "847caf02-f577-4ed4-8c31-583d6bca12a7"
        },
        "target": {
          "id": "847caf02-f577-4ed4-8c31-583d6bca12a7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 111,
              "dy": 10.5,
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
                "text": "btn_next\n[submenu_1 < MENU_01_MAX]/submenu_1++;\n menu_flag=false"
              }
            },
            "position": {
              "distance": 0.5262121313155599,
              "offset": -52.88421630859375,
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
        "id": "5cc7ad85-d296-4af4-9b2a-b7571db8ea75",
        "z": 334,
        "parent": "847caf02-f577-4ed4-8c31-583d6bca12a7",
        "vertices": [
          {
            "x": 437,
            "y": -124
          },
          {
            "x": 485,
            "y": -124
          },
          {
            "x": 538,
            "y": -62
          }
        ],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 103,
          "y": 75
        },
        "size": {
          "height": 86,
          "width": 148
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
        "z": 364,
        "embeds": [],
        "attrs": {
          "name": {
            "text": "st_normal"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
        },
        "target": {
          "id": "847caf02-f577-4ed4-8c31-583d6bca12a7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 0,
              "dy": 38.61111068725586,
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
                "text": "btn_enter/\nmenu_flag=false ;\nsubmenu_1=0"
              }
            },
            "position": {
              "distance": 0.5392995272875171,
              "offset": -48,
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
        "id": "88aa9794-d50a-4672-a878-594cb3adcfb3",
        "z": 365,
        "vertices": [],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "847caf02-f577-4ed4-8c31-583d6bca12a7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 2,
              "dy": 65.61111068725586,
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 139,
              "dy": 56,
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
                "text": "btn_enter"
              }
            },
            "position": {
              "distance": 0.5283837735559408,
              "offset": -17.0765380859375,
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
        "id": "20a6af02-a5cf-4306-a277-9179c73aeab6",
        "z": 366,
        "vertices": [],
        "attrs": {}
      },
      {
        "type": "Entry",
        "position": {
          "x": 31,
          "y": 82
        },
        "size": {
          "height": 15,
          "width": 15
        },
        "angle": 0,
        "fixedRatio": true,
        "embedable": false,
        "linkable": true,
        "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
        "z": 367,
        "embeds": [
          "f70f632c-e54d-4002-9ec5-7baec620de10"
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
          "x": 31,
          "y": 97
        },
        "id": "f70f632c-e54d-4002-9ec5-7baec620de10",
        "z": 368,
        "parent": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb",
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
          "id": "a4d257fe-72cb-4334-9a1f-b5a8b4f886fb"
        },
        "target": {
          "id": "36b8548a-74b1-4925-ae23-291c03231ee6"
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
        "id": "9b5ce41b-0116-46a8-a603-ea4119c6e5d7",
        "z": 369,
        "vertices": [],
        "attrs": {}
      },
      {
        "type": "State",
        "position": {
          "x": 815,
          "y": -89
        },
        "size": {
          "height": 482,
          "width": 145
        },
        "angle": 0,
        "fixedRatio": false,
        "embedable": true,
        "linkable": true,
        "id": "b20bd7b8-920e-4d1b-a23f-20b234856167",
        "z": 385,
        "embeds": [
          "41b9ec33-d78d-4128-b899-ba0b8eff48ca",
          "c2aeeb38-71a6-4576-9ada-a8d6a8244a97",
          "c4b2d376-f07a-4206-b3e5-4873dcae9f33",
          "037de6dc-e675-4dd7-9088-ede3d1cc4ee3",
          "7e9a7a12-e161-489b-b93d-44cc3e7a9ab3",
          "5a5cbd3a-e0d8-4f91-901c-ef7904bf8546"
        ],
        "attrs": {
          "name": {
            "text": "st_set_up_menu_2"
          }
        }
      },
      {
        "type": "Transition",
        "source": {
          "id": "847caf02-f577-4ed4-8c31-583d6bca12a7"
        },
        "target": {
          "id": "b20bd7b8-920e-4d1b-a23f-20b234856167",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 7,
              "dy": 171,
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
                "text": "btn_enter[menu_flag==false]/\nmenu_flag=true"
              }
            },
            "position": {
              "distance": 0.529073486328125,
              "offset": -32,
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
        "id": "53734a66-617b-439d-acdb-56769a6f97e8",
        "z": 386,
        "vertices": [],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "b20bd7b8-920e-4d1b-a23f-20b234856167"
        },
        "target": {
          "id": "847caf02-f577-4ed4-8c31-583d6bca12a7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 112,
              "dy": 54.5,
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
                "text": "btn_enter\n\n"
              }
            },
            "position": {
              "distance": 0.5215006672528636,
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
        "id": "ef154941-b1f3-42dc-93f1-482a1149e252",
        "z": 386,
        "vertices": [],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "b20bd7b8-920e-4d1b-a23f-20b234856167"
        },
        "target": {
          "id": "b20bd7b8-920e-4d1b-a23f-20b234856167",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 144,
              "dy": 49,
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
                "text": "btn_next\n[submenu_1==0 && tiempo_falla<MENU_02_0_MAX]/ tiempo_falla++"
              }
            },
            "position": {
              "distance": 0.7435278230090953,
              "offset": 34.76560974121094,
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
        "id": "5a5cbd3a-e0d8-4f91-901c-ef7904bf8546",
        "z": 386,
        "parent": "b20bd7b8-920e-4d1b-a23f-20b234856167",
        "vertices": [
          {
            "x": 1432,
            "y": 27
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "b20bd7b8-920e-4d1b-a23f-20b234856167"
        },
        "target": {
          "id": "b20bd7b8-920e-4d1b-a23f-20b234856167",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 148,
              "dy": 93,
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
                "text": "btn_next[tiempo_falla==MENU_02_0_MAX]/tiempo_falla=0"
              }
            },
            "position": {
              "distance": 0.23946108883829761,
              "offset": -10.75341796875,
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
        "id": "7e9a7a12-e161-489b-b93d-44cc3e7a9ab3",
        "z": 387,
        "vertices": [
          {
            "x": 1357,
            "y": -16
          }
        ],
        "parent": "b20bd7b8-920e-4d1b-a23f-20b234856167",
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "b20bd7b8-920e-4d1b-a23f-20b234856167"
        },
        "target": {
          "id": "b20bd7b8-920e-4d1b-a23f-20b234856167",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 141,
              "dy": 181,
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
                "text": "btn_next\n[submenu_1==1 && tiempo_conmutacion <MENU_02_1_MAX]/tiempo_conmutacion ++"
              }
            },
            "position": {
              "distance": 0.7586659904897075,
              "offset": 24.394332885742188,
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
        "id": "037de6dc-e675-4dd7-9088-ede3d1cc4ee3",
        "z": 388,
        "parent": "b20bd7b8-920e-4d1b-a23f-20b234856167",
        "vertices": [
          {
            "x": 1413,
            "y": 188
          },
          {
            "x": 1413,
            "y": 126
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "b20bd7b8-920e-4d1b-a23f-20b234856167"
        },
        "target": {
          "id": "b20bd7b8-920e-4d1b-a23f-20b234856167",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 132,
              "dy": 212,
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
                "text": "btn_next[tiempo_conmutacion ==MENU_02_1_MAX]/tiempo_conmutacion=0"
              }
            },
            "position": {
              "distance": 0.7457222217939062,
              "offset": 16,
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
        "id": "c4b2d376-f07a-4206-b3e5-4873dcae9f33",
        "z": 389,
        "parent": "b20bd7b8-920e-4d1b-a23f-20b234856167",
        "vertices": [
          {
            "x": 1366,
            "y": 159
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "b20bd7b8-920e-4d1b-a23f-20b234856167"
        },
        "target": {
          "id": "b20bd7b8-920e-4d1b-a23f-20b234856167",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 143,
              "dy": 370,
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
                "text": "btn_next[set_point_temperatura==MENU_02_2_MAX]/set_point_temperatura=0"
              }
            },
            "position": {
              "distance": 0.6864718925783719,
              "offset": 11,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "7"
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
        "id": "c2aeeb38-71a6-4576-9ada-a8d6a8244a97",
        "z": 391,
        "parent": "b20bd7b8-920e-4d1b-a23f-20b234856167",
        "vertices": [
          {
            "x": 1361,
            "y": 319
          },
          {
            "x": 1203,
            "y": 281
          }
        ],
        "attrs": {}
      },
      {
        "type": "Transition",
        "source": {
          "id": "b20bd7b8-920e-4d1b-a23f-20b234856167"
        },
        "target": {
          "id": "b20bd7b8-920e-4d1b-a23f-20b234856167",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": 140,
              "dy": 442,
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
                "text": "btn_next\n[submenu_1==2 && set_point_temperatura <MENU_02_2_MAX]/set_point_temperatura ++"
              }
            },
            "position": {
              "distance": 0.2532808108891437,
              "offset": -24.5,
              "angle": 0
            }
          },
          {
            "attrs": {
              "root": {
                "opacity": 1
              },
              "label": {
                "text": "6"
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
        "id": "41b9ec33-d78d-4128-b899-ba0b8eff48ca",
        "z": 392,
        "parent": "b20bd7b8-920e-4d1b-a23f-20b234856167",
        "vertices": [
          {
            "x": 1518,
            "y": 256
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
          "moduleName": "InteractiveMenuStatechart",
          "statemachinePrefix": "interactiveMenuStatechart",
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