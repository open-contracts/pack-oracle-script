Inside an Open Contract repo, run the `sh pack_oracles.sh` script - or equivalently:
```
curl -Ls pack.opencontracts.io | sh
```
which downloads the contents of `pack.opencontracts.io` (where GitHub pages displays `index.html` which is identical to `pack_oracles.sh`), and runs them via `sh`.

The script will consider every subdirectory containing an `oracle.py` file to be an oracle folder.
If such a folder contains a `requirements.txt` file, it downloads the pip packages as wheels and packs them as appropriate `tar.gz` files.
Finally, it will create the `oracles.json` file, which contains the oracleHashes for every oracle folder.

Note that the pip download step is not deterministic, so running the full script multiple times will lead to dirfferent oracleHashes each time. To verify that a given repo indeed contains the correct oracleHashes, you therefore should run the script without the pip downloads. You can do this via:
```
curl -Ls pack.opencontracts.io | DL=NO sh
```
Or equivalently, `DL=NO sh pack_oracles.sh`, if you manually downloaded the script.
