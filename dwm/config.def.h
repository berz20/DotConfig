/* See LICENSE file for copyright and license details. */
/* Copyright (C) 2020-2022 Aditya Shakya <adi1090x@gmail.com>
 *
 * DWM Configuration for Archcraft
 * Patched By : siduck76 <https://github.com/siduck76>
 *
 * */

/* ******************** Configurations ******************** */
static const unsigned int borderpx = 3; /* border pixel of windows */
static const unsigned int default_border =
    1; // to switch back to default border after dynamic border resizing via
       // keybinds
static const unsigned int snap = 26; /* snap pixel */
static const int swallowfloating =
    0; /* 1 means swallow floating windows by default */
static const unsigned int gappih = 5; /* horiz inner gap between windows */
static const unsigned int gappiv = 5; /* vert inner gap between windows */
static const unsigned int gappoh =
    5; /* horiz outer gap between windows and screen edge */
static const unsigned int gappov =
    5; /* vert outer gap between windows and screen edge */
static int smartgaps =
    0; /* 1 means no outer gap when there is only one window */
static const unsigned int systraypinning =
    0; /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor
          X */
static const unsigned int systrayspacing = 5; /* systray spacing */
static const int systraypinningfailfirst =
    1; /* 1: if pinning fails,display systray on the 1st monitor,False: display
          systray on last monitor*/
static const int showsystray = 1; /* 0 means no systray */
static const int showbar = 1;     /* 0 means no bar */
enum showtab_modes {
  showtab_never,
  showtab_auto,
  showtab_nmodes,
  showtab_always
};
static const int showtab = showtab_auto;
static const int toptab = True;
static const int viewonrulestag = 1; /* 1 means when open applications view will
                                        move to tags defined in rules*/
static const Bool viewontag = True;  /* Switch view on tag switch */
static const int topbar = 1;         /* 0 means bottom bar */
static const int horizpadbar = 10;
static const int vertpadbar = 10;
static const int vertpadtab = 34;
static const int user_bh =
    2; /* 2 is the default spacing around the bar's font */
static const int xoffset = -5; // X offset for status bar text
static const int yoffset = 0;  // Y offset for status bar text
static const int horizpadtabi = 10;
static const int horizpadtabo = 10;
static const int scalepreview = 4;
static int tag_preview = 1; /* 1 means enable, 0 is off */

/* ******************** Fonts ******************** */
static const char *keyboardLayout = "us";
static const char *fonts[] = {"JetBrainsMono:size=11",
                              "JetBrainsMono Nerd Font:size=11.5"};
static const char dmenufont[] = "monospace:size=11";
static const int colorfultag =
    1; /* 0 means use SchemeSel for selected non vacant tag */

/* ******************** Colors ******************** */
#include "themes/gruvchad.h"
static const char *colors[][3] = {
    /*               	   fg      bg      border   */
    [SchemeNorm] = {gray3, black, gray2},
    [SchemeSel] = {gray4, blue, blue},
    [TabSel] = {blue, gray2, black},
    [TabNorm] = {gray3, black, black},
    [SchemeTag] = {gray3, black, black},
    [SchemeTag1] = {blue, black, black},
    [SchemeTag2] = {red, black, black},
    [SchemeTag3] = {yellow, black, black},
    [SchemeTag4] = {orange, black, black},
    [SchemeTag5] = {pink, black, black},
    [SchemeTag6] = {cyan, black, black},
    [SchemeTag7] = {green, black, black},
    [SchemeTag8] = {gray5, black, black},
    [SchemeLayout] = {blue, black, black},
    [SchemeBtnPrev] = {green, black, black},
    [SchemeBtnNext] = {yellow, black, black},
    [SchemeBtnClose] = {red, black, black},
};

/* ******************** Tags/Workspaces ******************** */
static char *tags[] = {"", "", "", "", "", "", "", ""};
// 
static const int tagschemes[] = {SchemeTag1, SchemeTag2, SchemeTag3,
                                 SchemeTag4, SchemeTag5, SchemeTag6,
                                 SchemeTag7, SchemeTag8};

static const unsigned int ulinepad =
    5; /* horizontal padding between the underline and tag */
static const unsigned int ulinestroke =
    2; /* thickness / height of the underline */
static const unsigned int ulinevoffset =
    0; /* how far above the bottom of the bar the line should appear */
static const int ulineall =
    0; /* 1 to show underline on all tags, 0 for just the active ones */

/* ******************** Window Rules ******************** */
static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    // mancano noswallow isterminal
    /* class      			        instance    title       tags
       mask iscentered x            x            isfloating    monitor scratchad
     */
    {"st-256color", NULL, NULL, 0, 0, 0, 0, 0, -1, 0},
    {"Vivado", NULL, "win0", 0, 1, 0, 0, 1, -1, 0},
    {"JidePopup", NULL, NULL, 0, 0, 0, 0, 1, -1, 0},
    {"MATLAB 2022b", NULL, "MATLAB", 0, 1, 0, 0, 1, -1, 0},
    /* {"sun-awt-X11-XWindowPeer", NULL, "TabCompletionPopup", 0, 0, 0, 0, 1,
       -1, */
    /*  0}, */
    /* {"sun-awt-X11-XWindowPeer", NULL, "Command HistoryWindow", 0, 0, 0, 0, 1,
     */
    /*  -1, 0}, */
    {"file_progress", NULL, NULL, 0, 0, 0, 0, 1, -1, 0},
    {"confirm", NULL, NULL, 0, 0, 0, 0, 1, -1, 0},
    {"dialog", NULL, NULL, 0, 0, 0, 0, 1, -1, 0},
    {"download", NULL, NULL, 0, 0, 0, 0, 1, -1, 0},
    {"notification", NULL, NULL, 0, 0, 0, 0, 1, -1, 0},
    {"confirmreset", NULL, NULL, 0, 0, 0, 0, 1, -1, 0},
    {"error", NULL, NULL, 0, 0, 0, 0, 1, -1, 0},
    {"splash", NULL, NULL, 0, 0, 0, 0, 1, -1, 0},
    {"alacritty-float", NULL, NULL, 0, 1, 0, 0, 1, -1, 0},
    {"Qalculate-gtk", NULL, NULL, 0, 1, 0, 0, 1, -1, 0},
    {"Viewnior", NULL, NULL, 0, 1, 0, -1, 1, -1, 0},
    {"MPlayer", NULL, NULL, 0, 1, 0, 0, 0, -1, 0},
    {"Pcmanfm", NULL, NULL, 0, 1, 0, 0, 0, -1, 0},
    {"Music", NULL, NULL, 0, 1, 0, 0, 0, -1, 0},
    {"Yad", NULL, NULL, 0, 1, 0, 0, 0, -1, 0},
    {"feh", NULL, NULL, 0, 0, 0, -1, 0, -1, 0},
    {"VSCodium", NULL, NULL, 1 << 0, 0, 0, 0, 0, -1, 0},
    {"firefox", NULL, NULL, 1 << 1, 0, 0, 0, 0, -1, 0},
    {"Thunar", NULL, NULL, 1 << 2, 1, 0, 0, 0, -1, 0},
    {"Soffice", NULL, NULL, 1 << 3, 1, 0, 0, 0, -1, 0},
    {"Zathura", NULL, NULL, 1 << 3, 0, 0, 0, 0, -1, 0},
    {"Evince", NULL, NULL, 1 << 3, 0, 0, 0, 0, -1, 0},
    {"Inkscape", NULL, NULL, 1 << 4, 1, 0, 0, 0, -1, 0},
    {"sozi", NULL, NULL, 1 << 4, 1, 0, 0, 0, -1, 0},
    {"Gimp", NULL, NULL, 1 << 4, 1, 0, 0, 0, -1, 0},
    {"thunderbird", NULL, NULL, 1 << 5, 1, 0, 0, 0, -1, 0},
    {"TelegramDesktop", NULL, NULL, 1 << 5, 1, 0, 0, 0, -1, 0},
    {"vlc", NULL, NULL, 1 << 6, 1, 0, 0, 0, -1, 0},
    {"Spotify", NULL, NULL, 1 << 6, 1, 0, 0, 0, -1, 0},
    {"Nitrogen", NULL, NULL, 1 << 7, 0, 0, 0, 0, -1, 0},
    {"Pavucontrol", NULL, NULL, 1 << 7, 1, 0, 0, 1, -1, 0},
    {"Lxappearance", NULL, NULL, 1 << 7, 1, 0, 0, 1, -1, 0},
    {"VirtualBox Manager", NULL, NULL, 1 << 7, 0, 0, 0, 0, -1, 0},
    {"Gnome-boxes", NULL, NULL, 1 << 7, 0, 0, 0, 0, -1, 0},
    {"Grub-customizer", NULL, NULL, 1 << 7, 0, 0, 0, 0, -1, 0},
    {"Nm-connection-editor", NULL, NULL, 1 << 7, 1, 0, 0, 1, -1, 0},
    {"Blueman-manager", NULL, NULL, 1 << 7, 1, 0, 0, 0, -1, 0},
    {"Gnome-pomodoro", NULL, NULL, 1 << 7, 1, 0, 0, 0, -1, 0},
    {"Pulseaudio-equalizer-gtk", NULL, NULL, 1 << 7, 1, 0, 0, 0, -1, 0},
    {"baobab", NULL, NULL, 1 << 7, 1, 0, 0, 0, -1, 0},
    {"Xfce4-power-manager-settings", NULL, NULL, 1 << 7, 1, 0, 0, 1, -1, 0},
    {NULL, NULL, "Event Tester", 0, 0, 0, 0, 0, -1, 0}, /* xev */
    {NULL, NULL, "scratchpad", 0, 0, 0, 0, 1, -1, 's'},
    {NULL, NULL, "lf", 0, 1, 0, 0, 1, -1, 'r'},
    {NULL, NULL, "gotop", 0, 1, 0, 0, 1, -1, 'g'},
    {NULL, NULL, "ipython", 0, 1, 0, 0, 1, -1, 'c'},
};

/* ******************** Layout(s) ******************** */
static const float mfact = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;    /* number of clients in master area */
static const int resizehints =
    0; /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen =
    1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT                                                           \
  1 /* nrowgrid layout: force two clients to always split vertically */
#include "functions.h"

static const Layout layouts[] = {
    /* symbol     arrange function */
    {"", tile}, /* first entry is default */
    {"", monocle},
    {"", deck},
    {"", nrowgrid},
    {"", gaplessgrid},
    {"", centeredmaster},
    {"", centeredfloatingmaster},
    {"", tatami},
    {"", NULL}, /* no layout function means floating behavior */
};

// { "[]=",      tile },    /* first entry is default */
// { "M[]",      monocle },
// // { "@[]",      spiral },
// // { "/[]",      dwindle },
// { "H[]",      deck },
// { "TTT",      bstack },
// // { "===",      bstackhoriz },
// // { "HHH",      grid },
// { "###",      nrowgrid },
// // { "---",      horizgrid },
// { ":::",      gaplessgrid },
// { "|M|",      centeredmaster },
// { ">M>",      centeredfloatingmaster },
// { "|+|",      tatami },
// // { "><>",      NULL },    /* no layout function means floating behavior */
/* ******************** Key definitions ******************** */
#define MODKEY Mod4Mask
#define ALTKEY Mod1Mask
#define TAGKEYS(KEY, TAG)                                                      \
  {MODKEY, KEY, view, {.ui = 1 << TAG}},                                       \
      {MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}},               \
      {ALTKEY, KEY, tag, {.ui = 1 << TAG}},                                    \
      {MODKEY | ControlMask | ShiftMask, KEY, toggletag, {.ui = 1 << TAG}},

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                                                             \
  {                                                                            \
    .v = (const char *[]) { "/bin/sh", "-c", cmd, NULL }                       \
  }
#define STATUSBAR "dwmblocks"

/* ******************** Commands ******************** */
static char dmenumon[2] =
    "0"; /* component of dmenucmd, manipulated in spawn() */

static const char *dmenucmd[] = {"/home/berz/.config/dwm/bin/dwmdmenu.sh",
                                 NULL};
/* Launch Apps */
static const char *stcmd[] = {"st", NULL};
static const char *termcmd[] = {"/home/berz/.config/dwm/bin/dwmterm.sh", NULL};
static const char *scratchpadcmd[] = {"s",  "st",          "-t", "scratchpad",
                                      "-g", "190x10+5+48", NULL};
static const char *scratchLFcmd[] = {"r",      "st", "-t", "lf", "-g",
                                     "130x35", "-e", "lf", NULL};
static const char *scratchGotopcmd[] = {"g",      "st", "-t",    "gotop", "-g",
                                        "130x35", "-e", "gotop", NULL};
static const char *scratchCalccmd[] = {
    "c", "st", "-t", "ipython", "-g", "130x35", "-e", "ipython", NULL};
static const char *editcmd[] = {"st", "-e", "nvim", NULL};
static const char *floatterm[] = {"/home/berz/.config/dwm/bin/dwmterm.sh",
                                  "--float", NULL};
static const char *fmcmd[] = {"/home/berz/.config/dwm/bin/dwmapps.sh", "--file",
                              NULL};
static const char *geanycmd[] = {"/home/berz/.config/dwm/bin/dwmapps.sh",
                                 "--editor", NULL};
static const char *webcmd[] = {"/home/berz/.config/dwm/bin/dwmapps.sh", "--web",
                               NULL};
static const char *musiccmd[] = {"/home/berz/.config/dwm/bin/dwmapps.sh",
                                 "--music", NULL};
static const char *pdfcmd[] = {"/home/berz/.config/dwm/bin/dwmapps.sh", "--pdf",
                               NULL};
static const char *mailcmd[] = {"/home/berz/.config/dwm/bin/dwmapps.sh",
                                "--mail", NULL};

/* Rofi Menus */
static const char *rofi_cmd[] = {"/home/berz/.config/dwm/rofi/bin/launcher",
                                 NULL};
static const char *rofi_rootcmd[] = {"/home/berz/.config/dwm/rofi/bin/asroot",
                                     NULL};
static const char *rofi_layoutcmd[] = {
    "/home/berz/.config/dwm/rofi/bin/layouts", NULL};
static const char *rofi_mpdcmd[] = {"/home/berz/.config/dwm/rofi/bin/mpd",
                                    NULL};
static const char *rofi_nmcmd[] = {
    "/home/berz/.config/dwm/rofi/bin/network_menu", NULL};
static const char *rofi_powercmd[] = {
    "/home/berz/.config/dwm/rofi/bin/powermenu", NULL};
static const char *rofi_shotcmd[] = {
    "/home/berz/.config/dwm/rofi/bin/screenshot", NULL};
static const char *rofi_wincmd[] = {"/home/berz/.config/dwm/rofi/bin/windows",
                                    NULL};
static const char *rofi_calccmd[] = {"/home/berz/.config/dwm/rofi/bin/calc",
                                     NULL};
static const char *rofi_killcmd[] = {"/home/berz/.config/dwm/rofi/bin/kill",
                                     NULL};

/* Misc */
static const char *cpickcmd[] = {"color-gpick", NULL};
static const char *lockcmd[] = {"betterlockscreen", "--lock", NULL};
static const char *layoutswitcher[] = {
    "/home/berz/.config/dwm/bin/layoutmenu.sh", NULL};

/* Hardware keys for volume and brightness */
#include <X11/XF86keysym.h>
static const char *mutevol[] = {"/home/berz/.config/dwm/run/volume.sh",
                                "--toggle", NULL};
static const char *upvol[] = {"/home/berz/.config/dwm/run/volume.sh", "--inc",
                              NULL};
static const char *downvol[] = {"/home/berz/.config/dwm/run/volume.sh", "--dec",
                                NULL};
// static const char *mutevol[] 			= { "volume",
// "--toggle", NULL
// };
// static const char *upvol[]   			= { "volume", "--inc",
// NULL
// };
// static const char *downvol[] 			= { "volume", "--dec",
// NULL };
static const char *upbl[] = {"/home/berz/.config/dwm/run/brightness.sh",
                             "--inc", NULL};
static const char *downbl[] = {"/home/berz/.config/dwm/run/brightness.sh",
                               "--dec", NULL};
static const char *nxsong[] = {"/home/berz/.config/dwm/run/player.sh", "--next",
                               NULL};
static const char *pvsong[] = {"/home/berz/.config/dwm/run/player.sh", "--prev",
                               NULL};
static const char *pssong[] = {"/home/berz/.config/dwm/run/player.sh",
                               "--toggle", NULL};
static const char *pasong[] = {"/home/berz/.config/dwm/run/player.sh", "--all",
                               NULL};
static const char *rs_on[] = {"gammastep", "-m", "randr", "-PO", "3200", NULL};
static const char *rs_off[] = {"gammastep", "-m", "randr", "-x", NULL};

/* Screenshot */
static const char *shotnow[] = {"takeshot", "--now", NULL};
static const char *shotin5[] = {"takeshot", "--in5", NULL};
static const char *shotin10[] = {"takeshot", "--in10", NULL};
static const char *shotwin[] = {"takeshot", "--win", NULL};
static const char *shotarea[] = {"takeshot", "--area", NULL};

/* ******************** Keybindings ******************** */
static Key keys[] = {
    /* modifier 				key
     * function argument
     */

    // Hardware Keys -----------
    {0, XK_Caps_Lock, spawn, SHCMD("setxkbmap -option caps:swapescape")},
    {0, XF86XK_AudioMute, spawn, {.v = mutevol}},
    {0, XF86XK_AudioLowerVolume, spawn, {.v = downvol}},
    {0, XF86XK_AudioRaiseVolume, spawn, {.v = upvol}},
    {0, XF86XK_MonBrightnessUp, spawn, {.v = upbl}},
    {0, XF86XK_MonBrightnessDown, spawn, {.v = downbl}},
    {MODKEY | ShiftMask, XK_r, spawn, {.v = rs_off}},
    {MODKEY, XK_r, spawn, {.v = rs_on}},
    {ControlMask | ShiftMask, XK_j, spawn, {.v = pvsong}},
    {ControlMask | ShiftMask, XK_k, spawn, {.v = nxsong}},
    {ControlMask | ShiftMask, XK_space, spawn, {.v = pssong}},
    {Mod1Mask | ControlMask | ShiftMask, XK_space, spawn, {.v = pasong}},

    // Print Keys -----------
    {MODKEY, XK_Print, spawn, {.v = shotnow}},
    {ALTKEY, XK_Print, spawn, {.v = shotin5}},
    {ShiftMask, XK_Print, spawn, {.v = shotin10}},
    {ControlMask, XK_Print, spawn, {.v = shotwin}},
    {ALTKEY | ControlMask, XK_Print, spawn, {.v = shotarea}},

    // Terminals -----------
    {MODKEY, XK_Return, spawn, {.v = stcmd}},
    {MODKEY | ShiftMask, XK_Return, spawn, {.v = floatterm}},
    {MODKEY, XK_c, togglescratch, {.v = scratchpadcmd}},
    {MODKEY, XK_v, togglescratch, {.v = scratchLFcmd}},
    {MODKEY, XK_b, togglescratch, {.v = scratchGotopcmd}},
    {MODKEY, XK_m, togglescratch, {.v = scratchCalccmd}},

    // Launch Apps -----------
    {MODKEY | ShiftMask, XK_f, spawn, {.v = fmcmd}},
    {MODKEY | ShiftMask, XK_e, spawn, {.v = editcmd}},
    {MODKEY | ShiftMask, XK_w, spawn, {.v = webcmd}},
    {MODKEY | ShiftMask, XK_m, spawn, {.v = musiccmd}},
    {MODKEY | ShiftMask, XK_z, spawn, {.v = pdfcmd}},
    {MODKEY | ShiftMask, XK_p, spawn, {.v = mailcmd}},

    // Rofi Menus -----------
    {ALTKEY, XK_F1, spawn, {.v = rofi_cmd}},
    {MODKEY, XK_n, spawn, {.v = rofi_nmcmd}},
    {MODKEY, XK_q, spawn, {.v = rofi_powercmd}},
    {MODKEY | ShiftMask, XK_s, spawn, {.v = rofi_shotcmd}},
    {MODKEY, XK_w, spawn, {.v = rofi_wincmd}},
    {MODKEY, XK_p, spawn, {.v = rofi_killcmd}},
    {MODKEY, XK_o, spawn, {.v = dmenucmd}},
    {MODKEY | ControlMask, XK_r, spawn, {.v = rofi_rootcmd}},

    // Misc -----------
    {MODKEY | ControlMask, XK_p, spawn, {.v = cpickcmd}},
    {ALTKEY | ControlMask, XK_l, spawn, {.v = lockcmd}},

    // Tags -----------
    TAGKEYS(XK_1, 0) TAGKEYS(XK_2, 1) TAGKEYS(XK_3, 2) TAGKEYS(XK_4, 3)
        TAGKEYS(XK_5, 4) TAGKEYS(XK_6, 5) TAGKEYS(XK_7, 6) TAGKEYS(XK_8, 7)
            TAGKEYS(XK_9, 8)

    // DWM Session	-----------
    {MODKEY | ControlMask, XK_q, quit, {0}},             // Quit DWM
    {MODKEY | ControlMask | ShiftMask, XK_r, quit, {1}}, // Restart DWM

    // Border and Gaps -----------
    /* Borders */
    {MODKEY | ShiftMask,
     XK_equal,
     setborderpx,
     {.i = +1}}, // Increase border width
    {MODKEY | ShiftMask,
     XK_minus,
     setborderpx,
     {.i = -1}}, // Decrease border width
    {MODKEY | ShiftMask, XK_BackSpace, setborderpx, {.i = default_border}},

    /* Gaps */
    // overall gaps
    {MODKEY | ShiftMask, XK_bracketleft, incrgaps, {.i = +1}},
    {MODKEY | ShiftMask, XK_bracketright, incrgaps, {.i = -1}},
    {MODKEY | ShiftMask, XK_backslash, defaultgaps, {0}}, // Default gaps
    {MODKEY | ShiftMask, XK_g, togglegaps, {0}},          // Toggle gaps

    // inner gaps
    {MODKEY | ShiftMask, XK_i, incrigaps, {.i = +1}},
    {MODKEY | ControlMask | ShiftMask, XK_i, incrigaps, {.i = -1}},

    // outer gaps
    {MODKEY | ControlMask, XK_o, incrogaps, {.i = +1}},
    {MODKEY | ControlMask | ShiftMask, XK_o, incrogaps, {.i = -1}},

    // Window Management -----------
    /* Murder */
    {MODKEY, XK_x, killclient, {0}},            // Kill window
    {MODKEY, XK_Escape, spawn, SHCMD("xkill")}, // xkill

    /* Switch */
    {MODKEY, XK_j, focusstack, {.i = +1}}, // Cycle window
    {MODKEY, XK_k, focusstack, {.i = -1}},
    {MODKEY | ShiftMask, XK_j, movestack, {.i = +1}}, // Switch master
    {MODKEY | ShiftMask, XK_k, movestack, {.i = -1}},

    {MODKEY, XK_Left, focusstack, {.i = +1}}, // Cycle window
    {MODKEY, XK_Right, focusstack, {.i = -1}},
    {MODKEY | ShiftMask, XK_Left, movestack, {.i = +1}}, // Switch master
    {MODKEY | ShiftMask, XK_Right, movestack, {.i = -1}},

    {MODKEY, XK_i, incnmaster, {.i = +1}}, // Verticle
    {MODKEY, XK_u, incnmaster, {.i = -1}}, // Horizontal

    /* Resize */
    {MODKEY, XK_h, setmfact, {.f = -0.05}}, // Shrink left
    {MODKEY, XK_l, setmfact, {.f = +0.05}}, // Shrink right

    {MODKEY | Mod1Mask, XK_Left, viewtoleft, {0}},
    {MODKEY | Mod1Mask, XK_Right, viewtoright, {0}},
    {MODKEY | Mod1Mask, XK_j, viewtoleft, {0}},
    {MODKEY | Mod1Mask, XK_k, viewtoright, {0}},
    {MODKEY | ControlMask, XK_Left, viewprev, {0}},
    {MODKEY | ControlMask, XK_Right, viewnext, {0}},
    {MODKEY | ControlMask, XK_j, viewprev, {0}},
    {MODKEY | ControlMask, XK_k, viewnext, {0}},
    {MODKEY | ControlMask | ShiftMask, XK_Left, tagtoprev, {0}},
    {MODKEY | ControlMask | ShiftMask, XK_Right, tagtonext, {0}},
    {MODKEY | ControlMask | ShiftMask, XK_j, tagtoleft, {0}},
    {MODKEY | ControlMask | ShiftMask, XK_k, tagtoright, {0}},

    /* Misc */
    {MODKEY, XK_Tab, zoom, {0}},                 // Switch to master
    {ALTKEY, XK_Tab, view, {0}},                 // Switch to last tag
    {MODKEY, XK_d, hidewin, {0}},                // Hide window
    {MODKEY | ShiftMask, XK_d, restorewin, {0}}, // Restore window
    {MODKEY, XK_0, view, {.ui = ~0}},
    {MODKEY | ShiftMask, XK_0, tag, {.ui = ~0}},

    // Layouts -----------
    {ALTKEY | ControlMask, XK_space, spawn, {.v = rofi_layoutcmd}},

    {MODKEY, XK_comma, cyclelayout, {.i = -1}},
    {MODKEY, XK_period, cyclelayout, {.i = +1}},
    {MODKEY | ShiftMask, XK_space, togglefloating, {0}},
    {MODKEY, XK_s, togglesticky, {0}},
    {MODKEY, XK_f, togglebar, {0}},

    {MODKEY, XK_space, setlayout, {0}},
    {MODKEY, XK_t, setlayout, {.v = &layouts[1]}}, // Tile

};

/* ******************** Button definitions ******************** */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle,
 * ClkClientWin, or ClkRootWin */
static Button buttons[] = {
    /* click                event mask      button          function argument */
    {ClkLtSymbol, 0, Button1, setlayout, {0}},
    {ClkLtSymbol, 0, Button3, spawn, {.v = rofi_layoutcmd}},
    {ClkWinTitle, 0, Button2, zoom, {0}},
    {ClkStatusText, 0, Button1, sigstatusbar, {.i = 1}},
    {ClkStatusText, 0, Button2, sigstatusbar, {.i = 2}},
    {ClkStatusText, 0, Button3, sigstatusbar, {.i = 3}},

    {ClkClientWin, MODKEY, Button1, moveorplace, {.i = 0}},
    {ClkClientWin, MODKEY, Button2, togglefloating, {0}},
    {ClkClientWin, MODKEY | ControlMask, Button1, resizemouse, {0}},
    {ClkClientWin, ControlMask, Button1, dragmfact, {0}},
    {ClkClientWin, ControlMask, Button3, dragcfact, {0}},
    {ClkTagBar, 0, Button1, view, {0}},
    {ClkTagBar, 0, Button3, toggleview, {0}},
    {ClkTagBar, MODKEY, Button1, tag, {0}},
    {ClkTagBar, MODKEY, Button3, toggletag, {0}},
    {ClkTabBar, 0, Button1, focuswin, {0}},
    {ClkTabBar, 0, Button1, focuswin, {0}},
    {ClkTabPrev, 0, Button1, movestack, {.i = -1}},
    {ClkTabNext, 0, Button1, movestack, {.i = +1}},
    {ClkTabClose, 0, Button1, killclient, {0}},
    {ClkRootWin, 0, Button1, spawn, {.v = rofi_cmd}},
    {ClkRootWin, 0, Button2, spawn, {.v = rofi_powercmd}},
    {ClkRootWin, 0, Button3, spawn, {.v = rofi_nmcmd}},
};

/* ******************** DWMC ******************** */
void setlayoutex(const Arg *arg) { setlayout(&((Arg){.v = &layouts[arg->i]})); }

void viewex(const Arg *arg) { view(&((Arg){.ui = 1 << arg->ui})); }

void viewall(const Arg *arg) { view(&((Arg){.ui = ~0})); }

void toggleviewex(const Arg *arg) { toggleview(&((Arg){.ui = 1 << arg->ui})); }

void tagex(const Arg *arg) { tag(&((Arg){.ui = 1 << arg->ui})); }

void toggletagex(const Arg *arg) { toggletag(&((Arg){.ui = 1 << arg->ui})); }

void tagall(const Arg *arg) { tag(&((Arg){.ui = ~0})); }

/* signal definitions */
/* signum must be greater than 0 */
/* trigger signals using `xsetroot -name "fsignal:<signame> [<type> <value>]"`
 */
static Signal signals[] = {
    /* signum           function */
    {"focusstack", focusstack},
    {"setmfact", setmfact},
    {"togglebar", togglebar},
    {"incnmaster", incnmaster},
    {"togglefloating", togglefloating},
    {"focusmon", focusmon},
    {"tagmon", tagmon},
    {"zoom", zoom},
    {"view", view},
    {"viewall", viewall},
    {"viewex", viewex},
    {"toggleview", view},
    {"toggleviewex", toggleviewex},
    {"tag", tag},
    {"tagall", tagall},
    {"tagex", tagex},
    {"toggletag", tag},
    {"toggletagex", toggletagex},
    {"killclient", killclient},
    {"quit", quit},
    {"setlayout", setlayout},
    {"setlayoutex", setlayoutex},
};
