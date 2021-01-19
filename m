Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74057C433E0
	for <phone-devel@archiver.kernel.org>; Tue, 19 Jan 2021 20:21:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AE742313B
	for <phone-devel@archiver.kernel.org>; Tue, 19 Jan 2021 20:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729667AbhASSwK (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 19 Jan 2021 13:52:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391991AbhASRyx (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 19 Jan 2021 12:54:53 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2341CC0612FD
        for <phone-devel@vger.kernel.org>; Tue, 19 Jan 2021 09:47:58 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id F11193F203;
        Tue, 19 Jan 2021 18:45:58 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     viresh.kumar@linaro.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, rjw@rjwysocki.net,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        amit.kucheria@linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, jeffrey.l.hugo@gmail.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v4 1/7] cpufreq: blacklist SDM630/636/660 in cpufreq-dt-platdev
Date:   Tue, 19 Jan 2021 18:45:51 +0100
Message-Id: <20210119174557.227318-2-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119174557.227318-1-angelogioacchino.delregno@somainline.org>
References: <20210119174557.227318-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add the SDM630, SDM636 and SDM660 to the blacklist since the CPU
scaling is handled out of this.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index bd2db0188cbb..f82f4ec17ff2 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -135,6 +135,9 @@ static const struct of_device_id blacklist[] __initconst = {
 	{ .compatible = "qcom,msm8996", },
 	{ .compatible = "qcom,qcs404", },
 	{ .compatible = "qcom,sc7180", },
+	{ .compatible = "qcom,sdm630", },
+	{ .compatible = "qcom,sdm636", },
+	{ .compatible = "qcom,sdm660", },
 	{ .compatible = "qcom,sdm845", },
 
 	{ .compatible = "st,stih407", },
-- 
2.30.0

