Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9E347ACFB
	for <phone-devel@vger.kernel.org>; Tue,  1 Sep 2026 09:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254463; cv=none; b=N2uEJXCGmdUgCbhE6DM10uf63CfkycFVRzZBiyMfz3j4EsQZt2OV0xAg/IVjEbRgKDsu+sTPfg8/9Yutr78nT4fP+Y+pC9q6HDGI/9vV2Z9gB9CbdMa0P05bxWVmXDg3S9xOHb/0YEEdmUWwkl1Tyb8pp0R7LzrceeHybncrx0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254463; c=relaxed/simple;
	bh=aO2eMioyOB/VcOtG8g2Q5/E7T79qL376zs9BEmEPMe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pHD3jMc4aTeUj9B1GoDOlx2aWWh9pzcOfhcvZzsQdLjG6K5LHgb0bKLnbFSWPXY09q3qfZPdh3rB/9VBTh6emNLlAQQltvoiKi+vOH06mr8FE9oNUY+CwQdjTtzOKTvDbDu9Lmxw4X3MeFNCoW6JcLx+PAOr1KTRBMlv20RyqE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zJktN61h; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zJktN61h"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c250c6a6a6eso79513766b.0
        for <phone-devel@vger.kernel.org>; Tue, 01 Sep 2026 02:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788254458; x=1788859258; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=du2ocNQni28qqCR806uGIh11ko8Tpsyo/Ip5FqU2z6w=;
        b=zJktN61h0U58NfXcn9q70izN5hre6+wjwiiLYA9ki3Ic71SyDG4xhmipQWa4gjtWEo
         jebaLKjLIwJY+NrkiIU2WmT6U1XwHDQK7RKVULObIm8NQrBNjf2744ODFGUQ0cNAqayP
         Al5LY83GEyw/eE+vOEVbXkM/gYCsKUcAdnz6sik7eC0oq2LsodKp9OzVClMvFByaMboo
         9kwh5/gZ0QJGCDOj3ANtU/ot7c9GafWEKUL/ubGJYttUx8GPZcWK2NdpOrDLiOOvgV7x
         yvRW7EXUfGifH+YObHC2lXHYoyn+UEAgYPqhjRzdF6crI2vNU2k41SDgkCIP3IpXIaqi
         hBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254458; x=1788859258;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=du2ocNQni28qqCR806uGIh11ko8Tpsyo/Ip5FqU2z6w=;
        b=sNpElMja8RZpwl5RZoE+0/6gSVxgiyCr2w6UBE8RIbJNFElKLkxnOspQYCbRE1omAD
         NnNdn3B6fFMM9kMMrjst89NWlW+DK7L8Ol7EsIBFXXO0U2ZVyOtC+qd/aZBYOjOgcJnD
         CtBI36kZc3AJbTp1VentvfcpPX05W9YW5GI1x8y3k43WxeozWHR6CkDlwTZtXe+X60zr
         qSocTQruzsywwsdPkOPES1jOfroxAgTz1QbTOfRdhQUD6eX6xwIPUbduMmsuOz9aKafc
         jcLGBEqRO5QQqzhjq85zFKbUx+3N8VX7I7aAB82Do0y0HmmNFkHn+8ToAtux+A7ZUs/I
         t7xA==
X-Forwarded-Encrypted: i=1; AHgh+RqvPm7Np9+CtOthMl9nXEiUxNNWxgPqi0SCI7St91dIEPYFZRyQ9qQbpR0tUwLwgiJ4l2NFUHk0o4vx2A==@vger.kernel.org
X-Gm-Message-State: AFuF++mH/Zp3VOi+hgQLysydwP1SiADs/iMM2CbJo0NRCf8JdCcZUm8F
	skvdqTUvVNDX2ozQMdn74GhhqUba3RY08LyA2Ha7eZJCd8kUFHKUoP+MhqjwbvR192U=
X-Gm-Gg: AR+sD114HS3B86dE5DrGUbA6VxI5USVqF81Lq9hg762jnY141x13SnnE2xnDTLDfeI0
	yNKRQskeHy69PAFBHuZbWCt9vgw9x9OC1ucvbkX2IHhIV/MOZeSUOBEXYShhYA/BB9D8Nr1dLgX
	yV1Ek64WqA5lvyhp5i1t2YPWPBbG4HJ0W1Z6cf4YdTZXsFPY6SWvLq7VCB84wSMZ65epk/H19QX
	KTrUNSzokPr6Q2EWYLs72xgu9Z33n6Rp0E4O/SaL11bZ35zgOjNO1bcoWY5uqA1OrP7vat80uV2
	ZO9pZ5iS2+evFQDqLj95yh1U6N6ajgf7+4z3QGqovgh0ujRihftP0EWXZeUyRYXSSQvCsV4GK3V
	9rpOUTTNPmcqHl/Ccl6I37PRr5LxWRpVppy0KW/UDIrEGqFwS6R9698QM0av+y+xYfz6lZ+y4GP
	QxFiaOZrbp4FrnHZLccx9ruIc1i/eN3A5fBNWRw4Hc/5AsV5Z7EqSsGfOXonWTf6x5SRccvJnx3
	jkSZ6baUplH67YIIopGUZXAFS0h9eUqi9f1qTA3f+k=
X-Received: by 2002:a17:907:60cf:b0:c16:26c7:6ba8 with SMTP id a640c23a62f3a-c2556bfba7fmr2070373766b.6.1788254458608;
        Tue, 01 Sep 2026 02:20:58 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f249468sm544122966b.56.2026.09.01.02.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:20:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 01 Sep 2026 11:20:56 +0200
Subject: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add parent supply
 for regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZORtow5TVVxEPtWYzMraSrEMZe
 3erHr/D/29grMIG52YD5VVM5qnCHxpIjzgNjHKvBnJ0csF57PMRlYcyxmVWtJLz+MZI1HXBt6k
 NBDXNyr28ftvL9W8rtyen5fuCff8AS3Yg5HgAAAA=
X-Change-ID: 20260901-fp5-regulator-supply-a2288914c492
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788254458; l=3901;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aO2eMioyOB/VcOtG8g2Q5/E7T79qL376zs9BEmEPMe0=;
 b=dqe9PVIolixAt/+8bKDii8RBAm2SBzQx4An5Hy/u5Mhmd1UmtydEG8tKvdyEyiRyliY7IJRN5
 gSpMggRi5I0BYeBi6mUWq13j1GVYKIFsjyn/jdKz0HJ4MR9xvS42WFd
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
the parent regulators can be enabled when needed.

PM7325's l3 and l5 are supplied by vreg_s2b ("ebi.lvl"), however since
that regulator is not modelled as regulator, skip the -supply
properties for those two LDOs.

And document what the "missing" regulators are used for.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index f41ad446a39e..e9bf2faf6628 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -196,6 +196,17 @@ vreg_usb_redrive_1v8: regulator-usb-redrive-1v8 {
 		pinctrl-names = "default";
 	};
 
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_vtof_ldo_2p8: regulator-vtof-ldo-2p8 {
 		compatible = "regulator-fixed";
 		regulator-name = "VTOF_LDO_2P8";
@@ -372,6 +383,18 @@ active-config0 {
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm7325-rpmh-regulators";
+
+		vdd-l1-l4-l12-l15-supply = <&vreg_s7b>;
+		vdd-l2-l7-supply = <&vreg_bob>;
+		vdd-l6-l9-l10-supply = <&vreg_s8b>;
+		vdd-l8-supply = <&vreg_s7b>;
+		vdd-l11-l17-l18-l19-supply = <&vreg_s1b>;
+		vdd-l13-supply = <&vreg_s7b>;
+		vdd-l14-l16-supply = <&vreg_s8b>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+
 		qcom,pmic-id = "b";
 
 		vreg_s1b: smps1 {
@@ -380,6 +403,12 @@ vreg_s1b: smps1 {
 			regulator-max-microvolt = <2040000>;
 		};
 
+		/*
+		 * s2b (smps2) is ebi.lvl
+		 * s3b-s4b-s5b (smps3-smps4-smps5) is VDD_APC1
+		 * s6b (smps6) is VDD_APC0
+		 */
+
 		vreg_s7b: smps7 {
 			regulator-name = "vreg_s7b";
 			regulator-min-microvolt = <535000>;
@@ -414,6 +443,11 @@ vreg_l3b: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		/*
+		 * l4b (ldo4) is lmx.lvl
+		 * l5b (ldo5) is lcx.lvl
+		 */
+
 		vreg_l6b: ldo6 {
 			regulator-name = "vreg_l6b";
 			regulator-min-microvolt = <1140000>;
@@ -443,6 +477,8 @@ vreg_l9b: ldo9 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		/* l10b (ldo10) is PMK7325 VDD_ACTIVE */
+
 		vreg_l11b: ldo11 {
 			regulator-name = "vreg_l11b";
 			regulator-min-microvolt = <1504000>;
@@ -509,6 +545,16 @@ vreg_l19b: ldo19 {
 
 	regulators-1 {
 		compatible = "qcom,pm8350c-rpmh-regulators";
+
+		vdd-bob-supply = <&vph_pwr>;
+		vdd-l1-l12-supply = <&vreg_s1b>;
+		vdd-l2-l8-supply = <&vreg_s1b>;
+		vdd-l3-l4-l5-l7-l13-supply = <&vreg_bob>;
+		vdd-l6-l9-l11-supply = <&vreg_bob>;
+		vdd-l10-supply = <&vreg_s7b>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+
 		qcom,pmic-id = "c";
 
 		vreg_s1c: smps1 {
@@ -518,6 +564,12 @@ vreg_s1c: smps1 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		/*
+		 * s2c-s3c-s4c (smps2-smps3-smps4) is cx.lvl
+		 * s5c-s6c (smps5-smps6) is mss.lvl
+		 * s7c-s8c (smps7-smps8) is gfx.lvl
+		 */
+
 		vreg_s9c: smps9 {
 			regulator-name = "vreg_s9c";
 			regulator-min-microvolt = <1010000>;
@@ -525,6 +577,8 @@ vreg_s9c: smps9 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		/* s10c (smps10) is mx.lvl */
+
 		vreg_l1c: ldo1 {
 			regulator-name = "vreg_l1c";
 			regulator-min-microvolt = <1800000>;

---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-fp5-regulator-supply-a2288914c492

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>

