Help you come back to your work when the command you are waiting for is done. With an elegant ding sound 🤌🛎 - made by [Nemo](https://twitter.com/phamhuyphat).

Play a buzz sound if the command exit with non-zero code.

Works for both MacOs and Ubuntu.

This helps you:
- Proactively wait on the command while attending other stuff (watch a cat video while waiting)
- Avoid being distracted for too long (watch too much cat videos while waiting)

If you find this useful, please consider donating to support my work. Lots of love 🙏

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/coolcorexil)

UPDATE:
- More pleasant sound when the command is done with error
- Soundplay will not block the terminal anymore 

# Installation

```shell
sudo curl -sSL https://raw.githubusercontent.com/coolcorexix/ding/4ad2962f98fb206885a6b65417ac844b72be273a/install-ding.sh  | sudo bash
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

# Claude Code Integration

Ding supports [Claude Code hooks](https://docs.anthropic.com/en/docs/claude-code/hooks) to play notification sounds when Claude finishes tasks.

## Setup

After installing ding, add this to your `~/.claude/settings.json`:

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "ding-hook"
          }
        ]
      }
    ],
    "Notification": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "ding-hook"
          }
        ]
      }
    ]
  }
}
```

## Supported Events

| Event | Sound | When it triggers |
|-------|-------|------------------|
| `Stop` | bells-mindful.wav | Claude finishes responding |
| `Notification` | wood_sound.wav | Claude sends a notification (permission prompts, idle, etc.) |

# Known issues
- This command does not work with aliases

# Uninstall

```shell
sudo curl -sSL https://raw.githubusercontent.com/coolcorexix/ding/4ad2962f98fb206885a6b65417ac844b72be273a/uninstall-ding.sh  |  sudo bash
```
