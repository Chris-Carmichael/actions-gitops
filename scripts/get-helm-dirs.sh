#for file in workloads/autoscaler/values.yaml workloads/autoscaler/templates/serviceaccount.yaml; do
for file in workloads/autoscaler/templates/serviceaccount.yaml; do
  DIR=$(dirname $file)

  # check for a Chart.yaml
  if test -f $DIR/Chart.yaml; then
    echo $DIR
  fi
  
  # check to see if basename folder is templates
  if [ "$(basename $DIR)" == "templates" ]; then
    #echo 'found templates directory'
    workload_dir=$(echo "$DIR" | sed -e "s/\/[^\/]*$//")
    #echo "$workload_dir"
    if test -f $workload_dir/Chart.yaml; then
      echo $workload_dir
    fi
  fi

done
