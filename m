Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D558C4361B
	for <phone-devel@archiver.kernel.org>; Thu, 17 Dec 2020 15:14:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E006623975
	for <phone-devel@archiver.kernel.org>; Thu, 17 Dec 2020 15:14:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727385AbgLQPOC (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 17 Dec 2020 10:14:02 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:42074 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726291AbgLQPOC (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Thu, 17 Dec 2020 10:14:02 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 9A3F8FB07;
        Thu, 17 Dec 2020 16:13:18 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zYMDCfs1-yea; Thu, 17 Dec 2020 16:13:16 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id DDFB243FDC; Thu, 17 Dec 2020 16:13:15 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Martin Kepplinger <martink@posteo.de>,
        Angus Ainslie <angus@akkea.ca>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Li Yang <leoyang.li@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vinod Koul <vkoul@kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: [PATCH v2 0/4] Config and device tree updates for the Librem 5 devkit
Date:   Thu, 17 Dec 2020 16:13:11 +0100
Message-Id: <cover.1608216796.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This enables more components to get a working display, panel, audio and
sensors. It also updates some device tree bits to make mainline boot.

I've skipped wifi (which needs some more driver work) and devfreq (since Martin
is working on that).

The config changes don't depend on the DT parts so could be applied
independently. The series was tested against next-20201214 and i made sure the
defconfig changes also apply on top of shawnguo/imx/defconfig.

changes from v1:
- as per review comments by Krzysztof Kozlowski <krzk@kernel.org>
  https://lore.kernel.org/linux-arm-kernel/20201215091729.GC29321@kozik-lap/
  - describe hardware parts not config options
  - rework commit messages to give more details
- don't keep buck3 always on but rather make sure the board
  doesn't hang when resuming the gpu power domain.
  There's a generic fix pending for that helps all boards
  https://lore.kernel.org/lkml/beba25e85db20649aa040fc0ae549895c9265f6f.camel@fi.rohmeurope.com/

To: Rob Herring <robh+dt@kernel.org>,Shawn Guo <shawnguo@kernel.org>,Sascha Hauer <s.hauer@pengutronix.de>,Pengutronix Kernel Team <kernel@pengutronix.de>,Fabio Estevam <festevam@gmail.com>,NXP Linux Team <linux-imx@nxp.com>,Catalin Marinas <catalin.marinas@arm.com>,Will Deacon <will@kernel.org>,Martin Kepplinger <martink@posteo.de>,Angus Ainslie <angus@akkea.ca>,Krzysztof Kozlowski <krzk@kernel.org>,Bjorn Andersson <bjorn.andersson@linaro.org>,Li Yang <leoyang.li@nxp.com>,Geert Uytterhoeven <geert+renesas@glider.be>,Vinod Koul <vkoul@kernel.org>,Anson Huang <Anson.Huang@nxp.com>,Michael Walle <michael@walle.cc>,devicetree@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org,phone-devel@vger.kernel.org

Guido Günther (4):
  arm64: defconfig: Enable Librem 5 devkit components
  arm64: dts: imx8mq-librem5-devkit: Tweak pmic regulators
  arm64: dts: imx8mq-librem5-devkit: Disable snvs_rtc
  arm64: dts: imx8mq-librem5-devkit: Drop custom clock settings

 .../dts/freescale/imx8mq-librem5-devkit.dts   | 20 ++++++++++++++-----
 arch/arm64/configs/defconfig                  |  8 ++++++++
 2 files changed, 23 insertions(+), 5 deletions(-)

-- 
2.29.2

