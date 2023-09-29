Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94702E732D0
	for <phone-devel@archiver.kernel.org>; Fri, 29 Sep 2023 09:53:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232875AbjI2JxK (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 29 Sep 2023 05:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232746AbjI2JxJ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 29 Sep 2023 05:53:09 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB1A1A4
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 02:53:06 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5347e657a11so7048991a12.2
        for <phone-devel@vger.kernel.org>; Fri, 29 Sep 2023 02:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1695981185; x=1696585985; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zcabyV/ntBQljUCLvUhOeWEh6aipQODXnykgj24wk+U=;
        b=f5AzrhcWu8q2UPT/JgsQlNgE+QNKroGP/TNlZRRC0LWovDx+xhf6Fu7L5mFUou0fWH
         t4eq72dUMhLN/t2uCv8mTQTTNGWN1I209Gdw7LGAUiNHnocz4rSVxro5kV4g4Sm9oTS/
         hcl14VHz/gFWKz6TFLTpl6jQpr9cvOIzXp9WiXV6iJb2SY2iDbBZyO7akIaYlNr4AHUR
         vZptdOUeH/cdOc4fTVIwb4W7Zqb9d1uaqpL0YQpT627rEmg3mNUY+AfYezZmhYGv/l1+
         kB9GsdoR7/New9AGDQkzVeba8Ie+oZ3DxWvH2F5sEZNv6yEiIEqCrBBWZg9pVMKts0pG
         /DYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695981185; x=1696585985;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zcabyV/ntBQljUCLvUhOeWEh6aipQODXnykgj24wk+U=;
        b=isWww8HU2DJYSQu+S8iCuK+s7Ac8ucLirGFAmqABAH8XKtWVj7a/dG63nbR5vz0U4M
         FZydVxPjQy6uIF16r2GbwsI8iWLzLA9G0JstNI50C26YcbmN7Gy572PQmGijdL2Qw0dS
         V75yNvthLYm7AZYvaWAxSsHLe+2jFulF99RstSrfEPvKgtVdb2R5nO6elE2/AZ5oGzdH
         RUFHXfQu0YyqTYbCnUn7JzYsHhmbeuDy/t9XI8QEYXOdwA5URXCcCukdwYoZEdGjYf0L
         8MBWQ0NBwOoPspjdJmeLhTIaInCK3jTRBCevXWJ69Y6xlQS98Ja0SCP+osJCE9i4NSRI
         PbTQ==
X-Gm-Message-State: AOJu0Yz/LyJBHrUgTM8VieWqBZhzpVBVuIUpqlqy7ira8BQx6zC/vnBb
        bjdCOyeRCU6EcxPmnzyTsLUH6g==
X-Google-Smtp-Source: AGHT+IEABpRwvS+iiXrZW7y7gBe7i8X3Nre76cQ+E3KUWZskMC/wFMBqv3YxleUQNJrF7fpO/K9THg==
X-Received: by 2002:a05:6402:14cb:b0:533:c55f:582a with SMTP id f11-20020a05640214cb00b00533c55f582amr3132986edx.27.1695981184900;
        Fri, 29 Sep 2023 02:53:04 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id cy23-20020a0564021c9700b005362c9905b2sm1967034edb.35.2023.09.29.02.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 02:53:04 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 29 Sep 2023 11:52:59 +0200
Subject: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable UFS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230929-fp5-ufs-v1-1-122941e28b06@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAHqeFmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDSyNL3bQCU93StGLdVKNkg1Qjw0QDQxMjJaDqgqLUtMwKsEnRsbW1AA7
 SNQRZAAAA
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Enable the UFS phy and controller so that we can access the internal
storage of the phone.

At the same time we need to bump the minimum voltage used for UFS VCC,
otherwise it doesn't initialize properly. The new range is taken from
the vcc-voltage-level property downstream.

See also the following link for more information about the VCCQ/VCCQ2:
https://gerrit-public.fairphone.software/plugins/gitiles/kernel/msm-extra/devicetree/+/1590a3739e7dc29d2597307881553236d492f188/fp5/yupik-idp-pm7250b.dtsi#207

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
I'm not 100% convinced about the regulator range change. For sure with
the original voltage range the UFS fails to initialize, but looking at
downstream kernel during runtime (debugfs) we see the VCC voltage
switches between 2.4V (idle?) and 2.952V (active?). But even with this
change in mainline the regulator would always stay at 2.504V which is
for sure lower than the downstream operating voltage of 2.952V. Behavior
wise I don't see a difference between ~2.5V and ~2.9V.

Should I just constrain the regulator here to min=max=2.952V? Or just
say it's okay as-is?

Depends on: https://lore.kernel.org/linux-arm-msm/20230927081858.15961-1-quic_nitirawa@quicinc.com/
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 27 ++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 2de0b8c26c35..fea7639fc0bc 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -182,8 +182,9 @@ vreg_l6b: ldo6 {
 		};
 
 		vreg_l7b: ldo7 {
-			regulator-min-microvolt = <2400000>;
-			regulator-max-microvolt = <3544000>;
+			/* Constrained for UFS VCC */
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2952000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
@@ -632,6 +633,28 @@ bluetooth: bluetooth {
 	};
 };
 
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l7b>;
+	vcc-max-microamp = <800000>;
+	/*
+	 * Technically l9b enables an eLDO (supplied by s1b) which then powers
+	 * VCCQ2 of the UFS.
+	 */
+	vccq-supply = <&vreg_l9b>;
+	vccq-max-microamp = <900000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l10c>;
+	vdda-pll-supply = <&vreg_l6b>;
+
+	status = "okay";
+};
+
 &usb_1 {
 	status = "okay";
 };

---
base-commit: d85348daa4407216e47198ed35a43a66883edab6
change-id: 20230929-fp5-ufs-e2c0e21a0142

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

