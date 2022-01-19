for file in .github/workflows/dir-looping.yaml workloads/hello/hello.yaml workloads/hello/kustomization.yaml; do
  DIR=$(dirname $file)
  #echo "$DIR"
  if test -f $DIR/kustomization.yaml; then
    echo $DIR
  fi
done | sort -u
