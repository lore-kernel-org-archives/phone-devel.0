Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB95C56202
	for <phone-devel@archiver.kernel.org>; Thu, 12 Nov 2020 16:22:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F8C52100A
	for <phone-devel@archiver.kernel.org>; Thu, 12 Nov 2020 16:22:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech header.b="rBVw6ZUC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbgKLQWK (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 12 Nov 2020 11:22:10 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:52604 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729039AbgKLQWJ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 12 Nov 2020 11:22:09 -0500
Date:   Thu, 12 Nov 2020 16:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1605198122;
        bh=60QH1a+TVI08YpXeGzWDO0EvkYdD3qR8q/SmQcupZCA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=rBVw6ZUC524rPW0k3tzwgkedXqW5UWXoUp6w8mDYe5w89UIrj7TK7Dm/NShiSMM9Q
         NFrxy2mBW2kQqu/q4xZIjtm5efSyscE0wiDlaynbeZAJO0SDQ1fHG/63xD4F2K4V1J
         0rdIpT6Od8xgOvweuWOhJkFtojyk4MgHnq/qlnn4=
To:     linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Caleb Connolly <caleb@connolly.tech>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 4/5] dt-bindings: add vendor bindings for OnePlus
Message-ID: <20201112161920.2671430-5-caleb@connolly.tech>
In-Reply-To: <20201112161920.2671430-1-caleb@connolly.tech>
References: <20201112161920.2671430-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Used by the OnePlus 6/T device trees

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 .../bindings/arm/oneplus/oneplus-boards.yaml  | 25 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 2 files changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/oneplus/oneplus-b=
oards.yaml

diff --git a/Documentation/devicetree/bindings/arm/oneplus/oneplus-boards.y=
aml b/Documentation/devicetree/bindings/arm/oneplus/oneplus-boards.yaml
new file mode 100644
index 000000000000..a4d9bbd5681f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/oneplus/oneplus-boards.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/oneplus/oneplus-boards.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OnePlus based boards
+
+maintainers:
+  - Caleb Connolly <caleb@connolly.tech>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: SDM845 based boards
+        items:
+          - enum:
+              - oneplus,enchilada               # OnePlus 6
+              - oneplus,fajita                  # OnePlus 6T
+          - const: oneplus,oneplus6             # OnePlus 6 and derivative=
s
+
+required:
+  - compatible
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Docum=
entation/devicetree/bindings/vendor-prefixes.yaml
index 2735be1a8470..372c1136081e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -768,6 +768,8 @@ patternProperties:
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


