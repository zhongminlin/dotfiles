const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0F171A", /* black   */
  [1] = "#5F515F", /* red     */
  [2] = "#A3665B", /* green   */
  [3] = "#F19D74", /* yellow  */
  [4] = "#D2A26C", /* blue    */
  [5] = "#817C87", /* magenta */
  [6] = "#BFA7A8", /* cyan    */
  [7] = "#eac5be", /* white   */

  /* 8 bright colors */
  [8]  = "#a38985",  /* black   */
  [9]  = "#5F515F",  /* red     */
  [10] = "#A3665B", /* green   */
  [11] = "#F19D74", /* yellow  */
  [12] = "#D2A26C", /* blue    */
  [13] = "#817C87", /* magenta */
  [14] = "#BFA7A8", /* cyan    */
  [15] = "#eac5be", /* white   */

  /* special colors */
  [256] = "#0F171A", /* background */
  [257] = "#eac5be", /* foreground */
  [258] = "#eac5be",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
