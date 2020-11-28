Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA474C83019
	for <phone-devel@archiver.kernel.org>; Sat, 28 Nov 2020 22:05:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C779F24073
	for <phone-devel@archiver.kernel.org>; Sat, 28 Nov 2020 22:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389958AbgK1Vu1 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 28 Nov 2020 16:50:27 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:46132 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733171AbgK1TFr (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Sat, 28 Nov 2020 14:05:47 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id EF093FB04;
        Sat, 28 Nov 2020 19:56:25 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id zid9voNsBgAD; Sat, 28 Nov 2020 19:56:24 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 1295B4068E; Sat, 28 Nov 2020 19:56:24 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Anson Huang <Anson.Huang@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Walle <michael@walle.cc>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: [PATCH v2 0/1] arm64: defconfig: Enable Librem 5 hardware
Date:   Sat, 28 Nov 2020 19:56:22 +0100
Message-Id: <cover.1606589670.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


This series enables components found on Purism's Librem 5
that are available in mainline.

- changes from v2
  - As per review comments from Geert Uytterhoeven
    https://lore.kernel.org/lkml/CAMuHMdUK3gbHwR94BcjRBkNvdpQSJrMn0itrs65Ay5KqUCA-Hg@mail.gmail.com/
    - Fix commit messages typos
  - Add GNSS receiver and IMU

- changes from v1
  - As per review comments from Krzysztof Kozlowski
    https://lore.kernel.org/linux-arm-kernel/CAJKOXPdEwiSTg+cMes_wes5oz2F1qEexsus6iHenuLs9SAXk6g@mail.gmail.com/
    - Squash config changes into a single commit
  - Add touch controller

Patches are on top of Shawn's imx/defconfig

Guido Günther (1):
  arm64: defconfig: Enable more Librem 5 hardware

 arch/arm64/configs/defconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
2.29.2

