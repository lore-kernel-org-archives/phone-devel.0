Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF61C43332
	for <phone-devel@archiver.kernel.org>; Wed, 13 Jan 2021 19:43:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C59A2333E
	for <phone-devel@archiver.kernel.org>; Wed, 13 Jan 2021 19:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728719AbhAMTnN (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 13 Jan 2021 14:43:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728668AbhAMTnN (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 13 Jan 2021 14:43:13 -0500
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60926C061786
        for <phone-devel@vger.kernel.org>; Wed, 13 Jan 2021 11:42:18 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 766E61F52A;
        Wed, 13 Jan 2021 20:42:16 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 0/7] Really implement Qualcomm LAB/IBB regulators
Date:   Wed, 13 Jan 2021 20:42:07 +0100
Message-Id: <20210113194214.522238-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Okay, the title may be a little "aggressive"? However, the qcom-labibb
driver wasn't really .. doing much.
The current form of this driver is only taking care of enabling or
disabling the regulators, which is pretty useless if they were not
pre-set from the bootloader, which sets them only if continuous
splash is enabled.
Moreover, some bootloaders are setting a higher voltage and/or a higher
current limit compared to what's actually required by the attached
hardware (which is, in 99.9% of the cases, a display) and this produces
a higher power consumption, higher heat output and a risk of actually
burning the display if kept up for a very long time: for example, this
is true on at least some Sony Xperia MSM8998 (Yoshino platform) and
especially on some Sony Xperia SDM845 (Tama platform) smartphones.

In any case, the main reason why this change was necessary for us is
that, during the bringup of Sony Xperia MSM8998 phones, we had an issue
with the bootloader not turning on the display and not setting the lab
and ibb regulators before booting the kernel, making it impossible to
powerup the display.

With this said, this patchset enables setting voltage, current limiting,
overcurrent and short-circuit protection.. and others, on the LAB/IBB
regulators.
Each commit in this patch series provides as many informations as
possible about what's going on and testing methodology.

Changes in v2:
 - From Mark Brown review:
   - Replaced some if branches with switch statements
   - Moved irq get and request in probe function
   - Changed short conditionals to full ones
   - Removed useless check for ocp_irq_requested
 -  Fixed issues with YAML documentation

AngeloGioacchino Del Regno (7):
  regulator: qcom-labibb: Implement voltage selector ops
  regulator: qcom-labibb: Implement current limiting
  regulator: qcom-labibb: Implement pull-down, softstart, active
    discharge
  dt-bindings: regulator: qcom-labibb: Document soft start properties
  regulator: qcom-labibb: Implement short-circuit and over-current IRQs
  dt-bindings: regulator: qcom-labibb: Document SCP/OCP interrupts
  arm64: dts: pmi8998: Add the right interrupts for LAB/IBB SCP and OCP

 .../regulator/qcom-labibb-regulator.yaml      |  30 +-
 arch/arm64/boot/dts/qcom/pmi8998.dtsi         |   8 +-
 drivers/regulator/qcom-labibb-regulator.c     | 661 +++++++++++++++++-
 3 files changed, 686 insertions(+), 13 deletions(-)

-- 
2.29.2

