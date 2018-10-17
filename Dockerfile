FROM ihnorton/slicer2binder:2959d6a954

COPY --chown=sliceruser . ${HOME}/nb
WORKDIR ${HOME}/nb

################################################################################
# launch jupyter
# HACK need this until linux build and packaging path is fixed
# HACK pending linux build fix
ENV LD_LIBRARY_PATH /home/sliceruser/.config/NA-MIC/Extensions-27480/SlicerJupyter/lib64/

ENTRYPOINT ["/home/sliceruser/nb/start"]
# NOTE: this is only the *default* command. In mybinder, ENTRYPOINT will be
#       called with a custom version of this to set port, token etc.
#       * --ip='' is to avoid bind erorrs inside container
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser"]
