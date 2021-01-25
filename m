Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D427C433DB
	for <phone-devel@archiver.kernel.org>; Mon, 25 Jan 2021 18:07:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9E412251F
	for <phone-devel@archiver.kernel.org>; Mon, 25 Jan 2021 18:07:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731059AbhAYSF6 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 25 Jan 2021 13:05:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730040AbhAYSFp (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 25 Jan 2021 13:05:45 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21137C06178A;
        Mon, 25 Jan 2021 10:05:05 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id z22so1880865edb.9;
        Mon, 25 Jan 2021 10:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IyiKAEOYledxzxbR+ZthnbqihmBjE2htQJoLrkJlok0=;
        b=JsqIb2zbObzd5rHPbe0MHe4ciTgj2hyNc2gMaW26VXEBylHsv2wmsIelmFZZbq6HRT
         KpRJojOahGyBYMlV4XYWVhhP2W2TSOO0ixu/ydpYOd1ignt3IPIyimVlgqyW4WbOABoR
         vkSMaowy6VOVrA/ePEYq4T1nJQxmT7Gp+a1dWjZ2EcUXmPgl6NwOXD/Z4yc7O+3UITcy
         cBmcUQpADyBsFOGk0gJMvK+JlzmRdYhFgtvoj34TlFMi+SA3DvcOakS/XRDlmwr/mFyW
         9qLQROM2i3e1JriSkEi3Z6CqcTfScDzUzXwV7oXw87/PPvtYaxnMLLZF2NL6ANoh6W4C
         Odzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IyiKAEOYledxzxbR+ZthnbqihmBjE2htQJoLrkJlok0=;
        b=f7/EStt8ZY5WwXT2Xy3Pmn4x2B7UgpwMd5PlRb8ZhG4wcQx8txxwVdJjko4Z81Avnl
         gEeJTuUF5HCbsLw2u1M3Wl8buR/u1W/T+c/ltmyMKLX34rI459/99wNP88uHI7scdj7d
         VVDNOca9twedf6Xqdry/TgocVsKpp4mO4TObW/xKyGePDtqe+T/+FM/vpvmqdOTXI0lh
         wwsSF1NDBumqww5qIcabZTTs6HN3UJYK3C2qltRJU5uDba+QpzDBIa9IUv19I/E5miEL
         W1iFK33dyjwT9FN8vrPu5elPBgKSCpog2iiuSbv5SdsLX2qwZPBsNPCEkDEKGjFC8FuB
         tIOg==
X-Gm-Message-State: AOAM530E7+8HdXMJZZZiSdK6nl07Grdt8N/nchfPMdjzRQKaYyYjkqKi
        3GgmrS+/i2mG/jbKovLZCJE=
X-Google-Smtp-Source: ABdhPJwbv0NPmlVzDmDXq42Wm4uCYZuby/6T6L0kLT3j4r7n222hHV3iA0pa7CS2Wpego/HWzqZ9Tw==
X-Received: by 2002:a05:6402:3589:: with SMTP id y9mr1518349edc.344.1611597903943;
        Mon, 25 Jan 2021 10:05:03 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id m20sm11815329edj.43.2021.01.25.10.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 10:05:03 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Brian Masney <masneyb@onstation.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v3 2/4] ARM: dts: qcom: msm8974-klte: add support for GPU
Date:   Mon, 25 Jan 2021 20:04:25 +0200
Message-Id: <20210125180427.3109269-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210125180427.3109269-1-iskren.chernev@gmail.com>
References: <20210125180427.3109269-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

From: Samuel Pascua <pascua.samuel.14@gmail.com>

Enable adreno and opp_table dt nodes.

Signed-off-by: Samuel Pascua <pascua.samuel.14@gmail.com>
Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index f23d1002b8f8b..5a7ac4a31031f 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -697,6 +697,14 @@ fuelgauge@36 {
 			pinctrl-0 = <&fuelgauge_pin>;
 		};
 	};
+
+	opp_table {
+		status = "ok";
+	};
+
+	adreno@fdb00000 {
+		status = "ok";
+	};
 };

 &spmi_bus {
--
2.30.0

