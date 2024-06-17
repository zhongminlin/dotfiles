const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#05060a", /* black   */
  [1] = "#555A5C", /* red     */
  [2] = "#94876F", /* green   */
  [3] = "#3D5D81", /* yellow  */
  [4] = "#57708C", /* blue    */
  [5] = "#75899C", /* magenta */
  [6] = "#92A1AC", /* cyan    */
  [7] = "#d2d9d8", /* white   */

  /* 8 bright colors */
  [8]  = "#939797",  /* black   */
  [9]  = "#555A5C",  /* red     */
  [10] = "#94876F", /* green   */
  [11] = "#3D5D81", /* yellow  */
  [12] = "#57708C", /* blue    */
  [13] = "#75899C", /* magenta */
  [14] = "#92A1AC", /* cyan    */
  [15] = "#d2d9d8", /* white   */

  /* special colors */
  [256] = "#05060a", /* background */
  [257] = "#d2d9d8", /* foreground */
  [258] = "#d2d9d8",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
