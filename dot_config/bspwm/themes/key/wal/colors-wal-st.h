const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0D0D12", /* black   */
  [1] = "#443C62", /* red     */
  [2] = "#58535F", /* green   */
  [3] = "#534A70", /* yellow  */
  [4] = "#D12F32", /* blue    */
  [5] = "#FF3636", /* magenta */
  [6] = "#C35039", /* cyan    */
  [7] = "#9a9abb", /* white   */

  /* 8 bright colors */
  [8]  = "#6b6b82",  /* black   */
  [9]  = "#443C62",  /* red     */
  [10] = "#58535F", /* green   */
  [11] = "#534A70", /* yellow  */
  [12] = "#D12F32", /* blue    */
  [13] = "#FF3636", /* magenta */
  [14] = "#C35039", /* cyan    */
  [15] = "#9a9abb", /* white   */

  /* special colors */
  [256] = "#0D0D12", /* background */
  [257] = "#9a9abb", /* foreground */
  [258] = "#9a9abb",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
