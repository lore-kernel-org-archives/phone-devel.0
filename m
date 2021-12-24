Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFA8C433FE
	for <phone-devel@archiver.kernel.org>; Fri, 24 Dec 2021 11:35:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352579AbhLXLfA (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 24 Dec 2021 06:35:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352585AbhLXLe7 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 24 Dec 2021 06:34:59 -0500
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D60C0C061401
        for <phone-devel@vger.kernel.org>; Fri, 24 Dec 2021 03:34:58 -0800 (PST)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C96663E929;
        Fri, 24 Dec 2021 12:34:56 +0100 (CET)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] regulator: qcom-labibb: OCP interrupts are not a failure while disabled
Date:   Fri, 24 Dec 2021 12:34:50 +0100
Message-Id: <20211224113450.107958-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Receiving the Over-Current Protection interrupt while the regulator is
disabled does not count as unhandled/failure (IRQ_NONE, or 0 as it were)
but a "fake event", usually due to inrush as the is regulator about to
be enabled.

Fixes: 390af53e0411 ("regulator: qcom-labibb: Implement short-circuit and over-current IRQs")
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/regulator/qcom-labibb-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/qcom-labibb-regulator.c b/drivers/regulator/qcom-labibb-regulator.c
index 1b0b3b9edce5..a708da809a8b 100644
--- a/drivers/regulator/qcom-labibb-regulator.c
+++ b/drivers/regulator/qcom-labibb-regulator.c
@@ -261,7 +261,7 @@ static irqreturn_t qcom_labibb_ocp_isr(int irq, void *chip)
 
 	/* If the regulator is not enabled, this is a fake event */
 	if (!ops->is_enabled(vreg->rdev))
-		return 0;
+		return IRQ_HANDLED;
 
 	/* If we tried to recover for too many times it's not getting better */
 	if (vreg->ocp_irq_count > LABIBB_MAX_OCP_COUNT)
-- 
2.34.1

