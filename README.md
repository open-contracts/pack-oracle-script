To appropriately pack the oracles in an Open Contract repo, run the following command in the root directory of the repo:
```
curl -Ls pack.opencontracts.io | sh
```
which downloads the contents of `pack.opencontracts.io` (where GitHub pages displays `index.html` which is identical to `pack_oracles.sh`), and runs them via `sh`. So this command is equivalent to manually downloading and running `sh pack_oracles.sh`.

The script will consider every subdirectory of the repo that contains an `oracle.py` file to be an oracle folder.
If such a folder contains a `requirements.txt` file, it downloads the pip packages as wheels, compresses and chunks them as `tar.gz*` files, as expected by the Open Contracts Oracle enclaves. Finally, it will create the `oracles.json` file, which contains the oracleHashes for every oracle folder. The contract developer should then manually hardcode these hashes into their Open Contract via the inherited `setOracleHash` function.

Note that the pip download step is not deterministic, so running the full script multiple times will lead to different oracleHashes each time. To verify that a given repo indeed contains the correct oracleHashes, you should therefore re-run the script in without the pip downloads only. You can do this via:
```
curl -Ls pack.opencontracts.io | DL=NO sh
```
Or equivalently, `DL=NO sh pack_oracles.sh`, if you manually downloaded the script.
