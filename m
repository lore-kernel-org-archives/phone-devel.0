Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D49C433E0
	for <phone-devel@archiver.kernel.org>; Thu, 14 Jan 2021 18:55:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7972823B31
	for <phone-devel@archiver.kernel.org>; Thu, 14 Jan 2021 18:55:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728958AbhANSzR (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 14 Jan 2021 13:55:17 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:26653 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728926AbhANSzQ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 14 Jan 2021 13:55:16 -0500
Date:   Thu, 14 Jan 2021 18:54:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1610650474;
        bh=ZjEeyA413RNzpU9DT+FNrhe0K3Gvid9ETDUGt0k6xos=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Fw0VtOj0lJAypnm4vm4cN5fCrZqUt2eGzGecGMmiI/h0FxOmZhZq1Tgf+qfuOTYxD
         YExL0Q2yft5OXPDYN6Y/vnVvJrUvzfK+wwa6NU2Uv33Hugz/8btUGhA/kPf5XWaO2q
         dYdfDaQ97DCFve6jUASRW9EBmhE2zfz4/DftD/sE=
To:     caleb@connolly.tech, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH v3 2/2] dt-bindings: Document bindings for new SDM845 devices
Message-ID: <20210114185227.25265-3-caleb@connolly.tech>
In-Reply-To: <20210114185227.25265-1-caleb@connolly.tech>
References: <20210114185227.25265-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Document compatible bindings for the new OnePlus 6/6T devices.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 Documentation/devicetree/bindings/arm/qcom.yaml        | 5 +++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentatio=
n/devicetree/bindings/arm/qcom.yaml
index c97d4a580f47..f3ad845754d3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -171,6 +171,11 @@ properties:
           - enum:
               - qcom,ipq6018-cp01-c1
           - const: qcom,ipq6018
+      - items:
+          - enum:
+              - oneplus,enchilada
+              - oneplus,fajita
+          - const: qcom,sdm845
=20
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Docum=
entation/devicetree/bindings/vendor-prefixes.yaml
index 041ae90b0d8f..aff440b18293 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -800,6 +800,8 @@ patternProperties:
     description: OLIMEX Ltd.
   "^olpc,.*":
     description: One Laptop Per Child
+  "^oneplus,.*":
+    description: One Plus Technology (Shenzhen) Co., Ltd.
   "^onion,.*":
     description: Onion Corporation
   "^onnn,.*":
--=20
2.29.2


