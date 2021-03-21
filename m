Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B98FC433E2
	for <phone-devel@archiver.kernel.org>; Sun, 21 Mar 2021 17:47:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3E7C61952
	for <phone-devel@archiver.kernel.org>; Sun, 21 Mar 2021 17:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbhCURrA (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 21 Mar 2021 13:47:00 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:34395 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbhCURqh (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 21 Mar 2021 13:46:37 -0400
Date:   Sun, 21 Mar 2021 17:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1616348796;
        bh=dXeSBw1LUxqYgI2VXBLKnIR9qi2RE4oYa/g+20vEYF8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=c51B0iHB4MW4WThTKwu19MoVyaNK9EKBv9asxeQPuldWH6QMINwtBVvzmuRR9O1Gi
         5a5MD4BGX++dLF4CY6ah/kDNZTRyrd/APUByTfzvSaylWzxJFIU67ZdI1BT6bcpxpK
         yt+7m9ZSYb/JDkQS5xEuVXII7+0V4bH/koV2UeR8=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v2 3/3] dt-bindings: qcom: geni-se: document iommus
Message-ID: <20210321174522.123036-4-caleb@connolly.tech>
In-Reply-To: <20210321174522.123036-1-caleb@connolly.tech>
References: <20210321174522.123036-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document the iommus property for QCOM Geni SE.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml b=
/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
index 84671950ca0d..68c4ee55ae7d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
@@ -51,6 +51,9 @@ properties:
   interconnect-names:
     const: qup-core
=20
+  iommus:
+    description: the iommu and adress to be used to configure DMA for larg=
e transfers.
+
 required:
   - compatible
   - reg
--=20
2.30.2


