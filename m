Return-Path: <SRS0=mJHj=DD=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960D5C4727E
	for <phone-devel@archiver.kernel.org>; Sat, 26 Sep 2020 12:56:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 621F820BED
	for <phone-devel@archiver.kernel.org>; Sat, 26 Sep 2020 12:56:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHIJyohz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729487AbgIZM4U (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 26 Sep 2020 08:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgIZM4N (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 26 Sep 2020 08:56:13 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3CCC0613D4;
        Sat, 26 Sep 2020 05:56:12 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id s13so1927048wmh.4;
        Sat, 26 Sep 2020 05:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pYObQ/2gJ7K9tSHSm5lbOuv027cbv+9FVqTnbwYvt7k=;
        b=ZHIJyohzJ3LZJsfoOea+vGxLqZVKtS++Eg8tjeK1wsbBQ+2shvm5cdlRO1fG7545PQ
         Cp+2fcVDyvilT5yj7hlwBxU91ATy+9YxnT7nqAcgdb68HkrNpWXtNZIwlPnNx3X9uwBC
         cNPXz5HL7nRBehefBNobijiKTneoOxWc1NB7gKvM+s3sMzQtnMoN/uSFhsBhKoXcO5Xn
         tSqPgq6iodUZiP0isbKUM73hWbQ41iA95QZf9i0k3EKIDwgDsfh0pCtYLHgwnpHfsAd+
         dJwyNreS30Y90CMmsiij71p5z575tyOnqIzPkmPJIkopwFMguVdN6+bOTFQEmNeP5HHF
         yHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pYObQ/2gJ7K9tSHSm5lbOuv027cbv+9FVqTnbwYvt7k=;
        b=edye2GeibEunCaCEc25df9YEWUE8LLdfj+BAaO7SRvfcpLEKRZcvT8L7ajKGSZ5pFb
         i9VnDsJZHxH0taBah06GuaoeZyB+DYju19R87R2gWCF3bKTGsZUYmk1FZ0AlYjDY+b8/
         Ktb8ufrpedv7mRMDxzZ+FWZkbElcdAYkJ/bNlLER+1o4TH+HMcWpkMYFePqNRi/Qbz2U
         KnmumZJF568+A0bpFb/wHWW5FcvAsLAcsP05fFm9kJOXqDUeyVQpdHbmtiCe4mtnUpvK
         Z6wC2WjQ9P8hqTDVmlRsOiwUs1rHW9RJ85w7NSDy4lSC0BiBe0eX5woPumNI9XZlfHkk
         JgHA==
X-Gm-Message-State: AOAM532jqU0dyFTrZ4Woc3zZ72vJ8e/x3vBJTzzLWCm1hpF2WDjXw9Bn
        +LKCEjkmH0bZly/fdK6Zfik=
X-Google-Smtp-Source: ABdhPJyxbftpA9/QaqlgFktKlDArp5kHmsmaQ77mGWNtrS/OFHyupeRppD7j+5w1Yerzsxxqiz70yA==
X-Received: by 2002:a1c:a444:: with SMTP id n65mr2527954wme.122.1601124971365;
        Sat, 26 Sep 2020 05:56:11 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id h1sm6503024wrx.33.2020.09.26.05.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:56:10 -0700 (PDT)
From:   kholk11@gmail.com
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, kholk11@gmail.com, marijns95@gmail.com,
        konradybcio@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] regulator: dt-bindings: Document the PM660/660L SPMI PMIC entries
Date:   Sat, 26 Sep 2020 14:55:46 +0200
Message-Id: <20200926125549.13191-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125549.13191-1-kholk11@gmail.com>
References: <20200926125549.13191-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The PM660 and PM660L combo is found on boards featuring the
SDM630, SDM636, SDM660 (and SDA variants) and it is used to
give power to practically everything, from core to peripherals.
Document the SPMI regulator bindings for both.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../regulator/qcom,spmi-regulator.txt         | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
index 8b005192f6e8..2b544059e029 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
@@ -12,6 +12,8 @@ Qualcomm SPMI Regulators
 			"qcom,pm8950-regulators"
 			"qcom,pm8994-regulators"
 			"qcom,pmi8994-regulators"
+			"qcom,pm660-regulators"
+			"qcom,pm660l-regulators"
 			"qcom,pms405-regulators"
 
 - interrupts:
@@ -134,6 +136,35 @@ Qualcomm SPMI Regulators
 	Definition: Reference to regulator supplying the input pin, as
 		    described in the data sheet.
 
+- vdd_l1_l6_l7-supply:
+- vdd_l2_l3-supply:
+- vdd_l5-supply:
+- vdd_l8_l9_l10_l11_l12_l13_l14-supply:
+- vdd_l15_l16_l17_l18_l19-supply:
+- vdd_s1-supply:
+- vdd_s2-supply:
+- vdd_s3-supply:
+- vdd_s5-supply:
+- vdd_s6-supply:
+	Usage: optional (pm660 only)
+	Value type: <phandle>
+	Definition: Reference to regulator supplying the input pin, as
+		    described in the data sheet.
+
+- vdd_l1_l9_l10-supply:
+- vdd_l2-supply:
+- vdd_l3_l5_l7_l8-supply:
+- vdd_l4_l6-supply:
+- vdd_s1-supply:
+- vdd_s2-supply:
+- vdd_s3-supply:
+- vdd_s4-supply:
+- vdd_s5-supply:
+	Usage: optional (pm660l only)
+	Value type: <phandle>
+	Definition: Reference to regulator supplying the input pin, as
+		    described in the data sheet.
+
 - vdd_l1_l2-supply:
 - vdd_l3_l8-supply:
 - vdd_l4-supply:
-- 
2.28.0

