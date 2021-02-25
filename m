Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DA3C433E6
	for <phone-devel@archiver.kernel.org>; Thu, 25 Feb 2021 21:37:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CEF2864EDB
	for <phone-devel@archiver.kernel.org>; Thu, 25 Feb 2021 21:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234202AbhBYVhA (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 25 Feb 2021 16:37:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234081AbhBYVgx (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 25 Feb 2021 16:36:53 -0500
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EBAEC061756;
        Thu, 25 Feb 2021 13:36:13 -0800 (PST)
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 69C381F630;
        Thu, 25 Feb 2021 22:36:10 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: pmic-mpp: Add missing dt-bindings mpp function defs
Date:   Thu, 25 Feb 2021 22:36:04 +0100
Message-Id: <20210225213605.117201-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

The pinctrl-spmi-mpp driver supports setting more mpp functions
than the ones defined in the dt-bindings header, specifically,
digital, analog and sink.

To follow the current way of specifying the function config
in Device-Tree, add the missing three definitions in the
appropriate dt-bindings header as:
GPIO_MPP_FUNC_{DIGITAL,ANALOG,SINK}.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 include/dt-bindings/pinctrl/qcom,pmic-mpp.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/pinctrl/qcom,pmic-mpp.h b/include/dt-bindings/pinctrl/qcom,pmic-mpp.h
index 32e66ee7e830..3cdca7ee1b3f 100644
--- a/include/dt-bindings/pinctrl/qcom,pmic-mpp.h
+++ b/include/dt-bindings/pinctrl/qcom,pmic-mpp.h
@@ -98,6 +98,9 @@
 /* To be used with "function" */
 #define PMIC_MPP_FUNC_NORMAL		"normal"
 #define PMIC_MPP_FUNC_PAIRED		"paired"
+#define PMIC_MPP_FUNC_DIGITAL		"digital"
+#define PMIC_MPP_FUNC_ANALOG		"analog"
+#define PMIC_MPP_FUNC_SINK		"sink"
 #define PMIC_MPP_FUNC_DTEST1		"dtest1"
 #define PMIC_MPP_FUNC_DTEST2		"dtest2"
 #define PMIC_MPP_FUNC_DTEST3		"dtest3"
-- 
2.30.1

