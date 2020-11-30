#!/bin/bash

DOCKER_IMAGE=sypingauto/gta5view-build:1.9-shared
PROJECT_DIR_DOCKER=/gta5view

cd ${PROJECT_DIR} && \
docker pull ${DOCKER_IMAGE} && \
docker run --rm \
	-v "${PROJECT_DIR}:${PROJECT_DIR_DOCKER}" \
	${DOCKER_IMAGE} \
	/bin/bash -c "export PROJECT_DIR=${PROJECT_DIR_DOCKER} && export QT_SELECT=${QT_SELECT} && export APPLICATION_VERSION=${APPLICATION_VERSION} && export APPLICATION_COMMIT=${APPLICATION_COMMIT} && export BUILD_TYPE=${BUILD_TYPE} && export QMAKE_FLAGS_QT4=${QMAKE_FLAGS_QT4} && export QMAKE_FLAGS_QT5=${QMAKE_FLAGS_QT5} && export CMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} && export QMAKE_BUILD_TYPE=${QMAKE_BUILD_TYPE} && export PACKAGE_VERSION=${PACKAGE_VERSION} && export PACKAGE_BUILD=${PACKAGE_BUILD} && export PACKAGE_CODE=${PACKAGE_CODE} && export EXECUTABLE_VERSION=${EXECUTABLE_VERSION} && export EXECUTABLE_ARCH=${EXECUTABLE_ARCH} && cd ${PROJECT_DIR_DOCKER} && .ci/wininstall_build.sh"
