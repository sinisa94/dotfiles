/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int  borderpx       = 0; /* border pixel of windows */
static const unsigned int  snap           = 32; /* snap pixel */
static const unsigned int systraypinning  = 3; /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X+1 */
static const unsigned int systrayonleft   = 0; /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int  systrayspacing = 2; /* systray spacing */
static const int systraypinningfailfirst  = 1; /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int           showsystray    = 1; /* 0 means no systray */
static const int           showbar        = 1; /* 0 means no bar */
static const int           topbar         = 1; /* 0 means bottom bar */
static const int           statmonval     = 2; //staticstatus monitor
static const char         *fonts[]        = { "Iosevka:size=10" };
static const char          dmenufont[]    = "Iosevka:size=10";
static const char          col_gray1[]    = "#222222";
static const char          col_gray2[]    = "#444444";
static const char          col_gray3[]    = "#bbbbbb";
static const char          col_gray4[]    = "#eeeeee";
static const char          col_cyan[]     = "#1e1e1e";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6","7","8" };

static const Rule rules[]        = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING)  = title
                                                                                 tag:   5= "1 << 4"             2 0 1 listmon
	 */
	/* class            instance       title                                        tags mask     isfloating   monitor */
	{ "Gimp",           NULL,          NULL,                                        0,            1,            -1 },
	{ "firefox",        "Navigator",   "Mozilla Firefox",                           1,            0,            0  },
        { "Emacs",          NULL,          NULL,                                        1 << 2,       0,            2  },
        { "st-256color",    "st-256color", "~/dotfiles/tmux_start_app.sh",              1 << 3,       0,            1  },
        { "Pcmanfm",        "pcmanfm",     NULL,                                        1 << 1,       0,            2  },
        { "arduino",        NULL,          NULL,                                        0,            1,            -1 },
        { "gamescope",      NULL,          NULL,                                        1,            0,            0  },
        { "steam",          NULL,          NULL,                                        1 << 5,       0,            1  },
        { "Lutris",         NULL,          NULL,                                        1 << 5,       0,            1  },
        { "Brave-browser",  NULL,          NULL,                                        1,            0,            2  }
        
};

/* layout(s) */
static const float mfact          = 0.55; /* factor of master area size [0.05..0.95] */
static const int   nmaster        = 1; /* number of clients in master area */
static const int   resizehints    = 0; /* 1 means respect size hints in tiled resizals */
static const int   lockfullscreen = 1; /* 1 will force focus on the fullscreen window */
static const int   lpm[]          = {
        /* Index of preferred layout], if LENGTH(lpm)<#monitors -> default layout */
  0,0,3,
};

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
     	{ "TTT",      bstack },
	{ "===",      bstackhoriz },

};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
#include <X11/XF86keysym.h>

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "st", NULL };

static const Key keys[]                                                 = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v  = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v  = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_Up,     focusstack,     {.i  = +1 } }, //j
	{ MODKEY,                       XK_Down,   focusstack,     {.i  = -1 } }, //k
	{ MODKEY,                       XK_i,      incnmaster,     {.i  = +1 } },
	{ MODKEY,                       XK_p,      incnmaster,     {.i  = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f  = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f  = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v  = &layouts[0]} },
	{ MODKEY,                       XK_f,      togglefullscr,  {0} },
	{ MODKEY,                       XK_m,      setlayout,      {.v  = &layouts[2]} },
       	{ MODKEY,                       XK_u,      setlayout,      {.v  = &layouts[3]} },
	{ MODKEY,                       XK_o,      setlayout,      {.v  = &layouts[4]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_Left,   focusmon,       {.i  = -1 } }, //comma
	{ MODKEY,                       XK_Right,  focusmon,       {.i  = +1 } }, //period
	{ MODKEY|ShiftMask,             XK_Left,   tagmon,         {.i  = -1 } },
	{ MODKEY|ShiftMask,             XK_Right,  tagmon,         {.i  = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	{ MODKEY|ShiftMask,             XK_F12,    quit,           {0} }, //same as logout
      //{ MODKEY|ShiftMask,             XK_key,    spawn,          SHCMD("cmd")},
        { MODKEY,                       XK_c,      spawn,          SHCMD("st ~/dotfiles/tmux_start_app.sh cmus")},
        { MODKEY,                       XK_n,      spawn,          SHCMD("~/hhkb-i3.sh")},
        { MODKEY,                       XK_a,      spawn,          SHCMD("pcmanfm")},
        { MODKEY,                       XK_e,      spawn,          SHCMD("emacs")},
        { MODKEY,                       XK_F12,    spawn,          SHCMD("systemctl suspend && slock")},
        { MODKEY|ControlMask|ShiftMask, XK_F12,    spawn,          SHCMD("systemctl poweroff -i")},
        { MODKEY,                       XK_Pause,  spawn,          SHCMD("cmus-remote -u")},
        { MODKEY,                       XK_Page_Up,  spawn,        SHCMD("cmus-remote -v +10%")},
        { MODKEY,                       XK_Page_Down,  spawn,      SHCMD("cmus-remote -v -10%")},
        { 0,                            0xff61,    spawn,          SHCMD("scrot ~/Pictures/screenshots/%Y-%m-%d-%T-screenshot.png") }, // print_sceen
        // TODO fix caps writing "P" for no reason also enable xmodmap in autostart.sh        { MODKEY,                       0xffca,    zoom,           {0} }, 

};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

