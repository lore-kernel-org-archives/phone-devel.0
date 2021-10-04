Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9F0C433EF
	for <phone-devel@archiver.kernel.org>; Mon,  4 Oct 2021 20:50:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95694611C8
	for <phone-devel@archiver.kernel.org>; Mon,  4 Oct 2021 20:50:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236976AbhJDUwI (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 4 Oct 2021 16:52:08 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:24615 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236930AbhJDUwH (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 4 Oct 2021 16:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633380611;
    s=strato-dkim-0002; d=gerhold.net;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Bv0nC4DI6UrkCPmDGYdw4N9y7Tcvwwp6FOL6iEhuhKg=;
    b=S9hR03ptYHlK5NfoP/Jyq7whyr6NetDPESjPrn3RcpX7UlFjfubcwJbrXnzs509cfW
    R4Lj1ySmpsKL05z8bmrX6JhfI/+6SIVbUYSB1qi5H1YcXP/pUJ/3pro7LWf9JyVRAWcu
    gfDKRx64eXdewlEN1ggRlAJjv+tBdGUMfR7aujxsUyLz4OZdNL6YhQeudhwygFtCLbGK
    c+zWLxKkgWWEXsvKWtOXo19knoX9mFwVdgtpp3ycL2AM0okuvBGp6cdZNdRvwgOrTEt4
    IIwYT3TvS0Rg/IvZog4Go8i6GvPdcqGtNymBFDEwoUrAcgj/IJ9T0VarjjtCIX57og2G
    hhwA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIhr2eFePxBA="
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x94KoAKSj
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 4 Oct 2021 22:50:10 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 07/15] ARM: qcom: Add ARCH_MSM8916 for MSM8916 on ARM32
Date:   Mon,  4 Oct 2021 22:49:47 +0200
Message-Id: <20211004204955.21077-7-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211004201921.18526-1-stephan@gerhold.net>
References: <20211004201921.18526-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add a CONFIG_ARCH_MSM8916 option to enable building MSM8916 support
on ARM32. Note that since ARM64 is the main supported architecture
for MSM8916 this is only intended for testing and for devices where
signed firmware does not allow booting ARM64 kernels.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2: Simplify wording a bit
---
 arch/arm/mach-qcom/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/mach-qcom/Kconfig b/arch/arm/mach-qcom/Kconfig
index 1772eccb5caf..466acc4a5e0c 100644
--- a/arch/arm/mach-qcom/Kconfig
+++ b/arch/arm/mach-qcom/Kconfig
@@ -21,6 +21,16 @@ config ARCH_MSM8X60
 	bool "Enable support for MSM8X60"
 	select CLKSRC_QCOM
 
+config ARCH_MSM8916
+	bool "Enable support for MSM8916"
+	select HAVE_ARM_ARCH_TIMER
+	help
+	  Enable support for the Qualcomm Snapdragon 410 (MSM8916/APQ8016).
+
+	  Note that ARM64 is the main supported architecture for MSM8916.
+	  The ARM32 option is intended for a few devices with signed firmware
+	  that does not allow booting ARM64 kernels.
+
 config ARCH_MSM8960
 	bool "Enable support for MSM8960"
 	select CLKSRC_QCOM
-- 
2.33.0

