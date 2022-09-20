FROM lassoan/slicer-notebook:5.0.3

# We do not use NB_USER and NB_UID arguments
# because they are hardcoded to sliceruser and 100 in the Slicer docker image

COPY --chown=sliceruser . ${HOME}/nb
RUN chmod +x ${HOME}/nb/start
WORKDIR ${HOME}/nb

################################################################################
# launch jupyter

ENTRYPOINT ["/home/sliceruser/nb/start"]

# NOTE: this is only the *default* command. In mybinder, ENTRYPOINT will be
#       called with a custom version of this to set port, token etc.
#       (actually, it uses a very complex command)
#       * --ip='0.0.0.0' is to avoid bind erorrs inside container
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser"]
