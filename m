Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD672FA373F
	for <phone-devel@archiver.kernel.org>; Sun, 23 Oct 2022 20:46:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbiJWUqI (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 23 Oct 2022 16:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230023AbiJWUqG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 23 Oct 2022 16:46:06 -0400
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E6F6B67E;
        Sun, 23 Oct 2022 13:46:02 -0700 (PDT)
Date:   Sun, 23 Oct 2022 20:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1666557960; x=1666817160;
        bh=sdReJMz5rmxrQeZp6y5XGe86O9J9hDFHLMgg9jWnMaM=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=zHCknXtEnoWp0+ip2GKDTYxlmSvjDTYxg7LHTPCE/p/BTQbqH/SvCMcNXI+MHRlPU
         eeQFLSARRspDAOLls0XAkBIbmq6XCYI8eW7P0Y+LMhX1/fg26iA/5avEiIVUfQ4u0N
         0D1Xb0vlPsYQcQ8vIe6+e/zoQynSmWxTH6tAasUIiuWRlccYcjLCkZiQUVD2ed4Q+K
         cMq5HcMPVdPbH3EB2TGnXTiyqyonEE5JeHmdc+MrzL0fMc/TZsYuU+itDNbmxD4r2y
         zKobnW/Dnc2BGS0iGH3ZIbImDCurJ9vAc+jB5YIwU6U7OZVFgt5FfbEnhA7RMJqqN2
         Wkw7XIDKjeCsQ==
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
From:   Harry Austen <hpausten@protonmail.com>
Cc:     Harry Austen <hpausten@protonmail.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: arm: qcom: add oneplus3(t) devices
Message-ID: <20221023204505.115141-4-hpausten@protonmail.com>
In-Reply-To: <20221023204505.115141-1-hpausten@protonmail.com>
References: <20221023204505.115141-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Add compatible strings for the OnePlus 3 and 3T phones which utilise the
Qualcomm MSM8996 SoC.

Signed-off-by: Harry Austen <hpausten@protonmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v1 -> v2: add Krzysztof's Rb tag

 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml
index 207e28260206..aa441918f314 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -222,6 +222,8 @@ properties:

       - items:
           - enum:
+              - oneplus,oneplus3
+              - oneplus,oneplus3t
               - qcom,msm8996-mtp
               - sony,dora-row
               - sony,kagura-row
--
2.38.1


