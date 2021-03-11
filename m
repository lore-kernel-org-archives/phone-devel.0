Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE640C433E0
	for <phone-devel@archiver.kernel.org>; Thu, 11 Mar 2021 12:04:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8770864FEF
	for <phone-devel@archiver.kernel.org>; Thu, 11 Mar 2021 12:04:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbhCKMEZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 11 Mar 2021 07:04:25 -0500
Received: from comms.puri.sm ([159.203.221.185]:39060 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232949AbhCKMD6 (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Thu, 11 Mar 2021 07:03:58 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 1FD0AE0D56;
        Thu, 11 Mar 2021 04:03:28 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3KB6N06HF6Wz; Thu, 11 Mar 2021 04:03:27 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     robh@kernel.org, shawnguo@kernel.org, kernel@pengutronix.de,
        festevam@gmail.com, krzk@kernel.org
Cc:     kernel@puri.sm, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH 3/3] arm64: defconfig: Enable the Hantro decoder
Date:   Thu, 11 Mar 2021 13:02:59 +0100
Message-Id: <20210311120259.3310499-4-martin.kepplinger@puri.sm>
In-Reply-To: <20210311120259.3310499-1-martin.kepplinger@puri.sm>
References: <20210311120259.3310499-1-martin.kepplinger@puri.sm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>

Enable the Hantro decoder driver so it can be enabled by
default on i.MX8M and Rockchip platforms.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Guido Günther <agx@sigxcpu.org>
Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f673b00c5f5..1a5669a73c01 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -919,6 +919,9 @@ CONFIG_VIRTIO_MMIO=y
 CONFIG_XEN_GNTDEV=y
 CONFIG_XEN_GRANT_DEV_ALLOC=y
 CONFIG_MFD_CROS_EC_DEV=y
+CONFIG_STAGING=y
+CONFIG_STAGING_MEDIA=y
+CONFIG_VIDEO_HANTRO=m
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC=y
 CONFIG_CROS_EC_I2C=y
-- 
2.30.1

