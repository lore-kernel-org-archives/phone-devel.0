Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A48C4332B
	for <phone-devel@archiver.kernel.org>; Thu, 14 Jan 2021 22:12:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6A1823976
	for <phone-devel@archiver.kernel.org>; Thu, 14 Jan 2021 22:12:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730487AbhANWMH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 14 Jan 2021 17:12:07 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:55649 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730458AbhANWMG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 14 Jan 2021 17:12:06 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 9413F3F1DE;
        Thu, 14 Jan 2021 23:11:09 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v2 07/11] clk: qcom: mmcc-msm8998: Set CLK_GET_RATE_NOCACHE to pixel/byte clks
Date:   Thu, 14 Jan 2021 23:10:55 +0100
Message-Id: <20210114221059.483390-8-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org>
References: <20210114221059.483390-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The pixel and byte clocks rate should not be cached, as a VCO shutdown
may clear the frequency setup and this may not be set again due to the
cached rate being present.
This will also be useful when shadow clocks will be implemented in
the DSI PLL for seamless timing/resolution switch.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/clk/qcom/mmcc-msm8998.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index dd68983fe22e..475e00a5fdf4 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -520,7 +520,7 @@ static struct clk_rcg2 byte0_clk_src = {
 		.parent_data = mmss_xo_dsibyte,
 		.num_parents = 4,
 		.ops = &clk_byte2_ops,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
 
@@ -533,7 +533,7 @@ static struct clk_rcg2 byte1_clk_src = {
 		.parent_data = mmss_xo_dsibyte,
 		.num_parents = 4,
 		.ops = &clk_byte2_ops,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
 
@@ -1084,7 +1084,7 @@ static struct clk_rcg2 pclk0_clk_src = {
 		.parent_data = mmss_xo_dsi0pll_dsi1pll,
 		.num_parents = 4,
 		.ops = &clk_pixel_ops,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
 
@@ -1098,7 +1098,7 @@ static struct clk_rcg2 pclk1_clk_src = {
 		.parent_data = mmss_xo_dsi0pll_dsi1pll,
 		.num_parents = 4,
 		.ops = &clk_pixel_ops,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
 	},
 };
 
-- 
2.29.2

