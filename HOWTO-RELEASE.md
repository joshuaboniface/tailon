# In order to make a new release

Locally

* commit and push
* `make` or `go build`
* a new executable `./tailon` will be created
* make an archive:
    `tar jcvf tailon_1.1.0.2_linux-64.tar.bz2 tailon`

On github

* go to release and `Draft a new release`
* fill in a new tag, description and upload the archive

## In order to make a new conda package

On ESRF gitlab

* edit [https://gitlab.esrf.fr/bliss/conda-recipes/-/blob/tailon/tailon/meta.yaml](meta.yml)
    * update the version and the URL
    * commit changes
* a new pipeline will be launched
    * the generated conda package is copied to bcu-ci internal channel

On bcu-ci

* cd /var/www/html/stable/linux-64
* /opt/miniconda/bin/anaconda upload -u esrf-bcu tailon-1.1.0.2-1.tar.bz2
