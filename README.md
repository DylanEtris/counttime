# Counttime plugin

This plugin automatically logs time to Atlassian's [JIRA](https://www.atlassian.com/software/jira) bug tracking software when on a git branch with a JIRA issue ID in the branch name.

## Installation

1. Clone this repository into `$ZSH_CUSTOM/plugins` (by default `~/.oh-my-zsh/custom/plugins`)

    ```sh
    git clone https://github.com/DylanEtris/counttime.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/counttime
    ```

2. Add the plugin to the list of plugins for Oh My Zsh to load (inside `~/.zshrc`):

    ```sh
    plugins=(
        # other plugins...
        counttime
    )
    ```

3. Start a new terminal session.

## Usage

Every time the command prompt is generated the time spent on the branch is logged in the background. By default, the time is logged with minute precision. No time is logged if no command is run for 30 minutes.

## Setup

The URL for your JIRA instance is located in the following places, in order of precedence:

1. `$JIRA_URL` environment variable
2. `./.jira-url` file in the current directory
3. `~/.jira-url` file in your home directory

The PAT for your JIRA instance is located in the following places, in order of precedence:

1. `./.jira-pat` file in the current directory
2. `~/.jira-pat` file in your home directory

### Variables

* `$JIRA_URL` - Your JIRA instance's URL
* `$COUNTTIME_AFK_THRESHOLD` - The number of minutes of AFK time before no time is logged. Defaults to 30
* `$COUNTTIME_COMMENT` - The comment to add to the work log. Defaults to an empty string
* `$COUNTTIME_CA_PATH` - The path to the CA certificate store. Defaults to Ruby's `OpenSSL::X509::DEFAULT_CERT_DIR`
* `$COUNTTIME_PRECISION` - The precision of the number of minutes logged. Must be greater than zero. Defaults to 1. For example, `COUNTTIME_PRECISION=15` will log 15 minutes when the command prompt is generated after 15 minutes have passed.