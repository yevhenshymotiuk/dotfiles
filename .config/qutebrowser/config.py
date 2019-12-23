import dracula.draw


config.load_autoconfig()

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 2,
        'horizontal': 8
    },
    'font': {
        'family': 'Monaco, Monospace',
        'size': 12
    }
})

config.bind(',pp', 'spawn --userscript qute-pass')
config.bind(',pL', 'spawn --userscript qute-pass --username-only')
config.bind(',pP', 'spawn --userscript qute-pass --password-only')

# with config.pattern('*://github.com/') as github:
#     github.content.user_stylesheets = [
#         'github-dark.css',
#     ]
