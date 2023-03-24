Help you come back to your work when the command you are waiting for is done. With an elegant ding sound 🤌🛎 - made by [Nemo](https://twitter.com/phamhuyphat).

This helps you:
- Proactively wait on the command while attending other stuff
- Avoid being distracted for too long

If you find this useful, please consider donating to support my work. Lots of love 🙏

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/coolcorexil)




# Installation

```shell
sudo curl -sSL https://raw.githubusercontent.com/coolcorexix/ding/8196e8d8f84cbed2fb8e8279fc6c6cd604ddf20a/install-ding.sh  | sudo bash
```

# Usage

```shell
ding [the command that make you wait]
```

or 
```
# this help with multiple commands use case
[commands that make you wait] && ding
```

Bonus: if you want to have small break from your work session, run 
```
# ring a sound after 300 seconds (5 minutes)
ding sleep 3000
```

# Known issues
- This command does not work with aliases
- Only tested with MacOs and zsh so far

# Uninstall

```shell
sudo curl -sSL https://raw.githubusercontent.com/coolcorexix/ding/8196e8d8f84cbed2fb8e8279fc6c6cd604ddf20a/uninstall-ding.sh  |  sudo bash
```
