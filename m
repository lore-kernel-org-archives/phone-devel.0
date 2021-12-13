Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DE3C4332F
	for <phone-devel@archiver.kernel.org>; Mon, 13 Dec 2021 08:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbhLMI2D (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 13 Dec 2021 03:28:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232935AbhLMI1W (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 13 Dec 2021 03:27:22 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53AB3C061B38
        for <phone-devel@vger.kernel.org>; Mon, 13 Dec 2021 00:27:22 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id o20so49771981eds.10
        for <phone-devel@vger.kernel.org>; Mon, 13 Dec 2021 00:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cCXYTlbzoYt/Q28BNia8J8S+G15WMUnhTesQFEhNzfI=;
        b=Rojam3hdYP7hQgOm6VhLrHu+G8tyuNzvRMCqH8pOcqteulHTYa/0ryuQJFdxS/ARNf
         647IcWus/mIAleA2delSi8xvMNEIPaAoe6fyhAi1U/g7Xsz0CjMg8B4frlivzhalWBsP
         GcK2l70kVOUocbxB/9qV73dYKKUczSx7XUon4rgv7DMLhxRWmPCzLwUFjZvjPoarqmgt
         etTBTqpAAWP2xhwcSyNJ26QuR/tyBqFMagKxa2GsLVqpeoprUpioRcXjnVzKqVgbxbZZ
         c2fBoKBoDT/kpTi3bxk9Gj1Qho8vg39QKe29vy+6i97JkqQT4vU2TEPmmDpiY9MDWi7k
         P+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cCXYTlbzoYt/Q28BNia8J8S+G15WMUnhTesQFEhNzfI=;
        b=iIX94siG6BL1J4Gxd2zKPRWVbKHcHgQGqJ4trRIf0abgfJ6YHctOAYaVupo6UX3qGk
         Wmm5aB68fhlKDBAO61LjTjZ05j2z68Wusdy0544QKnCogV4U8a7kG3zgA6q+16rt7VGt
         2TXPVHzZlc9cBk9S436ODzKpxKkI8pDdsYRXnHUcRcXtYnFpW8adP6w0TjlKdWX29HRP
         lZwK4spAaFmGEbovDC+PGSChjrX3z0nj4bzann8QZvfdga8VW+okmGMewkI7Dpc7r2vV
         oLtpf27AORTK9/R0VRqHzWML7SC+aZOjfJJqaKebLdfsMMI5SnBA4CVcaO4xeYFY+6ar
         hwUg==
X-Gm-Message-State: AOAM530TueX5TbpWzp3UC/NaXwddwojqysv0KJgj9LDKvvb443kC50Fg
        U8EBitzsexipDN9klR3BbUOCZgStTcbXIxgsUI0=
X-Google-Smtp-Source: ABdhPJxHCYCw81OQMQ+WDW5DK6U8tfsxHYWpHXmWp7zdWdIXmEtyqZJxdLCYFxtjui6NLq3pfFRQDQ==
X-Received: by 2002:a05:6402:154:: with SMTP id s20mr65434822edu.148.1639384040946;
        Mon, 13 Dec 2021 00:27:20 -0800 (PST)
Received: from localhost.localdomain ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
        by smtp.gmail.com with ESMTPSA id b11sm6062432ede.62.2021.12.13.00.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 00:27:20 -0800 (PST)
From:   Luca Weiss <luca.weiss@fairphone.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>,
        Hans de Goede <hdegoede@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] dt-bindings: simple-framebuffer: allow standalone compatible
Date:   Mon, 13 Dec 2021 09:26:10 +0100
Message-Id: <20211213082614.22651-10-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211213082614.22651-1-luca.weiss@fairphone.com>
References: <20211213082614.22651-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Qualcomm platforms use "simple-framebuffer" without a more specific
compatible. Allow that in the binding doc.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/display/simple-framebuffer.yaml         | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index c2499a7906f5..2d82d0ce4a34 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -52,11 +52,13 @@ description: |+
 
 properties:
   compatible:
-    items:
-      - enum:
-          - apple,simple-framebuffer
-          - allwinner,simple-framebuffer
-          - amlogic,simple-framebuffer
+    oneOf:
+      - items:
+          - enum:
+              - apple,simple-framebuffer
+              - allwinner,simple-framebuffer
+              - amlogic,simple-framebuffer
+          - const: simple-framebuffer
       - const: simple-framebuffer
 
   reg:
-- 
2.34.1

