Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE909E784AD
	for <phone-devel@archiver.kernel.org>; Mon,  2 Oct 2023 14:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237617AbjJBOAU (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 2 Oct 2023 10:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237610AbjJBOAU (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 2 Oct 2023 10:00:20 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE7BB8
        for <phone-devel@vger.kernel.org>; Mon,  2 Oct 2023 07:00:16 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so21667780a12.0
        for <phone-devel@vger.kernel.org>; Mon, 02 Oct 2023 07:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1696255215; x=1696860015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHDvd7zBG9q3cQ18ekHgB5reLeuG+/B7KcSObggrkM4=;
        b=nufDdYmBcWVroR8Q1DIf+YtKnVhhivgaFyIXPqBmmbLkoDP8CGq5roitSrUYuM0OUQ
         XAGuCTmhjRPNE/1h4csUuMi6TRfgNxoGH/55wMFEezucepiDKNE00Kc89X4uX+qt4cnG
         hTlXZBAAfOIiJdkweZTKvoQlX8i7EqJibI9IzvnHjxyWZm0047SDBGtE5hp/iQhFPBxL
         MnPYJRvfdu+MQMLiZRrb3/IGxT0gEv9hDBuDjDBQLdCu+Qm04cMNbiE+1qV/iOs+30HQ
         LoqLNqDaGcgYfSSlEK4kTW5svnhBemJBpU7tDWKBwB4sEt2bpNH0QRxrdpQ8lHqqPuMT
         rqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696255215; x=1696860015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHDvd7zBG9q3cQ18ekHgB5reLeuG+/B7KcSObggrkM4=;
        b=MBefr89uFmzs+f64zBrxMdvupdkqdbOVxKdnvnmlgNE7/9zO26EYrt8lc1jYBomDcP
         K4gd9MywX4Gbj2jRV++VQpecGOjHQCyoCbcWX2p9xFpFa9vWLvAW9N+XKFP+9NiT17+C
         AVKUJivcdbM4ijw35mQ5w1HMkCS0kKBRFnst82HnsRuDiuhY/fwMHamcy9/eI7D3Ov6O
         F9bqnBTy/7Pg3SqbXUNscXs1h+ri+mj+biXROhm8UGsnRS8Fylw4V8N+hv9+ihc//Djw
         P0ZYX1NaGcRHj0AKb6eQuw0QnU47f77os96L9By8Z5NJBwGpmk56w3pIxK2bz6aocu4Y
         i2wQ==
X-Gm-Message-State: AOJu0Yz7QfpsYZh0bH/NtXNsCfRdyxPF37aWVA9F0u/Guq6QldofzFTc
        WGujAnW5f79EFQ/CPgZpeuPnSQ==
X-Google-Smtp-Source: AGHT+IEqousXbP5TTb7EJHs1BpXBUU8/Elaw2Sux5vGT5VflP/hLFD6ub63JjLQUdQbLqXFQKsz1/Q==
X-Received: by 2002:a05:6402:160b:b0:531:3e89:1bef with SMTP id f11-20020a056402160b00b005313e891befmr10451516edv.32.1696255215247;
        Mon, 02 Oct 2023 07:00:15 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id q13-20020a056402518d00b005346925a474sm9350377edd.43.2023.10.02.07.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 07:00:14 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Mon, 02 Oct 2023 16:00:11 +0200
Subject: [PATCH v2 1/2] ASoC: dt-bindings: awinic,aw88395: Remove
 reset-gpios from AW88261
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231002-aw88261-reset-v2-1-837cb1e7b95c@fairphone.com>
References: <20231002-aw88261-reset-v2-0-837cb1e7b95c@fairphone.com>
In-Reply-To: <20231002-aw88261-reset-v2-0-837cb1e7b95c@fairphone.com>
To:     Weidong Wang <wangweidong.a@awinic.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

The AW88261 chip doesn't have a reset GPIO, so disallow providing
reset-gpios.

At the same time also don't keep reset-gpios required for AW88395. This
is both because the Linux driver has it optional, and it also simplifies
the bindings by not introducing another conditional.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/sound/awinic,aw88395.yaml        | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
index b977d3de87cb..5d5ebc72b721 100644
--- a/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
+++ b/Documentation/devicetree/bindings/sound/awinic,aw88395.yaml
@@ -14,9 +14,6 @@ description:
   digital Smart K audio amplifier with an integrated 10.25V
   smart boost convert.
 
-allOf:
-  - $ref: dai-common.yaml#
-
 properties:
   compatible:
     enum:
@@ -49,9 +46,20 @@ required:
   - compatible
   - reg
   - '#sound-dai-cells'
-  - reset-gpios
   - awinic,audio-channel
 
+allOf:
+  - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - awinic,aw88261
+    then:
+      properties:
+        reset-gpios: false
+
 unevaluatedProperties: false
 
 examples:

-- 
2.42.0

