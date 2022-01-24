FROM python:3.8-alpine

RUN apk update \
      && apk add --no-cache \
      curl \
      bash \
      git \
      jq \
      yq

ARG APP_DIR=/apps/convert
ENV APP_DIR=${APP_DIR}
WORKDIR ${APP_DIR}/
RUN curl -s -L "https://raw.githubusercontent.com/yannh/kubeconform/master/scripts/openapi2jsonschema.py" \
      -o "${APP_DIR}/openapi2jsonschema.py" \
      && pip install pyyaml

ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "cd \"${MOUNT_PATH}\" && while read -r line; do python \"${APP_DIR}/openapi2jsonschema.py\" \"${line}\"; done < <( echo \"$CONVERT_PATH\" | grep -v -e '^[[:space:]]*$')" ]
