Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A16C433EF
	for <phone-devel@archiver.kernel.org>; Tue, 28 Sep 2021 17:27:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D45361354
	for <phone-devel@archiver.kernel.org>; Tue, 28 Sep 2021 17:27:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242092AbhI1R3Q (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 28 Sep 2021 13:29:16 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.173]:21595 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242096AbhI1R3O (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 28 Sep 2021 13:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1632849692;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=G71mCTmQCHMhCU8D4JXvI4Tc2hKHBlUFMgU3lkDk7oA=;
    b=JFiWW5780Qe2X1KIcOLdfUHYEI3uW9LF8uNVzYt5JYRz89B0rRQO/UTilwGZPhBvgt
    VdRD7EMcxhLr5lix3+QtUarNvW+oe61KUHvNKY4MACbS3C05Jo33A/ViOI3G6mwLw+/0
    ZzPbNYY7e/zOVd9EqDDMj8xY3NESVGStS0Wvqny+YGEmBNsdG5Snlx4jL1tdjsBV+tUC
    NlJi6WODAHi8epASjCmqgCUot1YnuihYX/tIyX3zU35g8f53xFlI1qHIcTGGRwLwgpsB
    XMU9rQgjoemhsbO5uaGvh0UOvUexKnX8VIkwcyjGg5j/TPB9Kc8VWfq19nUC82MJT2qC
    Q5lA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr3eFSKSxc="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x8SHLWoBR
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 28 Sep 2021 19:21:32 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 11/15] soc: qcom: spm: Add 8916 SPM register data
Date:   Tue, 28 Sep 2021 19:12:27 +0200
Message-Id: <20210928171231.12766-12-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928171231.12766-1-stephan@gerhold.net>
References: <20210928171231.12766-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Lina Iyer <lina.iyer@linaro.org>

Add SPM register information and initialization values for QCOM 8916
SoC.

Link: https://lore.kernel.org/linux-arm-msm/1429314549-6730-5-git-send-email-lina.iyer@linaro.org/
Signed-off-by: Lina Iyer <lina.iyer@linaro.org>
[stephan: rebase patch and fix conflicts]
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Like for qcom,msm8916-smp and qcom,msm8226-smp, this is actually
pretty much identical to the MSM8226 configuration except for the
new v3.0 register offsets.
---
 drivers/soc/qcom/spm.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/soc/qcom/spm.c b/drivers/soc/qcom/spm.c
index 2961a89d929c..f831420b7fd4 100644
--- a/drivers/soc/qcom/spm.c
+++ b/drivers/soc/qcom/spm.c
@@ -67,6 +67,25 @@ static const struct spm_reg_data spm_reg_8998_silver_l2  = {
 	.avs_limit = 0x4200420,
 };
 
+static const u16 spm_reg_offset_v3_0[SPM_REG_NR] = {
+	[SPM_REG_CFG]		= 0x08,
+	[SPM_REG_SPM_CTL]	= 0x30,
+	[SPM_REG_DLY]		= 0x34,
+	[SPM_REG_SEQ_ENTRY]	= 0x400,
+};
+
+/* SPM register data for 8916 */
+static const struct spm_reg_data spm_reg_8916_cpu = {
+	.reg_offset = spm_reg_offset_v3_0,
+	.spm_cfg = 0x1,
+	.spm_dly = 0x3C102800,
+	.seq = { 0x60, 0x03, 0x60, 0x0B, 0x0F, 0x20, 0x10, 0x80, 0x30, 0x90,
+		0x5B, 0x60, 0x03, 0x60, 0x3B, 0x76, 0x76, 0x0B, 0x94, 0x5B,
+		0x80, 0x10, 0x26, 0x30, 0x0F },
+	.start_index[PM_SLEEP_MODE_STBY] = 0,
+	.start_index[PM_SLEEP_MODE_SPC] = 5,
+};
+
 static const u16 spm_reg_offset_v2_1[SPM_REG_NR] = {
 	[SPM_REG_CFG]		= 0x08,
 	[SPM_REG_SPM_CTL]	= 0x30,
@@ -176,6 +195,8 @@ static const struct of_device_id spm_match_table[] = {
 	  .data = &spm_reg_660_silver_l2 },
 	{ .compatible = "qcom,msm8226-saw2-v2.1-cpu",
 	  .data = &spm_reg_8226_cpu },
+	{ .compatible = "qcom,msm8916-saw2-v3.0-cpu",
+	  .data = &spm_reg_8916_cpu },
 	{ .compatible = "qcom,msm8974-saw2-v2.1-cpu",
 	  .data = &spm_reg_8974_8084_cpu },
 	{ .compatible = "qcom,msm8998-gold-saw2-v4.1-l2",
-- 
2.33.0

