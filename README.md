
# 🧹 Kaneki

**A powerful terminal utility for 42 Network schools to manage disk space and system maintenance.**


## 👨‍💻 Authors ✍🏼

<table>
  <tr>
    <td align="center"><a href="https://github.com/KanekiEzz/"><img src="https://avatars.githubusercontent.com/u/110631781?s=400&u=0cd1de60c073f367d291df9c6ccef5c18ac64e41&v=4" width="100px;" alt="Kaneki"/>
      <br />
    </a>
      <br />
      <a href="https://profile.intra.42.fr/users/iezzam" title="Intra 42">
        iezzam42  🇲🇦
      </a>
    </td>
    <td align="center"><a href="https://github.com/iaceene/"><img src="https://avatars.githubusercontent.com/u/106110604?v=4" width="100px;" alt="Iaceene"/>
      <br />
    </a>
      <br />
      <a href="https://profile.intra.42.fr/users/yaajagro" title="Intra 42">
        yaajagro42  🇲🇦
      </a>
    </td>
  </tr>
</table>

---

## ✨ Features

- **Automatic startup**: Runs automatically when you open the terminal
- **Space management**: Clean up unnecessary files and free disk space
- **Docker support**: Easy Docker container management
- **Dark mode**: Toggle between light and dark terminal themes
- **Code command integration**: Activate/deactivate VS Code command shortcuts
- **Storage monitoring**: Check available disk space
- **Safe uninstall**: Easy removal when no longer needed

## 🚀 Quick Start

### Installation

1. Clone or download the repository
2. Run the installation script:

```bash
bash install.bash
```
<img width="779" height="993" alt="image" src="https://github.com/user-attachments/assets/5f47f539-4494-445f-ac30-ab73bbbb090a" />

3. **Important**: Restart your terminal for changes to take effect

### First Run

After restarting your terminal, simply type:

```bash
kaneki
```
<img width="960" height="881" alt="image" src="https://github.com/user-attachments/assets/b742c0d0-3e6e-4a4c-91ad-59c929679476" />

This will show you all available commands and options.

## 📋 Available Commands

| Command | Function | Usage |
|---------|----------|--------|
| 🧹 | Clean computer | `kclean` |
| 🐳 | Run Docker | `kdocker` |
| ⚠️ | Full clean (dangerous) | `kclearfull` |
| 💾 | Show free space | `storage` |
| ❌ | Uninstall kaneki | `unkaneki` |
| 🌙 | Activate dark-mode | `kaneki active dark-mode` |
| ☀️ | Deactivate dark-mode | `kaneki deactivate dark-mode` |
| 💻 | Activate 'code' command | `kaneki active code` |
| 🚫 | Deactivate 'code' command | `kaneki deactivate code` |
| ❓ | Show help | `kaneki` |

## 🛠️ Usage Examples

### Basic Cleaning
```bash
# Standard cleanup
kclean

# Check available space
storage

# Full system clean (use with caution)
kclearfull
```

### Docker Management
```bash
# Quick Docker access
kdocker
```

### Theme & Environment
```bash
# Enable dark mode
kaneki active dark-mode

# Enable VS Code command
kaneki active code

# Disable features
kaneki deactivate dark-mode
kaneki deactivate code
```

## ⚠️ Important Notes

- **For 42 Network schools only**: This tool is specifically designed for the 42 school environment
- **Restart required**: Always restart your terminal after installation
- **Dangerous commands**: The `kclearfull` command performs aggressive cleaning - use with caution
- **Automatic startup**: Kaneki runs automatically when you open a new terminal session

## 🗑️ Uninstallation

To remove kaneki from your system:

```bash
unkaneki
```

## 🔧 Troubleshooting

### Kaneki not working after installation?
1. Make sure you restarted your terminal
2. Check if the installation completed successfully
3. Try running `bash install.bash` again

### Commands not found?
- Restart your terminal
- Check if kaneki is properly installed with `kaneki`

## 🤝 Contributing

This tool is specifically designed for 42 Network schools. If you're a 42 student and have suggestions or improvements, feel free to contribute!
## 👨‍💻 Authors ✍🏼

<table>
  <tr>
      <td align="center"><a href="https://github.com/KanekiEzz/"><img src="https://avatars.githubusercontent.com/u/110631781?s=400&u=0cd1de60c073f367d291df9c6ccef5c18ac64e41&v=4" width="100px;" alt="Kaneki"/>
      <br />
    </a>
      <br />
      <a href="https://profile.intra.42.fr/users/iezzam" title="Intra 42">
        iezzam42  🇲🇦
      </a>
    </td>
    <td align="center"><a href="https://github.com/iaceene/"><img src="https://avatars.githubusercontent.com/u/106110604?v=4" width="100px;" alt="Iaceene"/>
      <br />
    </a>
      <br />
      <a href="https://profile.intra.42.fr/users/yaajagro" title="Intra 42">
        yaajagro42  🇲🇦
      </a>
    </td>
  </tr>
</table>

## 📝 License

This project is designed for educational use within the 42 Network schools.

---

**Created with ❤️ by Ilyass Ezzam && Yassine Ajagrou for the 42 community**
