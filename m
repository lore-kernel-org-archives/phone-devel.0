Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBEDC54E76
	for <phone-devel@archiver.kernel.org>; Fri, 30 Dec 2022 07:44:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234599AbiL3Hnh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 30 Dec 2022 02:43:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234748AbiL3Hmr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 30 Dec 2022 02:42:47 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245121A23D
        for <phone-devel@vger.kernel.org>; Thu, 29 Dec 2022 23:42:30 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id d4so11243550wrw.6
        for <phone-devel@vger.kernel.org>; Thu, 29 Dec 2022 23:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a9KZvHtdorqf0E3UCE3FjyDYt+OjcwxTa7RCQl2CLMo=;
        b=NWSkRKoXBESiB/nZagBfRLuPFsG5gMXGXnMO6T5e2BvIsYXh8o7eX3R64FKiyGv28r
         Y7G3nE8cW72SQqUGd2NDbxfl0m0MoB8urwcPqSRdELxgCyEVRn9HpQoy2AynY858fUG5
         ciyvAkHULwuZEWhgo2R0OkF9kNZJJWV3349m9Sz4f7a1+9PXBMjV1Vc5w2ArQGBJXNTe
         61vXHo6Swb9wX8A7o3OsYta9yYAKo7D+nNYsOWByYVZBwt9HbHiCwpHVkxgcX7RQQc5a
         zb6HFFGuNF8Eyd4kLf+4FqheIkbwR8f3IfkvNleDxCrdaKBEUXeuK2QoyudmHlvv89oI
         bEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9KZvHtdorqf0E3UCE3FjyDYt+OjcwxTa7RCQl2CLMo=;
        b=oUdYQ3YRigHTUOfv0BwtmbOL+3kAKaDE3aL1zqnvV6aK+25GqyIFiD7Pu9UuycJXQu
         GFeBEzgbCxwQegQohtQWM06YxAw5OEY9g2nYQLrEQQ50juVRhig0KbK+Q4whWDxpA4kA
         0hHH5xfI/1mj+H+eJmP/sw7Thf+FdEQRvq7yoSwy7xGQsHCAJ5qyvBr5VsVllepFYBgC
         CIBJmfTTIZacWKmweV6tBmqqLBrR192ghRVSX7HJRQMJTltZIMMhz3yfF08FC36otS4h
         5aCF0QCuf67JZ05bEflQVBKWU1R9FYQhUKUUzNKmoVYErzA6Fct85PeF3VKNi4TQAyw+
         in4g==
X-Gm-Message-State: AFqh2kol0W08OQRJq4u3Ai7dcrhfNnBuczxVORU2w5hIUVGi5Jcndaqz
        XNQi3X3gLtV4birlZHRmlm75lQ==
X-Google-Smtp-Source: AMrXdXvzvlboLEA512IiSe7z5KkCx4WoIHDQBkvbpJnMDjX9lWKZOjUCqTmFrx87ITkrljpO4hKKjg==
X-Received: by 2002:adf:dd48:0:b0:242:70f0:9196 with SMTP id u8-20020adfdd48000000b0024270f09196mr20350631wrm.45.1672386148758;
        Thu, 29 Dec 2022 23:42:28 -0800 (PST)
Received: from [192.168.0.28] (2a02-8388-6582-fe80-0000-0000-0000-0007.cable.dynamic.v6.surfer.at. [2a02:8388:6582:fe80::7])
        by smtp.gmail.com with ESMTPSA id a6-20020adfed06000000b0028e8693bb75sm1887655wro.63.2022.12.29.23.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 23:42:28 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 30 Dec 2022 08:42:06 +0100
Subject: [PATCH v2 2/3] dt-bindings: ufs: qcom: Add reg-names property for ICE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221209-dt-binding-ufs-v2-2-dc7a04699579@fairphone.com>
References: <20221209-dt-binding-ufs-v2-0-dc7a04699579@fairphone.com>
In-Reply-To: <20221209-dt-binding-ufs-v2-0-dc7a04699579@fairphone.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Iskren Chernev <me@iskren.info>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.11.0
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The code in ufs-qcom-ice.c needs the ICE reg to be named "ice". Add this
in the bindings so the existing dts can validate successfully.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index b517d76215e3..a8d896e1617b 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -72,6 +72,10 @@ properties:
     minItems: 1
     maxItems: 2
 
+  reg-names:
+    minItems: 1
+    maxItems: 2
+
   resets:
     maxItems: 1
 
@@ -122,6 +126,8 @@ allOf:
         reg:
           minItems: 1
           maxItems: 1
+        reg-names:
+          maxItems: 1
 
   - if:
       properties:
@@ -150,6 +156,12 @@ allOf:
         reg:
           minItems: 2
           maxItems: 2
+        reg-names:
+          items:
+            - const: std
+            - const: ice
+      required:
+        - reg-names
 
   - if:
       properties:
@@ -178,6 +190,8 @@ allOf:
         reg:
           minItems: 1
           maxItems: 1
+        reg-names:
+          maxItems: 1
 
   - if:
       properties:
@@ -203,6 +217,12 @@ allOf:
         reg:
           minItems: 2
           maxItems: 2
+        reg-names:
+          items:
+            - const: std
+            - const: ice
+      required:
+        - reg-names
 
     # TODO: define clock bindings for qcom,msm8994-ufshc
 

-- 
2.39.0
