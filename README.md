Help you come back to your work when the command you are waiting for is done. With an elegant ding sound 🤌🛎 - made by [Nemo](https://twitter.com/phamhuyphat).

Works for both MacOs and Ubuntu.

This helps you:
- Proactively wait on the command while attending other stuff (watch a cat video while waiting)
- Avoid being distracted for too long (watch too much cat videos while waiting)

If you find this useful, please consider donating to support my work. Lots of love 🙏

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/coolcorexil)




# Installation

```shell
sudo curl -sSL https://raw.githubusercontent.com/coolcorexix/ding/f653103fc587621141f9101a144ddef499f437f0/install-ding.sh  | sudo bash
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

# Uninstall

```shell
sudo curl -sSL https://raw.githubusercontent.com/coolcorexix/ding/f653103fc587621141f9101a144ddef499f437f0/uninstall-ding.sh  |  sudo bash
```
