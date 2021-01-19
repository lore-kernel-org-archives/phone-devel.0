Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD5FC433E0
	for <phone-devel@archiver.kernel.org>; Tue, 19 Jan 2021 22:02:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5261323104
	for <phone-devel@archiver.kernel.org>; Tue, 19 Jan 2021 22:02:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbhASWCu (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 19 Jan 2021 17:02:50 -0500
Received: from m-r2.th.seeweb.it ([5.144.164.171]:52685 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389438AbhASRrC (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 19 Jan 2021 12:47:02 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 3A9D93F1DA;
        Tue, 19 Jan 2021 18:45:31 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     nks@flawful.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, robh+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        jeffrey.l.hugo@gmail.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v4 3/3] arm64: qcom: qcs404: Change CPR nvmem-names
Date:   Tue, 19 Jan 2021 18:45:29 +0100
Message-Id: <20210119174529.227074-4-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119174529.227074-1-angelogioacchino.delregno@somainline.org>
References: <20210119174529.227074-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The CPR driver's common functions were split and put in another
file in order to support newer CPR revisions: to simplify the
commonization, the expected names of the fuses had to be changed
in order for both new and old support to use the same fuse name
retrieval function and keeping the naming consistent.

The thread id was added to the fuse name and, since CPRv1 does
not support threads, it is expected to always read ID 0, which
means that the expected name here is now "cpr0_(fuse_name)"
instead of "cpr_(fuse_name)": luckily, QCS404 is the only user
so change it accordingly.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 339790ba585d..f9350b028435 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -1168,19 +1168,19 @@ cpr: power-controller@b018000 {
 				<&cpr_efuse_ring2>,
 				<&cpr_efuse_ring3>,
 				<&cpr_efuse_revision>;
-			nvmem-cell-names = "cpr_quotient_offset1",
-				"cpr_quotient_offset2",
-				"cpr_quotient_offset3",
-				"cpr_init_voltage1",
-				"cpr_init_voltage2",
-				"cpr_init_voltage3",
-				"cpr_quotient1",
-				"cpr_quotient2",
-				"cpr_quotient3",
-				"cpr_ring_osc1",
-				"cpr_ring_osc2",
-				"cpr_ring_osc3",
-				"cpr_fuse_revision";
+			nvmem-cell-names = "cpr0_quotient_offset1",
+				"cpr0_quotient_offset2",
+				"cpr0_quotient_offset3",
+				"cpr0_init_voltage1",
+				"cpr0_init_voltage2",
+				"cpr0_init_voltage3",
+				"cpr0_quotient1",
+				"cpr0_quotient2",
+				"cpr0_quotient3",
+				"cpr0_ring_osc1",
+				"cpr0_ring_osc2",
+				"cpr0_ring_osc3",
+				"cpr0_fuse_revision";
 		};
 
 		timer@b120000 {
-- 
2.30.0

