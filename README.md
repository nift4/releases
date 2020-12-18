# Build scripts

**DISCLAIMER**: This is only for Debian-based distributions. WSL is **NOT** supported.

## Prerequisites

1. (Optional) Make a Telegram Bot (@BotFather)

2. Fork this repository.

3. Make a GitHub token with proper permissions for uploading releases to your repositories.

## How to use this repo (non-Jenkins)

1. Clone your fork of this repository.

2. Make your changes in the config.sh script (more information about the flags below). Make sure you commit and push your changes to your fork.

3. Export GITHUB_TOKEN to your GitHub token (make sure it has permissions to upload releases to your repos)

4. Optionally export TELEGRAM_CHAT and TELEGRAM_TOKEN to your respective values:

* `TELEGRAM_CHAT` - the ID of the channel/group chat you want the Bot to post your messages to.

* `TELEGRAM_TOKEN` - the token of your Telegram Bot.

5. If you haven't ever built Android on your PC, open a terminal in the directory you cloned this repository and run `init.sh`

OR

5. If you've already built Android on your PC, run `clean.sh`


## How to use this repo (Jenkins)

1. Switch to the "jenkins" user (usually by `su jenkins`)

2. Clone your fork of this repo in your Jenkins home directory (`/var/lib/jenkins`) or any place where your Jenkins user can read/write to.

3. Make your changes in the config.sh script (more information about the flags below). Make sure you commit and push your changes to your fork.

4. Switch to the Jenkins web console.

5. Make a new job with the "Freeflow" type. Do **NOT** put spaces in the name of the job.

6. Set the custom working directory to the directory you cloned this repository.

7. Add a build step for bash.

8. Copy the contents of jenkins.sh to it.

9. Change the values of GITHUB_TOKEN and optionally TELEGRAM_CHAT, TELEGRAM_TOKEN to your respective values:

* `GITHUB_TOKEN` - your GitHub token (make sure it has permissions to upload releases to your repos)

* `TELEGRAM_CHAT` - the ID of the channel/group chat you want the Bot to post your messages to.

* `TELEGRAM_TOKEN` - the token of your Telegram Bot.

10. Switch to the root user and install the binaries in the `bin` folder to `/usr/bin`.

## Configuration flags

`GITHUB_USER` - your GitHub username

`GITHUB_EMAIL` - your GitHub email

`device` - your device codename (e.g. `blueline` for Pixel 3)

`ROM` - name of your ROM (e.g. `AOSP`)

`ROM_DIR` - directory where your ROM source will reside (e.g. `/var/lib/jenkins/AOSP`)

`ROM_VERSION` - version of your ROM (e.g. `9.0 Pie`)

`official` - `true` if you're building an official build, `false` if you're building an unofficial build

`local_manifest_url` - your local manifest URL (e.g. `https://example.link/local_manifest.xml`)

`manifest_url` - your ROM's manifest repo URL (e.g. `https://android.googlesource.com/platform/manifest`)

`rom_vendor_name` - your ROM's custom vendor name (e.g. `lineage`)

`branch` - branch of the manifest to sync (e.g. `lineage-16.0`)

`bacon` - the package to build (default: `bacon`)

`buildtype` - the build type to build (e.g. `userdebug`). If you don't specify a build type, it defaults to userdebug.

`clean` - `installclean` if you want to clear system/ and vendor/ directories, `clean` if you want a clean build, `false` if you want a dirty build

`upload_recovery` - `true` if you want the script to upload the built recovery image, `false` if you don't want the script to upload the recovery image

`ccache` - `true` if you want to build with ccache, `false` if you don't

`ccache_size` - how many gigabytes of space to dedicate to ccache (e.g. `50`).

`jenkins` - `true` - you use Jenkins; `false` - you don't use Jenkins

`release_repo` - your GitHub username + name of the repo to upload the releases (e.g. `JarlPenguin/releases`)

`sf_target` - full ssh destination for SourceForge (e.g. `user@frs.sourceforge.net:/home/frs/project/best-os-project/for-bla/beta/`)

`sf_http_target` - project name + `/files/`+ directories (e.g. `best-os-project/files/for-bla/beta`)

`timezone` - your timezone (default: `UTC`)
