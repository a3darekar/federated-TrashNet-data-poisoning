# federated-TrashNet-data-poisoning
Observing effect of data poisoning on Trashnet Data in Federated Learning Environment

## Table of Contents
- [TrashNet Example](#trashnet-example-keras-version)
  - [Table of Contents](#table-of-contents)
  - [Prerequisites](#prerequisites)
  - [Running the example](#running-the-example)
  - [Clean up](#clean-up)

## Prerequisites
- [Docker](https://docs.docker.com/get-docker)
- [Docker Compose](https://docs.docker.com/compose/install)
- [Python 3.8](https://www.python.org/downloads)

## Running the example
Clone FEDn and locate into this directory.
```sh
git clone https://github.com/scaleoutsystems/fedn.git
cd fedn/examples/trashnet-keras
```

Start by initializing a virtual enviroment with all of the required dependencies.
```sh
bin/init_venv.sh
```

Then, to get the data you can run the following script.
```sh
bin/get_data
```

The next command splits the data in 2 parts for the clients.
```sh
bin/split_data
```
> **Note**: run with `--n_splits=N` to split in *N* parts.

The next command generates poisoned dataset of the partitioned data for 2 clients. poison_data implements data corruption throughsteganography.  
Alternatively, you can perform label flipping with `flip_labels` and image occlusion with `occlude_data`.  
To learn more about these methods, check example notebooks [here](https://github.com/a3darekar/federated-TrashNet-data-poisoning/tree/v0.3.2/notebooks)
```sh
bin/poison_data
```
> **Note**: run with `--n_splits=N` to poison the *N* client datasets as per done in earlier command.  
> This creates a copy of dataset with `-clean` suffix, creates and saves the poisoned data in dataset files with `poisoned-<percentage>` suffix and `.npz` extension. By default poisoning is done on 5%, 10%, 15%, 20%, 25% and 30% of data for N clients (according to `--n_splits=N` argument)

Finally the `build_config` command assists in configuring experiment by copying either clean or specified poisoned dataset to 'trashnet.npz' for each client.
```sh
bin/build_config --n_splits=N --poisoned_node_count=P --poison_rate=R
```
arguments:
  - `--n_splits=N` similar to previous commands, picks N clients.
  - `--poisoned_node_count=P` Where P represents number of nodes to be poisoned (between 0 and N)
  - `--poiso_rate=R` Where R represents Percentage of data to be poisoned. Should be between (5, 10, 15, 20, 25, 30). 0 or any other value will use clean dataset.
e.g. Following script will set config to use first two clients with 30% poisoning and clients 3 and 4 will use clean dataset.
```sh
bin/build_config --n_splits=4 --poisoned_node_count=2 --poison_rate=30
```

Now we are ready to start the pseudo-distributed deployment with `docker-compose`.
```sh
docker-compose -f ../../docker-compose.yaml -f docker-compose.override.yaml up -d
```
> **Note**: run with `--scale client=N` to start *N* clients.

Now navigate to https://localhost:8090 to see the reducer UI. You will be asked to upload a compute package and a seed model that you can generate by running the following script.
```sh
bin/build.sh
```
> The files location will be `package/package.tgz` and `seed.npz`.

Finally, you can start the experiment from the "control" tab.

## Clean up
You can clean up by running `docker-compose down`.

## License
Apache-2.0 (see LICENSE file for full information).
