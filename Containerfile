ARG IMAGE
FROM $IMAGE

ARG YARN_PKG

# Base image (ubi9/nodejs-*-minimal) does not include gzip.
# Needed for yarn/npm packaging workflows that extract .tgz via tar.
# Cachi2 prefetches the RPM; source cachi2.env so microdnf uses the offline repos.
USER 0
RUN . /cachi2/cachi2.env && \
    microdnf -y --nodocs --setopt=install_weak_deps=0 install gzip && \
    microdnf clean all

# Match nodejs-*-minimal default non-root user
USER 1001

RUN npm install -g /cachi2/output/deps/npm/"$YARN_PKG"

LABEL \
  description="Konflux image containing rebuilds for tooling to assist in building with yarn." \
  io.k8s.description="Konflux image containing rebuilds for tooling to assist in building with yarn." \
  summary="Konflux yarn builder" \
  io.k8s.display-name="Konflux yarn builder" \
  io.openshift.tags="konflux build yarn tekton pipeline security" \
  name="Konflux yarn builder" \
  com.redhat.component="yarn-builder"
