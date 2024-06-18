static const char norm_fg[] = "#9a9abb";
static const char norm_bg[] = "#0D0D12";
static const char norm_border[] = "#6b6b82";

static const char sel_fg[] = "#9a9abb";
static const char sel_bg[] = "#58535F";
static const char sel_border[] = "#9a9abb";

static const char urg_fg[] = "#9a9abb";
static const char urg_bg[] = "#443C62";
static const char urg_border[] = "#443C62";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
