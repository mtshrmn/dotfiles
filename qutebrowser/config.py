c = c # pyright: ignore[reportUndefinedVariable]
config = config  # pyright: ignore[reportUndefinedVariable]

config.load_autoconfig(False)
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version} Edg/{upstream_browser_version}', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
config.set('content.media.audio_video_capture', True, 'https://www.omegle.com')
config.set('content.notifications.enabled', True, 'https://www.facebook.com')
config.set('content.notifications.enabled', True, 'https://www.reddit.com')
config.set('content.notifications.enabled', True, 'https://www.youtube.com')
config.set('content.notifications.enabled', True, 'https://www.zap.co.il')
config.set('content.register_protocol_handler', True, 'https://mail.google.com?extsrc=mailto&url=%25s')
c.url.default_page = 'file:///home/suerflowz/.config/qutebrowser/index.html'
c.url.searchengines = {'DEFAULT': 'https://google.com/search?q={}'}
c.url.start_pages = 'file:///home/suerflowz/.config/qutebrowser/index.html'
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind(',p', 'spawn --userscript qute-pass')
config.bind(',P', 'spawn --userscript qute-pass --password-only')
c.bindings.commands['command'] = {
        '<ctrl-j>': 'completion-item-focus next',
        '<ctrl-k>': 'completion-item-focus prev'
        }
config.set('editor.command', ['alacritty', '--title', 'nvim_float', '-e', 'nvim', '{}'])
config.source("theme/two_firewatch.py")
c.completion.height = "20%"
c.content.user_stylesheets = "user.css"
c.downloads.location.directory = "/home/suerflowz/downloads"
c.input.insert_mode.auto_load = True
c.tabs.background = True

