for file in .github/workflows/dir-looping.yaml workloads/hello/hello.yaml workloads/hello/kustomization.yaml; do
  echo "$file was changed"
done
