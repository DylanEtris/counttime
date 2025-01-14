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

Every time the command prompt is generated, the time spent on a JIRA branch is accumulated. Once the accumulated time exceeds a threshold, the time is logged in the background. By default, the time is logged every minute.

To prevent AFK time from being counted, no time is logged if there is no activity on a JIRA branch for a certain amount of time. By default the AFK threshold is 30m.

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
* `$COUNTTIME_PRECISION` - The size of the chunks of time that are logged. Must be greater than zero. Defaults to 1. For example, `COUNTTIME_PRECISION=15` will log 15 minutes after being active for 15 minutes a JIRA branch.