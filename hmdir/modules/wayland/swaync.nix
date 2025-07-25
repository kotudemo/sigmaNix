{pkgs, ...}: {
  home.packages = with pkgs; [
    swaynotificationcenter
    wf-recorder
  ];
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = ["swaync"];
    };
  };

  xdg.configFile."swaync/style.css".text = ''
        @define-color shadow rgba(0, 0, 0, 0.25);

    @define-color base #3C3836;
    @define-color mantle #282828;
    @define-color crust #1D2021;

    @define-color text #FBF1C7;
    @define-color subtext0 #CBDBB2;
    @define-color subtext1 #D5C4A1;

    @define-color surface0 #3C3836;
    @define-color surface1 #665C54;
    @define-color surface2 #7C6F64;

    @define-color green #98971A;

    * {
        font-family: "Hack Nerd Font";
        background-clip: border-box;
    }

    /* #notifications_box { */
    /*   border: solid 4px red; */
    /* } */

    label {
        color: @text;
    }

    .notification {
        border: @green;
        box-shadow: none;
        /* margin: 0px; */
        /* margin: -15px -10px -15px -10px; */
        border-radius: 4px;
        background: inherit;
        /* background: @theme_bg_color; */
        /* background: shade(alpha(@borders, 2.55), 0.25); */
    }

    .notification button {
        background: transparent;
        border-radius: 0px;
        border: none;
        margin: 0px;
        padding: 0px;
    }

    .notification button:hover {
        background: @surface0;
        /* background: @insensitive_bg_color; */
    }


    .notification-content {
        min-height: 64px;
        margin: 10px;
        padding: 0px;
        border-radius: 0px;
    }

    .close-button {
        background: @crust;
        color: @surface2;
    }

    .notification-default-action,
    .notification-action {
        background: transparent;
        border: none;
    }


    .notification-default-action {
        border-radius: 4px;
    }

    /* When alternative actions are visible */
    .notification-default-action:not(:only-child) {
        border-bottom-left-radius: 0px;
        border-bottom-right-radius: 0px;
    }

    .notification-action {
        border-radius: 0px;
        padding: 2px;
        color: @text;
        /* color: @theme_text_color; */
    }

    /* add bottom border radius to eliminate clipping */
    .notification-action:first-child {
        border-bottom-left-radius: 4px;
    }

    .notification-action:last-child {
        border-bottom-right-radius: 4px;
    }

    /*** Notification ***/
    /* Notification header */
    .summary {
        color: @text;
        /* color: @theme_text_color; */
        font-size: 16px;
        padding: 0px;
    }

    .time {
        color: @subtext0;
        /* color: alpha(@theme_text_color, 0.9); */
        font-size: 12px;
        text-shadow: none;
        margin: 0px 0px 0px 0px;
        padding: 2px 0px;
    }

    .body {
        font-size: 14px;
        font-weight: 500;
        color: @subtext1;
        /* color: alpha(@text, 0.9); */
        /* color: alpha(@theme_text_color, 0.9); */
        text-shadow: none;
        margin: 0px 0px 0px 0px;
    }

    .body-image {
        border-radius: 4px;
    }

    /* The "Notifications" and "Do Not Disturb" text widget */
    .top-action-title {
        color: @text;
        /* color: @theme_text_color; */
        text-shadow: none;
    }

    /* Control center */

    .control-center {
        /* background: transparent; */
        background: @crust;
        /* background: @theme_bg_color; */
        border: 2px solid #A89984;
        border-radius: 0px;
        box-shadow: 0px 0px 2px black;
    }

    .blank-window {
        background: alpha(black, 0.2);
    }

    /* .right.overlay-indicator { */
    /*   border: solid 5px red; */
    /* } */

    .control-center-list {
        /* background: @base; */
        background: @crust;
        min-height: 5px;
        /* border: 1px solid @surface1; */
        border-top: none;
        border-radius: 0px 0px 4px 4px;
    }

    .control-center-list-placeholder,
    .notification-group-icon,
    .notification-group {
        /* opacity: 1.0; */
        /* opacity: 0; */
        color: alpha(@theme_text_color, 0.50);
    }

    .notification-group {
        /* unset the annoying focus thingie */
        all: unset;
        border: none;
        opacity: 0;
        padding: 0px;
        box-shadow: none;
        /* selectable: no; */
    }

    .notification-group>box {
        all: unset;
        background: @mantle;
        /* background: alpha(currentColor, 0.072); */
        padding: 8px;
        margin: 0px;
        /* margin: 0px -5px; */
        border: none;
        border-radius: 4px;
        box-shadow: none;
    }


    .notification-row {
        outline: none;
        transition: all 1s ease;
        background: @base;
        /* background: @theme_bg_color; */
        border: 1px solid @crust;
        margin: 10px 5px 0px 5px;
        border-radius: 4px;
        /* box-shadow: 0px 0px 4px black; */
        /* background: alpha(currentColor, 0.05); */
    }

    .notification-row:focus,
    .notification-row:hover {
        box-shadow: none;
    }

    .control-center-list>row,
    .control-center-list>row:focus,
    .control-center-list>row:hover {
        background: transparent;
        border: none;
        margin: 0px;
        padding: 5px 10px 5px 10px;
        box-shadow: none;
    }

    .control-center-list>row:last-child {
        padding: 5px 10px 10px 10px;
    }


    /* Window behind control center and on all other monitors */
    .blank-window {
        background: transparent;
    }

    /*** Widgets ***/

    /* Title widget */
    .widget-title {
        margin: 0px;
        background: inherit;
        /* background: @theme_bg_color; */
        border-radius: 4px 4px 0px 0px;
        /* border: 1px solid @surface1; */
        border-bottom: none;
        padding-bottom: 20px;
    }

    .widget-title>label {
        margin: 18px 10px;
        font-size: 20px;
        font-weight: 500;
    }

    .widget-title>button {
        font-weight: 700;
        padding: 7px 3px;
        margin-right: 10px;
        background: @mantle;
        color: @text;
        /* color: @theme_text_color; */
        /* border: none; */
        border-radius: 4px;
    }

    .widget-title>button:hover {
        background: @base;
        /* background: alpha(currentColor, 0.1); */
    }

    /* Label widget */
    .widget-label {
        margin: 0px;
        padding: 0px;
        min-height: 5px;
        background: @mantle;
        /* background: @theme_bg_color; */
        border-radius: 0px 0px 4px 4px;
        /* border: 1px solid @surface1; */
        border-top: none;
    }

    .widget-label>label {
        font-size: 0px;
        font-weight: 400;
    }

    /* Menubar */
    .widget-menubar {
        background: inherit;
        /* background: @theme_bg_color; */
        /* border: 1px solid @surface1; */
        border-top: none;
        border-bottom: none;
    }

    .widget-menubar>box>box {
        margin: 5px 10px 5px 10px;
        min-height: 40px;
        border-radius: 4px;
        background: transparent;
    }

    .widget-menubar>box>box>button {
        background: @mantle;
        /* background: alpha(currentColor, 0.05); */
        min-width: 85px;
        min-height: 50px;
        margin-right: 13px;
        font-size: 17px;
        padding: 0px;
    }

    .widget-menubar>box>box>button:nth-child(4) {
        margin-right: 0px;
    }

    .widget-menubar button:focus {
        box-shadow: none;
    }

    .widget-menubar button:focus:hover {
        background: @base;
        /* background: alpha(currentColor,0.1); */
        box-shadow: none;
    }

    .widget-menubar>box>revealer>box {
        margin: 5px 10px 5px 10px;
        background: @mantle;
        /* background: alpha(currentColor, 0.05); */
        border-radius: 4px;
    }

    .widget-menubar>box>revealer>box>button {
        background: transparent;
        min-height: 50px;
        padding: 0px;
        margin: 5px;
    }

    /* Buttons grid */
    .widget-buttons-grid {
        /* background-color: @theme_bg_color; */
        background-color: @mantle;
        /* border: 1px solid @surface1; */
        border-top: none;
        border-bottom: none;
        font-size: 14px;
        font-weight: 500;
        margin: 0px;
        padding: 5px;
        border-radius: 0px;
    }

    .widget-buttons-grid>flowbox>flowboxchild {
        background: @mantle;
        /* background: alpha(currentColor, 0.05); */
        border-radius: 4px;
        min-height: 50px;
        min-width: 85px;
        margin: 5px;
        padding: 0px;
    }

    .widget-buttons-grid>flowbox>flowboxchild>button {
        background: transparent;
        border-radius: 4px;
        margin: 0px;
        border: none;
        box-shadow: none;
    }


    .widget-buttons-grid>flowbox>flowboxchild>button:hover {
        background: @mantle;
        /* background: alpha(currentColor, 0.1); */
    }

    /* Mpris widget */
    .widget-mpris {
        padding: 10px;
        padding-bottom: 35px;
        padding-top: 35px;
        margin-bottom: -33px;
    }

    .widget-mpris>box {
        padding: 0px;
        margin: -5px 0px -10px 0px;
        padding: 0px;
        border-radius: 4px;
        /* background: alpha(currentColor, 0.05); */
        background: @mantle;
    }

    .widget-mpris>box>button:nth-child(1),
    .widget-mpris>box>button:nth-child(3) {
        margin-bottom: 0px;
    }

    .widget-mpris>box>button:nth-child(1) {
        margin-left: -25px;
        margin-right: -25px;
        opacity: 0;
    }

    .widget-mpris>box>button:nth-child(3) {
        margin-left: -25px;
        margin-right: -25px;
        opacity: 0;
    }

    .widget-mpris-album-art {
        all: unset;
    }

    /* Player button box */
    .widget-mpris>box>carousel>widget>box>box:nth-child(2) {
        margin: 5px 0px -5px 90px;
    }

    /* Player buttons */
    .widget-mpris>box>carousel>widget>box>box:nth-child(2)>button {
        border-radius: 4px;
    }

    .widget-mpris>box>carousel>widget>box>box:nth-child(2)>button:hover {
        background: alpha(currentColor, 0.1);
    }

    carouselindicatordots {
        opacity: 0;
    }

    .widget-mpris-title {
        color: #eeeeee;
        font-weight: bold;
        font-size: 1.25rem;
        text-shadow: 0px 0px 5px rgba(0, 0, 0, 0.5);
    }

    .widget-mpris-subtitle {
        color: #eeeeee;
        font-size: 1rem;
        text-shadow: 0px 0px 3px rgba(0, 0, 0, 1);
    }

    .widget-mpris-player {
        border-radius: 0px;
        margin: 0px;
    }

    .widget-mpris-player>box>image {
        margin: 0px 0px -48px 0px;
    }

    .notification-group>box.vertical {
        /* border: solid 5px red; */
        margin-top: 3px
    }

    /* Backlight and volume widgets */
    .widget-backlight,
    .widget-volume {
        background-color: @crust;
        /* background-color: @theme_bg_color; */
        /* border: 1px solid @surface1; */
        border-top: none;
        border-bottom: none;
        font-size: 13px;
        font-weight: 600;
        border-radius: 0px;
        margin: 0px;
        padding: 0px;
    }

    .widget-volume>box {
        background: @mantle;
        /* background: alpha(currentColor, 0.05); */
        border-radius: 4px;
        margin: 5px 10px 5px 10px;
        min-height: 50px;
    }

    .widget-volume>box>label {
        min-width: 50px;
        padding: 0px;
    }

    .widget-volume>box>button {
        min-width: 50px;
        box-shadow: none;
        padding: 0px;
    }

    .widget-volume>box>button:hover {
        /* background: alpha(currentColor, 0.05); */
        background: @surface0;
    }

    .widget-volume>revealer>list {
        background: @mantle;
        /* background: alpha(currentColor, 0.05); */
        border-radius: 4px;
        margin-top: 5px;
        padding: 0px;
    }

    .widget-volume>revealer>list>row {
        padding-left: 10px;
        min-height: 40px;
        background: transparent;
    }

    .widget-volume>revealer>list>row:hover {
        background: transparent;
        box-shadow: none;
        border-radius: 4px;
    }

    .widget-backlight>scale {
        background: @mantle;
        /* background: alpha(currentColor, 0.05); */
        border-radius: 0px 4px 4px 0px;
        margin: 5px 10px 5px 0px;
        padding: 0px 10px 0px 0px;
        min-height: 50px;
    }

    .widget-backlight>label {
        background: @surface0;
        /* background: alpha(currentColor, 0.05); */
        margin: 5px 0px 5px 10px;
        border-radius: 4px 0px 0px 4px;
        padding: 0px;
        min-height: 50px;
        min-width: 50px;
    }

    /* DND widget */
    .widget-dnd {
        margin: 8px;
        font-size: 1.1rem;
        padding-top: 20px;
    }

    .widget-dnd>switch {
        font-size: initial;
        border-radius: 12px;
        background: @surface0;
        border: 1px solid @green;
        box-shadow: none;
    }

    .widget-dnd>switch:checked {
        background: @surface2;
    }

    .widget-dnd>switch slider {
        background: @green;
        border-radius: 12px;
    }

    /* Toggles */
    .toggle:checked {
        background: @surface1;
        /* background: @theme_selected_bg_color; */
    }

    /*.toggle:not(:checked) {
        color: rgba(128, 128, 128, 0.5);
    }*/
    .toggle:checked:hover {
        background: @surface2;
        /* background: alpha(@theme_selected_bg_color, 0.75); */
    }

    /* Sliders */
    scale {
        padding: 0px;
        margin: 0px 10px 0px 10px;
    }

    scale trough {
        border-radius: 4px;
        background: @surface0;
        /* background: alpha(currentColor, 0.1); */
    }

    scale highlight {
        border-radius: 5px;
        min-height: 10px;
        margin-right: -5px;
    }

    scale slider {
        margin: -10px;
        min-width: 10px;
        min-height: 10px;
        background: transparent;
        box-shadow: none;
        padding: 0px;
    }

    scale slider:hover {}

    .right.overlay-indicator {
        all: unset;
    }
  '';
  xdg.configFile."swaync/config.json".text = ''
    {
      "positionX": "right",
      "positionY": "top",
      "layer": "overlay",
      "layer-shell": "true",
      "cssPriority": "application",
      "control-center-margin-top": 10,
      "control-center-margin-bottom": 10,
      "control-center-margin-right": 10,
      "control-center-margin-left": 10,
      "notification-icon-size": 64,
      "notification-body-image-height": 128,
      "notification-body-image-width": 200,
      "timeout": 10,
      "timeout-low": 5,
      "timeout-critical": 0,
      "fit-to-screen": true,
      "control-center-width": 400,
      "control-center-height": 650,
      "notification-window-width": 350,
      "keyboard-shortcuts": true,
      "image-visibility": "when-available",
      "transition-time": 200,
      "hide-on-clear": false,
      "hide-on-action": true,
      "script-fail-notify": true,
      "widgets": [
        "title",
        "menubar#desktop",
        "volume",
        "backlight#mobile",
        "mpris",
        "dnd",
        "notifications"
      ],
      "widget-config": {
        "title": {
          "text": "Notifications",
          "clear-all-button": true,
          "button-text": " Clear All "
        },
        "menubar#desktop": {
          "menu#powermode-buttons": {
            "label": " 󰌪 ",
            "position": "left",
            "actions": [
              {
                "label": "Performance",
                "command": "powerprofilesctl set performance"
              },
              {
                "label": "Balanced",
                "command": "powerprofilesctl set balanced"
              },
              {
                "label": "Power-saver",
                "command": "powerprofilesctl set power-saver"
              }
            ]
          },
          "menu#screenshot": {
            "label": "  ",
            "position": "left",
            "actions": [
              {
                "label": "󰹑  Whole screen",
                "command": "grimblast --notify --cursor --freeze copy output"
              },
              {
                "label": "󰩭  Window / Region",
                "command": "grimblast --notify --cursor --freeze copy area"
              }
            ]
          },
          "menu#record": {
            "label": " 󰕧 ",
            "position": "left",
            "actions": [
              {
                "label": "  Record screen",
                "command": "record screen & ; swaync-client -t"
              },
              {
                "label": "  Record selection",
                "command": "record area & ; swaync-client -t"
              },
              {
                "label": "  Record GIF",
                "command": "record gif & ; swaync-client -t"
              },
              {
                "label": "󰻃  Stop",
                "command": "record stop"
              }
            ]
          },
          "menu#power-buttons": {
            "label": "  ",
            "position": "left",
            "actions": [
              {
                "label": "  Lock",
                "command": "swaylock"
              },
              {
                "label": "  Reboot",
                "command": "systemctl reboot"
              },
              {
                "label": "  Shut down",
                "command": "systemctl poweroff"
              }
            ]
          }
        },
        "backlight#mobile": {
          "label": " 󰃠 ",
          "device": "panel"
        },
        "volume": {
          "label": "",
          "expand-button-label": "",
          "collapse-button-label": "",
          "show-per-app": true,
          "show-per-app-icon": true,
          "show-per-app-label": false
        },
        "dnd": {
          "text": " Do Not Disturb"
        },
        "mpris": {
          "image-size": 85,
          "image-radius": 5
        }
      }
    }
  '';
}
