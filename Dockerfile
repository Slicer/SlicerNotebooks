FROM lassoan/slicer-notebook:2020-05-15-89b6bb5
COPY --chown=sliceruser . ${HOME}/nb
WORKDIR ${HOME}/nb

################################################################################
# launch jupyter

ENTRYPOINT ["sh", "/home/sliceruser/nb/start"]
# NOTE: this is only the *default* command. In mybinder, ENTRYPOINT will be
#       called with a custom version of this to set port, token etc.
#       * --ip='' is to avoid bind erorrs inside container
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser"]
