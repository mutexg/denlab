/*
 * Copyright (c) 2018-2020, Andreas Kling <kling@denlabos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#pragma once

#include <sys/device.h>

#define makedev(major, minor) denlab_dev_makedev((major), (minor))
#define major(dev) denlab_dev_major(dev)
#define minor(dev) denlab_dev_minor(dev)
