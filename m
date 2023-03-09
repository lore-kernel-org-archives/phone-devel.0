Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84E88C74A44
	for <phone-devel@archiver.kernel.org>; Thu,  9 Mar 2023 20:48:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjCIUrw (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 9 Mar 2023 15:47:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbjCIUrh (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 9 Mar 2023 15:47:37 -0500
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAE4AFEF1C;
        Thu,  9 Mar 2023 12:47:01 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id A09C5E979E;
        Thu,  9 Mar 2023 12:46:31 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oGd5aT8mdtMT; Thu,  9 Mar 2023 12:46:30 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=comms;
        t=1678394790; bh=lAVLXqcmpfdm/Br6g91NrEv3yjfjN/llShKwmmZU+Mk=;
        h=From:To:Cc:Subject:Date:From;
        b=nEkgjUjFlslfjwrToktVYv0ly9dgZM9T4YlGUq5Ttf1JQbbOVLhQyR6M+c5UlzKxW
         r5yLLMRiLU+6XFsuwM1wpLKDWZjLddTAyOaYiyXyyYFk6FuX5fTbJiPKwObdpvEa4B
         arHEcbfQM1K4qIszfVJsR74t20XbrKXRu6ZEAJctCKFaQdSkNADfWjxGTij6KSbmHn
         X8Yu33S+inL0ez7NeAx3hLtb1Jc+G5evNmR136HazdwZ+pmmVCmzMY4nD4AtWETJHT
         MIdVngVNp16hnHtANdOKqeD0s9L+U8uqxEdnW2Re+igkrS5tSAu9wqEyTfdvTdLGOe
         VbXkyPTfJwWNQ==
To:     robh@kernel.org, krzysztof.kozlowski@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com
Cc:     kernel@puri.sm, linux-imx@nxp.com, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v1 00/14] arm64: dts: imx8mq-librem5: updates and fixes until march 2023
Date:   Thu,  9 Mar 2023 21:45:54 +0100
Message-Id: <20230309204608.237605-1-martin.kepplinger@puri.sm>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

hi Shawn and all interested in the Librem 5 phone,

This is another round of updates to the phone DT description. Some are
clear fixes, but some are important updates like the CSI changes
that make the selfie cam work or the powersaving related things like
the ddrc opp table entry and voltage changes.

As previously this is all mixed together because the changes are small.
If you prefer separate, small "topic-patchsets", please say so.

thanks,
                           martin


Angus Ainslie (1):
  arm64: dts: imx8mq-librem5: add the magnetometer mount matrix

Martin Kepplinger (4):
  arm64: dts: imx8mq-librem5: lower the mipi csi 1 frequencies
  arm64: dts: imx8mq-librem5: describe the clock for the csi sensors
  arm64: dts: imx8mq-librem5: fix audio-1v8 regulator name
  arm64: dts: imx8mq-librem5: add brightness levels to led-backlight

Sebastian Krzyszkowiak (9):
  arm64: dts: imx8mq-librem5: Describe MIC_2V4 regulator
  arm64: dts: imx8mq-librem5: Set charger parameters for each batch
  arm64: dts: imx8mq-librem5: Set the DVS voltages lower
  arm64: dts: imx8mq-librem5: Bump usdhc2 frequency to 100MHz
  arm64: dts: imx8mq-librem5: Adjust proximity sensor's near levels
  arm64: dts: imx8mq-librem5: Remove dis_u3_susphy_quirk from usb_dwc3_0
  arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage to 0.81V
  arm64: dts: imx8mq-librem5: Reduce I2C frequency to 384kHz
  arm64: dts: imx8mq-librem5: Add 166MHz to DDRC OPP table

 .../boot/dts/freescale/imx8mq-librem5-r2.dts  | 12 ++--
 .../boot/dts/freescale/imx8mq-librem5-r3.dts  |  2 +-
 .../boot/dts/freescale/imx8mq-librem5-r3.dtsi | 10 ++-
 .../boot/dts/freescale/imx8mq-librem5-r4.dts  |  2 +-
 .../boot/dts/freescale/imx8mq-librem5.dtsi    | 70 ++++++++++++++-----
 5 files changed, 67 insertions(+), 29 deletions(-)

-- 
2.30.2

