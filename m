Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA8DC001B0
	for <phone-devel@archiver.kernel.org>; Mon, 17 Jul 2023 10:01:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbjGQKBZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 17 Jul 2023 06:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230114AbjGQKBT (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 17 Jul 2023 06:01:19 -0400
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43D22136
        for <phone-devel@vger.kernel.org>; Mon, 17 Jul 2023 03:01:15 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 01D3224002A
        for <phone-devel@vger.kernel.org>; Mon, 17 Jul 2023 12:01:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1689588073; bh=cGdADOGHy3QeQCyvjOMz+FvDAOetEKi2ZS2r9cKyFpA=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
         Content-Transfer-Encoding:From;
        b=Gty7Ys9V0mv1X9ezSN5JDm7Axn4dxM4eRGhhLnBpK8h/5dsGQkXEYlcYnJiTEJUZ4
         gIA9fDWXFS05XHuFui0otttJZx6gGESXlUfezGpH9JziXGjWA7+LATStAdUepsJBC8
         rr0VUXtZ0P4Y5rRzkrOeFKHEQ4bvz61w1H4fq9Hzz9qwqTdWCigFhSTQIAZ2XpQTJi
         cwaxeZ9fmNWiH7wMI9HI64OQcluGsaRIHtj+SjMfe9YAzAXqWoyJ6YGTeiQm8op6kW
         LG9R4BGKVAYpK7p0XJfeUojCR9gEXJYFXCCzytJPU/JEOp7KhAWrfAK8DiHNOFopDa
         ZkiKqENOm7nWQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4R4HfG3xfNz6tvw;
        Mon, 17 Jul 2023 12:01:10 +0200 (CEST)
From:   Martin Kepplinger <martink@posteo.de>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, shawnguo@kernel.org, festevam@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com, kernel@puri.sm,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 0/4] arm64: dts: imx8mq-librem5: description updates
Date:   Mon, 17 Jul 2023 10:00:52 +0000
Message-Id: <20230717100056.4047292-1-martink@posteo.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Martin Kepplinger <martin.kepplinger@puri.sm>

hi Shaw and all interested,

This is another small but important round of hardware description updates
for the Librem 5 phone. The first allows to use the display stack in
the first place. The other 3 patches improve diplay-blanking when talking,
enable fast charging when system-suspended, and faster system-resume.

thanks,

                         martin

Martin Kepplinger (1):
  arm64: dts: imx8mq-librem5: set audio-1v8 always-on

Sebastian Krzyszkowiak (3):
  arm64: dts: imx8mq-librem5-r4: Bump up proximity sensor's near level
  arm64: dts: imx8mq-librem5: Mark tps65982 as wakeup source
  arm64: dts: imx8mq-librem5: Reduce usdhc2's post-power-on-delay-ms to
    20ms

 arch/arm64/boot/dts/freescale/imx8mq-librem5-r4.dts | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi   | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.30.2

