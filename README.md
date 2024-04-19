## tmux-plugin-cssh

Cluster ssh using tmux. This differs from other similar scripts in two main ways

1. Is launched within tmux, with the hosts to ssh to "the cluster" selected from a menu
2. The user defines the layout by specifying the number of columns instead of just using the tmux "tiled" layout.

Clusters are defined in a config file, by default `~/.clusterssh/clusters`.
The format is the same as used by [clusterssh](https://github.com/duncs/clusterssh/wiki) (see below).

Although the script should normally be invoked with a keybinding within tmux it can also be run directly from the commandline.
### Usage
The plugin can be invoked with a keybinding from within tmux as described in the [installation section](#installation), or by running `tcssh` from the commandline. Commandline usage is given here.
```
Usage: tcssh [options] <cluster|host1 [host2 [host3... ]]>

Cluster ssh using tmux. This differs from other similar scripts by
allowing the user to define the layout by specifying the number of
columns instead of just using the tmux "tiled" layout. The hosts
to ssh to can either be explicitly given on the commandline or by
the cluster name or index. The cluster name and/or index can be
obtained with the -l/--list option.

Options:

  -s SSHOPTS           Options to pass to ssh.

  -c N                 Number of columns of panes.
                       Defaults to 2.

  -f <file>            Location of the cluster configuration file.
                       Defaults to ~/.clusterssh/clusters.

  -l, --list           List available clusters.

  -m, --menu           Open tmux menu of clusters (run inside tmux session).

  -e, --exclude <host> Host in cluster definition to exclude. Only
                       the short hostname is comapared.

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

When launched this way within tmux you will be presented with a menu of clusters
read from the configuration file. Select the desired cluster to ssh to its hosts.

### Configuration
A number of variables can optionally be set in the tmux.conf. For example
```
set -g @tmux_cssh_columns '3'
set -g @tmux_cssh_cluster_file '~/.config/tmux/clusters'
set -g @tmux_cssh_debug '1'
set -g @tmux_cssh_ssh_options '-l nickh'
````

Clusters (lists of hosts) can be defined in a `cluster_file`. The default location is `~/.clusterssh/clusters`. A `clusters` file might look like:
```
# Gotta pay the bills
workweb web01.bigbucks.com web02.bigbucks.com web03.bigbucks.com
workdisk admin@data0.bigbucks.com admin@data1.bigbucks.com

# Home machines
homelab pihole webserver jellyfin
```
## Licensing
tmux-plugin-cssh is released under the GNU General Public License v3.0 only.
