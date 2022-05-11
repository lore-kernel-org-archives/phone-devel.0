Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1D4C433EF
	for <phone-devel@archiver.kernel.org>; Wed, 11 May 2022 22:06:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347226AbiEKWGT (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 11 May 2022 18:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348534AbiEKWGS (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 11 May 2022 18:06:18 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 366331E3CE
        for <phone-devel@vger.kernel.org>; Wed, 11 May 2022 15:06:17 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B9B97207D3;
        Thu, 12 May 2022 00:06:14 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 0/7] Add Qcom PM6125 PMIC, and use in Sony Xperia Seine PDX201
Date:   Thu, 12 May 2022 00:06:06 +0200
Message-Id: <20220511220613.1015472-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This series adds initial support for the PM6125 PMIC, and its power key
handling and thermal monitoring capabilities are configured for Sony's
PDX201 (Xperia 10II).

One patch for pm660 is included to fix a node address mismatch with its
reg field.

Note that this series has been based on top of:

  https://lore.kernel.org/linux-arm-msm/20220508100336.127176-1-marijn.suijten@somainline.org/T/#u

To prevent conflicts with the moving around of sdc2 nodes, presuming
that series is applied first.

Marijn Suijten (7):
  arm64: dts: qcom: pm660: Use unique ADC5_VCOIN address in node name
  dt-bindings: pinctrl: qcom-pmic-gpio: Add pm6125 compatible
  pinctrl: qcom: spmi-gpio: Add pm6125 compatible
  iio: adc: qcom-spmi-adc5: Add missing VCOIN/AMUX_THM3/GPIO# channels
  arm64: dts: qcom: Add PM6125 PMIC
  arm64: dts: qcom: sm6125-seine: Include PM6125 and configure PON
  arm64: dts: qcom: sm6125-seine: Configure additional trinket
    thermistors

 .../bindings/pinctrl/qcom,pmic-gpio.yaml      |   2 +
 arch/arm64/boot/dts/qcom/pm6125.dtsi          | 156 +++++++++++++++++
 arch/arm64/boot/dts/qcom/pm660.dtsi           |   2 +-
 .../qcom/sm6125-sony-xperia-seine-pdx201.dts  | 161 +++++++++++++++++-
 drivers/iio/adc/qcom-spmi-adc5.c              |  12 ++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c      |   1 +
 6 files changed, 332 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/pm6125.dtsi

--
2.36.1

