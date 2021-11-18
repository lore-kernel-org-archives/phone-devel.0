Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5CE6C4332F
	for <phone-devel@archiver.kernel.org>; Thu, 18 Nov 2021 21:03:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DD056139F
	for <phone-devel@archiver.kernel.org>; Thu, 18 Nov 2021 21:03:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233543AbhKRVF5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 18 Nov 2021 16:05:57 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:36964 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233319AbhKRVFz (ORCPT <rfc822;phone-devel@vger.kernel.org>);
        Thu, 18 Nov 2021 16:05:55 -0500
Received: from localhost.localdomain (ip-213-127-109-54.ip.prioritytelecom.net [213.127.109.54])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 6427BCADFE;
        Thu, 18 Nov 2021 21:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1637269373; bh=hVhf8M1vf/Y7SjzoLmES1H4b9X86FBqukDCU7O27VBg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=sNAnKr46DkWHRcjSZ88Z0LG2AXaerQPLd7LkLWjypugwTiOUZ0aSG/3v0yk7Sskcz
         JKX7CoeMzhUo1TAElTagDyYbm1fIcMcozA17/HL2S52HPC7kQLfkpZQgONGEPvrX1F
         kc+PETY67XiMrQ/RDqnETj6qjvnCJw0c1Gom7M3s=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] dt-bindings: phy: qcom,usb-hs-phy: add MSM8226 compatible
Date:   Thu, 18 Nov 2021 22:02:08 +0100
Message-Id: <20211118210210.160895-5-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211118210210.160895-1-luca@z3ntu.xyz>
References: <20211118210210.160895-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add a compatible for MSM8226 which also uses the USB HS PHY.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt
index b3b75c1e6285..6814dccb390c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.txt
@@ -9,6 +9,7 @@ PROPERTIES
                 following:
 
                         "qcom,usb-hs-phy-apq8064"
+                        "qcom,usb-hs-phy-msm8226"
                         "qcom,usb-hs-phy-msm8916"
                         "qcom,usb-hs-phy-msm8974"
 
-- 
2.34.0

