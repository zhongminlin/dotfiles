static const char norm_fg[] = "#eac5be";
static const char norm_bg[] = "#0F171A";
static const char norm_border[] = "#a38985";

static const char sel_fg[] = "#eac5be";
static const char sel_bg[] = "#A3665B";
static const char sel_border[] = "#eac5be";

static const char urg_fg[] = "#eac5be";
static const char urg_bg[] = "#5F515F";
static const char urg_border[] = "#5F515F";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
