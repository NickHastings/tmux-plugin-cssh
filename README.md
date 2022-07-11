## tmux-plugin-cssh

Cluster ssh using tmux. This differs from other similar scripts by
allowing the user to define the layout by specifying the number of
columns instead of just using the tmux "tiled" layout. Clusters are
defined in the users ~/.clusterssh/clusters file.

### Usage

```
Usage: tcssh [options] <cluster>

Cluster ssh using tmux. This differs from other similar scripts by
allowing the user to define the layout by specifying the number of
columns instead of just using the tmux "tiled" layout. The argument
<cluster> is either a named cluster or the index corresponding to one
as provided by the -l/--list option.

The tcssh script can be run directly from the command line. If already
in a tmux session a new tmux window will be spawned for the ssh
sessions. If not already in a tmux session a new tmux session will be
created. Alternatively, if installed as a tmux-plugin it can be
launched within tmux with the use of a keybinding.

The synchronize-panes tmux option will be turned on. Users may find it
useful to define a keybinding to toggle this option on and off.

Options:

  -s SSHOPTS           Options to pass to ssh.

  -c N                 Number of columns of panes.
                       Defaults to 2.

  -f <file>            Location of the cluster configuration file.
                       Defaults to ~/.clusterssh/clusters.

  -l, --list           List available clusters.

  -m, --menu           Open tmux menu of clusters (run inside tmux session).

  -e, --exclude <host> Host in cluster definition to exclude. Only 
                       the short hostname is compared.

  -h, --help           Print this screen.
```

### Installation

It is recommended to use the [Tmux Plugin
Manager](https://github.com/tmux-plugins/tpm) to install
tmux-plugin-cssh. Once Tmux Plugin Manager is configured just add the following to your tmux.config
```
set -g @plugin 'NickHastings/tmux-plugin-cssh'
```
Then instruct the plugin manager to install it `prefix` + <kbd>I</kbd> (uppercase I)

From tmux the tmux-plugin-cssh can be launched with  `prefix` + <kbd>C</kbd> (uppercase C).
The key binding can be changed with the `tmux_cssh_launch` variable. For example
```
set -g @tmux_cssh_launch 'z'
```

When launched you will be presented with a menu of clusters read from
the configuration file. Select the desired cluster to ssh to its
hosts.
