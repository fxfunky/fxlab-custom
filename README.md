## Just one command to set linux environment to my needs 👌

### Features
* runs apt update command
* install midnight commander file manager
* install nano text editor
* install rsync copying tool
* install htop process viewer
* use custom .bashrc file with couple of tweaks
* 'c' alias for clear screen command
* added 'run' to repeatedely run scripts, programs, commands (run 10 echo "Hello" - prints out Hello ten times)
* enable linenumbers in nano text editor
* change tab size to 4 instead of 8 in nano text editor
* custom midnight commander skin

### Single command usage:
```
git clone https://github.com/fxfunky/fxlab-custom.git && cd fxlab-custom && sudo chmod +x install-customization.sh && ./install-customization.sh && cd ..
```
for root user:
```
git clone https://github.com/fxfunky/fxlab-custom.git && cd fxlab-custom && chmod +x install-customization.sh && ./install-customization.sh && cd ..
```

### Step-by-step usage:

```
git clone https://github.com/fxfunky/fxlab-custom.git
```

``` 
cd fxlab-custom
```


```
sudo chmod +x install-customization.sh
```

```
./install-customization.sh
```

*Note: git must be installed first*

### Tested systems:
* Ubuntu 20.04.3 LTS
* Fedora Linux 38 (Server Edition)
* Debian GNU/Linux 9 (stretch)
* Raspbian GNU/Linux 12 (bookworm)
* Raspbian GNU/Linux 11 (bullseye)
