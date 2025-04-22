ARG IMAGE
FROM $IMAGE

ARG YARN_PKG

RUN npm install -g /cachi2/output/deps/npm/"$YARN_PKG"

LABEL \
  description="Konflux image containing rebuilds for tooling to assist in building with yarn." \
  io.k8s.description="Konflux image containing rebuilds for tooling to assist in building with yarn." \
  summary="Konflux yarn builder" \
  io.k8s.display-name="Konflux yarn builder" \
  io.openshift.tags="konflux build yarn tekton pipeline security" \
  name="Konflux yarn builder" \
  com.redhat.component="yarn-builder"
