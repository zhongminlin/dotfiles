import colors

colors = colors.pywal

config.load_autoconfig()

# dark mode
c.colors.webpage.darkmode.enabled = True

# clipboard
c.content.javascript.clipboard = 'access-paste'

# fonts
# c.fonts.default_family = [ "CaskaydiaCove Nerd Font", "Noto Color Emoji" ]
# c.fonts.default_size = "8pt"

# set qutebrowser colors

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = colors[5]

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = colors[1]

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = colors[0]

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = colors[10]

# Background color of the completion widget category headers.
c.colors.completion.category.bg = colors[0]

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = colors[0]

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = colors[0]

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = colors[5]

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = colors[2]

# Top border color of the selected completion item.
c.colors.completion.item.selected.border.top = colors[2]

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = colors[2]

# Foreground color of the matched text in the selected completion item.
c.colors.completion.item.selected.match.fg = colors[11]

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = colors[11]

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = colors[5]

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = colors[0]

# Background color of disabled items in the context menu.
c.colors.contextmenu.disabled.bg = colors[1]

# Foreground color of disabled items in the context menu.
c.colors.contextmenu.disabled.fg = colors[4]

# Background color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.bg = colors[0]

# Foreground color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.fg =  colors[5]

# Background color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.bg = colors[2]

#Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.fg = colors[5]

# Background color for the download bar.
c.colors.downloads.bar.bg = colors[0]

# Color gradient start for download text.
c.colors.downloads.start.fg = colors[0]

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = colors[13]

# Color gradient end for download text.
c.colors.downloads.stop.fg = colors[0]

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = colors[12]

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = colors[8]

# Font color for hints.
c.colors.hints.fg = colors[0]

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
c.colors.hints.bg = colors[10]

# Font color for the matched part of hints.
c.colors.hints.match.fg = colors[5]

# Text color for the keyhint widget.
c.colors.keyhint.fg = colors[5]

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = colors[5]

# Background color of the keyhint widget.
c.colors.keyhint.bg = colors[0]

# Foreground color of an error message.
c.colors.messages.error.fg = colors[0]

# Background color of an error message.
c.colors.messages.error.bg = colors[8]

# Border color of an error message.
c.colors.messages.error.border = colors[8]

# Foreground color of a warning message.
c.colors.messages.warning.fg = colors[0]

# Background color of a warning message.
c.colors.messages.warning.bg = colors[14]

# Border color of a warning message.
c.colors.messages.warning.border = colors[14]

# Foreground color of an info message.
c.colors.messages.info.fg = colors[5]

# Background color of an info message.
c.colors.messages.info.bg = colors[0]

# Border color of an info message.
c.colors.messages.info.border = colors[0]

# Foreground color for prompts.
c.colors.prompts.fg = colors[5]

# Border used around UI elements in prompts.
c.colors.prompts.border = colors[0]

# Background color for prompts.
c.colors.prompts.bg = colors[0]

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = colors[2]

# Foreground color for the selected item in filename prompts.
c.colors.prompts.selected.fg = colors[5]

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = colors[11]

# Background color of the statusbar.
c.colors.statusbar.normal.bg = colors[0]

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = colors[0]

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = colors[13]

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = colors[0]

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = colors[12]

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = colors[0]

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = colors[1]

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = colors[5]

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = colors[0]

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = colors[5]

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = colors[0]

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = colors[0]

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = colors[14]

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = colors[0]

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = colors[13]

# Background color of the progress bar.
c.colors.statusbar.progress.bg = colors[13]

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = colors[5]

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = colors[8]

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = colors[5]

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = colors[12]

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = colors[11]

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = colors[14]

# Background color of the tab bar.
c.colors.tabs.bar.bg = colors[0]

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = colors[13]

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = colors[12]

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = colors[8]

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = colors[5]

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = colors[1]

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = colors[5]

# Background color of unselected even tabs.
c.colors.tabs.even.bg = colors[0]

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = colors[12]

# Foreground color of pinned unselected even tabs.
c.colors.tabs.pinned.even.fg = colors[7]

# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = colors[11]

# Foreground color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.fg = colors[7]

# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = colors[2]

# Foreground color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.fg = colors[5]

# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = colors[2]

# Foreground color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.fg = colors[5]

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = colors[5]

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = colors[2]

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = colors[5]

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = colors[2]

# Background color for webpages if unset (or empty to use the theme's
# color).
# c.colors.webpage.bg = colors[0]
