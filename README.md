## tmux-plugin-cssh

Cluster ssh using tmux. This differs from other similar scripts by
allowing the user to define the layout by specifying the number of
columns instead of just using the tmux "tiled" layout.

Clusters are defined in the users ~/.clusterssh/clusters file as is the case for
[clusterssh](https://github.com/duncs/clusterssh/wiki). The format
is one cluster per line in the format:
```
clustername host1 host2 host3 ...
```
Usernames can optionally be prepended to the host name. Eg:
```
clustername user@host1 otheruser@host2 host3 ...
```
### Usage
```
Usage: tcssh [options] [host1 [host2 [host3... ]]]

Cluster ssh using tmux. This differs from other similar scripts by
allowing the user to define the layout by specifying the number of
columns instead of just using the tmux "tiled" layout. The hosts 
to ssh to can either be explicitly given on the commandline or by
the cluster index with the -i/--cluster-index option. The cluster
index can be optained with the -l/--list option.

Options:

  -s SSHOPTS           Options to pass to ssh.

  -c N                 Number of columns of panes.
                       Defaults to 2.

  -f <file>            Location of the cluster configuration file.
                       Defaults to /home/hastings/.clusterssh/clusters.

  -l, --list           List available clusters.

  -i, --cluster-index  Index of the  desired cluster

  -m, --menu           Open tmux menu of clusters (run inside tmux session).

  -e, --exclude <host> Host in cluster definition to exclude. Only
                       the short hostname is comapared.

  -h, --help           Print this screen.
````

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

The number of columns can optinally be set in the tmux.conf. For example
```
set -g @tmux_cssh_columns 3
```
## Licensing
tmux-plugin-cssh is released under the GNU General Public License v3.0 only.
