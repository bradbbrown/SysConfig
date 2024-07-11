# Manage system configuration across multiple machines

A simple configuration management mechanism for sharing configurations
across multiple (more or less identical) machines.

There are two configuration mechanisms, manual and automatic

- Manual configurations have configuration information stored in a 
  folder but it is up to a human to copy configurations to the 
  correct place

- Automated configurations have scripts to collect a configuration
  from an application into configuration management, and another
  script to apply a configuration from configuration management
  to an application


## Usage

To capture configuration, run

    ./collect.sh

To apply configuration, run

    sudo ./apply.sh

(Sudo may be needed to allow writing to files not owned by the current user)


## Setup

To set up on a new machine, go to a folder to hold SysConfig
(I've been using ~/Dropbox/Dev, but that's just what works for me)

```
git clone https://github.com/bradbbrown/SysConfig.git SysConfig
cd SysConfig
./apply.sh
```


## Use case

This is intended to be used with a git repo across computers.  If we change
the configuration of something, we run collect, then on other machines we run
apply.  

This does not magically sync configurations - if there are conflicting changes
it will be last-writer-wins, but if we are dilligent about running the scripts it 
should not be a problem.

Note that updating the repo is not part of the scripts.


## Folder structure

```
.../
    collect.sh   # Script to iterate over folders in automated
    apply.sh     # Script to iterate over folders in automated
    manual/
        AppM1/
            (AppM1 files; no particular structure)
    automated/
        AppA1/
            _collect.sh    # Script to collect config from app
            _apply.sh      # Script to apply config to app
            (AppA1 files; whatever structure is needed for _collect and _apply)
```


## Suggested improvements

### Automatically update repo

For Collect, do a git diff, and if there are any changes do an add and commit
(get a commit message from the user, or just supply an automatic "config updated
by collect" message) and push the changes.

For apply, we've already got a git pull origin as part of the script.
