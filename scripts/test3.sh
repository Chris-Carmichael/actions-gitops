KUST_DIRS=$(for file in workloads/hello/hello.yaml workloads/sre-semver/kustomization.yaml; do
            DIR=$(dirname $file)
            if test -f $DIR/kustomization.yaml; then
              echo $DIR
            fi
          done | sort -u)
echo $KUST_DIRS
