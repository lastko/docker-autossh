#!/bin/sh

REMOTE_SSH_PORT=${REMOTE_SSH_PORT:-22}
REMOTE_TARGET_HOST=${REMOTE_TARGET_HOST:-localhost}
LOCAL_PORT=${LOCAL_PORT:-$REMOTE_TARGET_PORT}
LOCAL_HOST=${LOCAL_HOST:-localhost}
SSH_IDENTITY_FILE=${SSH_IDENTITY_FILE:-.ssh/id_rsa}

echo "
REMOTE_SSH_PORT=${REMOTE_SSH_PORT}
REMOTE_SSH_HOST=${REMOTE_SSH_HOST}
REMOTE_SSH_USER=${REMOTE_SSH_USER}
REMOTE_TARGET_HOST=${REMOTE_TARGET_HOST}
REMOTE_TARGET_PORT=${REMOTE_TARGET_PORT}
LOCAL_PORT=${LOCAL_PORT}
LOCAL_HOST=${LOCAL_HOST}
SSH_IDENTITY_FILE=${SSH_IDENTITY_FILE}
ARGS=${ARGS}"

#if [ -z "$ARGS" -a -z "$REMOTE_SSH_PORT" -a -z "$REMOTE_SSH_HOST" -a -z "$REMOTE_SSH_USER" -a -z "$REMOTE_TARGET_PORT" ]; then
#  echo "Is mandatory define ARGS or REMOTE_SSH_PORT, REMOTE_SSH_HOST and REMOTE_SSH_USER"
#  exit 1;
#fi

/usr/bin/autossh $ARGS -R *:${LOCAL_PORT}:${REMOTE_TARGET_HOST}:${REMOTE_TARGET_PORT} -i $SSH_IDENTITY_FILE -p $REMOTE_SSH_PORT -l $REMOTE_SSH_USER $REMOTE_SSH_HOST
