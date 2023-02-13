Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B293EC636D4
	for <phone-devel@archiver.kernel.org>; Mon, 13 Feb 2023 12:35:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjBMMfG (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Feb 2023 07:35:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbjBMMfG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Feb 2023 07:35:06 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A9214EAA
        for <phone-devel@vger.kernel.org>; Mon, 13 Feb 2023 04:35:01 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id p26so31394113ejx.13
        for <phone-devel@vger.kernel.org>; Mon, 13 Feb 2023 04:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=toszlCApAapEeFqDOAwpUXkStpvwASomRZo2T6mEG/c=;
        b=DNOijF8FzQr4XYmuUF6mlyvX6OVjV8jq8xG+BB1FP8MICS2y5ASwVZdm/HX/Kw/G7S
         vcpgI7GDVeB9gvg6EvN2gTzFTXlgERYkxsf7HAVcuiGP07Zl7IzUCWTBHUykuxCq5yO8
         FggjMie6QWFugXHfUNFfk2KbCLI4t18m/Hx/RhBW9QucZcyOz0Br+19E9W5zMVbAlaix
         HWWhbrByMV4jZUanwRgxXxR/gvji57IzLj6BWC0Hl/dI2/BqAXBP5ALBDgsFeseIJnsE
         E3NKwBsq/fEkO5+C0VZkMjPDzv9nqLxzFxx7D6ygZyXwZnWfZCRJZXqhi/OmB4bkNSxZ
         Ob3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=toszlCApAapEeFqDOAwpUXkStpvwASomRZo2T6mEG/c=;
        b=SmJzyq1Vd78qUDcO/Hjwbf5h8kxdrxXrquMObqtLTURDc5K4VQdY5hvQxr3MBLjvpK
         7yOidcf52VDmU0QHWOZEHLw/ChBmyPdeeqGGet5MHXX8l1PfnUVPSrHWtdyVaogoQK8F
         DE0UVQYTMbVm0PGvcEvYPdFF7AHiVdHQaEASUu4U6t/2Ep5QL+iPKISOOWlKx1rV3o6V
         Wc0bLroO4MBD+Pn/dyee7T+qYeWhVmOeYtRyJ2///yXC1rBcQuBJox3RiMHI5tYpnrhD
         WefjgnDI6EGktY5dCYPZymGncV8xkJ3fdSoqotRPGyp6OSOMwjeARsV/Ltp9G6DaOTUl
         D8Vw==
X-Gm-Message-State: AO0yUKWKUmHAu08xl8CICS0I5VAcUWGbFcLLMFw7dak7H0ZxiQRP5LPh
        JJyXI+2AaQ6YmpR0bo4W5j5b4w==
X-Google-Smtp-Source: AK7set98ArNnNtWEUOPSCJB0AgQKWPtHGVKhgZflMq72qc7Cw5Ag20dqlTEMbApSEtvhaqYplql1rw==
X-Received: by 2002:a17:907:7fa5:b0:8b0:2397:8003 with SMTP id qk37-20020a1709077fa500b008b023978003mr9690365ejc.29.1676291700284;
        Mon, 13 Feb 2023 04:35:00 -0800 (PST)
Received: from [172.16.220.87] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm6721858ejz.214.2023.02.13.04.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 04:35:00 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
X-Google-Original-From: Luca Weiss <luca@z3ntu.xyz>
Date:   Mon, 13 Feb 2023 13:34:56 +0100
Subject: [PATCH 1/2] clk: qcom: camcc-sm6350: add pm_runtime support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230213-sm6350-camcc-runtime_pm-v1-1-761fc69f7a80@z3ntu.xyz>
References: <20230213-sm6350-camcc-runtime_pm-v1-0-761fc69f7a80@z3ntu.xyz>
In-Reply-To: <20230213-sm6350-camcc-runtime_pm-v1-0-761fc69f7a80@z3ntu.xyz>
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
X-Mailer: b4 0.12.1
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Make sure that we can enable and disable the power domains used for
camcc when the clocks are and aren't used.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/clk/qcom/camcc-sm6350.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/camcc-sm6350.c b/drivers/clk/qcom/camcc-sm6350.c
index acba9f99d960..dd65f3ef0857 100644
--- a/drivers/clk/qcom/camcc-sm6350.c
+++ b/drivers/clk/qcom/camcc-sm6350.c
@@ -7,6 +7,8 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,sm6350-camcc.h>
@@ -1869,6 +1871,19 @@ MODULE_DEVICE_TABLE(of, camcc_sm6350_match_table);
 static int camcc_sm6350_probe(struct platform_device *pdev)
 {
 	struct regmap *regmap;
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_pm_clk_create(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
+	ret = pm_runtime_get(&pdev->dev);
+	if (ret)
+		return ret;
 
 	regmap = qcom_cc_map(pdev, &camcc_sm6350_desc);
 	if (IS_ERR(regmap))
@@ -1879,14 +1894,26 @@ static int camcc_sm6350_probe(struct platform_device *pdev)
 	clk_agera_pll_configure(&camcc_pll2, regmap, &camcc_pll2_config);
 	clk_fabia_pll_configure(&camcc_pll3, regmap, &camcc_pll3_config);
 
-	return qcom_cc_really_probe(pdev, &camcc_sm6350_desc, regmap);
+	ret = qcom_cc_really_probe(pdev, &camcc_sm6350_desc, regmap);
+	pm_runtime_put(&pdev->dev);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to register CAM CC clocks\n");
+		return ret;
+	}
+
+	return 0;
 }
 
+static const struct dev_pm_ops camcc_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver camcc_sm6350_driver = {
 	.probe = camcc_sm6350_probe,
 	.driver = {
 		.name = "sm6350-camcc",
 		.of_match_table = camcc_sm6350_match_table,
+		.pm = &camcc_pm_ops,
 	},
 };
 

-- 
2.39.1

