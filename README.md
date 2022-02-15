Inside an Open Contract repo, run the `pack_oracles.sh` script - or equivalently:
```
curl -Ls pack.opencontracts.io | sh
```
which downloads the contents of `pack.opencontracts.io` (where GitHub pages displays `index.html` which is identical to `pack_oracles.sh`), and runs them via `sh`.

The script will consider every folder containing an `oracle.py` file to be an oracle folder.
If such a folder contains a `requirements.txt` file, it downloads the pip packages as wheels and packs them as appropriate `tar.gz` files.
Finally, it will create the `oracles.json` file, which contains the oracleID for every oracle folder.
