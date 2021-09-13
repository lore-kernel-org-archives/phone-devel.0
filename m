Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FEB3C433FE
	for <phone-devel@archiver.kernel.org>; Mon, 13 Sep 2021 13:59:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D01561A09
	for <phone-devel@archiver.kernel.org>; Mon, 13 Sep 2021 13:59:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245354AbhIMOAz (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Sep 2021 10:00:55 -0400
Received: from comms.puri.sm ([159.203.221.185]:39610 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243728AbhIMN6o (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Sep 2021 09:58:44 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 062D2E0FDD;
        Mon, 13 Sep 2021 06:57:25 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 6djZ9Dce4JhH; Mon, 13 Sep 2021 06:57:24 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     robh@kernel.org, shawnguo@kernel.org, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        kernel@puri.sm, Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 0/6] arm64: dts: imx8mq-librem5: wifi updates and minor fixes
Date:   Mon, 13 Sep 2021 15:57:00 +0200
Message-Id: <20210913135706.309685-1-martin.kepplinger@puri.sm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

hi,

In order to maintain support the Librem 5 phone, this updates the
DT description. It's mainly wifi additions.

thanks a lot,

                           martin

Angus Ainslie (3):
  arm64: dts: imx8mq-librem5: delay the startup of the SDIO
  arm64: dts: imx8mq-librem5: add power sequencing for M.2 cards
  arm64: dts: imx8mq-librem5: Limit the max sdio frequency

Guido Günther (1):
  arm64: dts: imx8mq-librem5: wire up the wifi regulator

Martin Kepplinger (1):
  arm64: dts: imx8mq-librem5: add reset gpio to mantix panel description

Sebastian Krzyszkowiak (1):
  arm64: dts: imx8mq-librem5: Fix led_r and led_g pinctrl assignments

 .../boot/dts/freescale/imx8mq-librem5.dtsi    | 43 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 2 deletions(-)

-- 
2.30.2

