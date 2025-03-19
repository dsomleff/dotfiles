# config.nu
#
# Installed by:
# version = "0.103.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.
$env.EDITOR = 'nvim'

$env.config = {
    show_banner: false  # Disable welcome message

    # history: {
    #     max_size: 100_000
    #     sync_on_enter: true
    #     file_format: "sqlite"
    #     isolation: faslse
    # }
}
