static const char norm_fg[] = "#d2d9d8";
static const char norm_bg[] = "#05060a";
static const char norm_border[] = "#939797";

static const char sel_fg[] = "#d2d9d8";
static const char sel_bg[] = "#94876F";
static const char sel_border[] = "#d2d9d8";

static const char urg_fg[] = "#d2d9d8";
static const char urg_bg[] = "#555A5C";
static const char urg_border[] = "#555A5C";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
