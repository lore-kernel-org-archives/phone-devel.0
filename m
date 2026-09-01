Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984B9476074
	for <phone-devel@vger.kernel.org>; Tue,  1 Sep 2026 08:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253147; cv=none; b=Suu3uQmB4gFRsF/NaYtFjqf7AVJvO00OJtJLmgBfsnUsiLgiQHa7tIHJrJk7tevHYTZdrkmsUyvG2bnDbP+F68bqKYBFd0BU7ZBRRnKu88V8RVMS1Cc2AgFsGHPLNkGXyvDruVcTFK+584nA/ZPE+E86zerux1PbFJ5hwi7cY2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253147; c=relaxed/simple;
	bh=cxRbQRwKnK9/jN0RVUhydNE5RjUtDPC2KVGVanJYEHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oVnDdv/cOR+u6Ul+K1tLWWCJHOLjBoplqzjb26jz2AxwoQxeGNXJqo70sj4bS0JvAiEZDCIMUNhSMPESwxCkx25AZ9ROagenyt2gCetCz/Jic7koPP4oz66j85PCPvFguGcmU2K0oaNh8Vk+4zqfbNQSGAD2U/r7z1pBdvo72mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tAOxVCfI; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tAOxVCfI"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1677c91969so434155066b.1
        for <phone-devel@vger.kernel.org>; Tue, 01 Sep 2026 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1788253143; x=1788857943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJfVt2Jl27L2tiMuCND1n2ucXQNUUhn5LjDWnJ+oCwo=;
        b=tAOxVCfIIacMpbdLqyMCkJBTjKLT+k/kcOd3c/LwwlyIfcUPaoCAx5G0EWzPatS6Mq
         i/TDOoD4jo5ZwK/n+8P3h89trVSVPdumjufsx4qfH+WHx/2EDUQfkqPxT2JgTryqFrTs
         LJvZpPo9c7SE8PIOeMLUpAVCYqAz8AdSkdemFoq25lHJB7KbV1CQa4rIgVJEtkacfRCd
         RxPbzrZvv+IxTczekii38xqm9AuIXcFWXz/i4J4NmUC2sU/eGvOfLFX/8KaqckkNrYgt
         tiZWj4WXuejnY/Xk70GTaYbioSuaCict6lHxRTk7oWhyW31An7kxrHHQq0eLzOC/MDMP
         aWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253143; x=1788857943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJfVt2Jl27L2tiMuCND1n2ucXQNUUhn5LjDWnJ+oCwo=;
        b=Xa1nOFdamVFBQwwtSIG7ZRAMrX0FMc1TXlZHEcVSyU8zAvrdElV7nv2Gjj9ZGEgDUD
         JMwD4uOlUR4IW/21ahe9rtUtXI2RmPTvhKwS6TK7LZAJzZJjHPO14+IcjEcPzhOLIcke
         JTfsbJ5+lz7MlC7hq8s93C1F3BAZeOswy3OR4nFo//trz6cuGxmDJo4mnF6AYWozns1o
         FuJxFOdbn+/OkDOBTauwmmYNx1VMY6bTdGBkgR98Qx1H5kbzyANeASk6879pLRWXiMZA
         /OXxBXQMvmlIMJpB3/6jbbk+jlJFiBIuCzMHgu75O27Iq6CiLou4uDqFe4va8JwzcvUk
         4/hA==
X-Forwarded-Encrypted: i=1; AHgh+Rr54ZJygSG9DeiSmz696OZff9BSHKmoNAC9opqkG/tAVAiWcdUqOUFPS1fdhjFW/ncQZiYqPwNyKOI06A==@vger.kernel.org
X-Gm-Message-State: AFuF++nJM3c+GeZoam0bWwQfkNhZSYF3R9nn4auCuEMBw9WgtavVems7
	TXn9ulZlGW9edcvyToArGgdS/vIC4Sg/1CbLSRcYBsY5Ldfm4Yi8HQzHpL0C9AneThw=
X-Gm-Gg: AR+sD12Tbq9r/C57G7UmjgcmfQxlF28LxXDMtAZsaCF/C0EXSMnkrALV8nd7BFS7DrS
	VuZHx9jW/hI2FcLOwXLl16nzg14BNHThm2vIjAYEo9t0GJ0cGIrW1FsIPdnJUhljZzXXm9hig6Q
	crRGmDNvfC2JMZewKWnJY2zdZnzvUIOuhptwGf1ifisPhOALB9xnHL7PYKDpn/BVCBgqtZR2cye
	vNMufXz6hG86Kct6Mc5k+9aygEKMs/GdeMHTvTh0/FNfrJYmbbiuTKUb83iACrPRv6VyRTNqUqb
	srGCiKwUMfpnMlzk5AmQbhKff8zNDfix1dYqGJzzfCHzJR8wVF2XHc93vxi24NE1Mqt9qaArpFw
	jyq76XY/sAcgsVde7yP0l/SUIwLhaT7D6mSLDS6vByzL/e7Bj+HS+yro1yQoeme95Lnd+vnxYvc
	F1g/wCse9Gz42lALA2WvW5xu/tbw11JzxvBHFEmCXEzagjeHI2tyMl8cTS+R2vdtZz26bxfLoV6
	/iJocxzxhzz2OaABCOOcAu9a3gREnkcutpAAXtz0ZFJ/bbgEbRcOA==
X-Received: by 2002:a05:6938:a086:10b0:c25:b597:60bc with SMTP id a640c23a62f3a-c25b5976156mr270055566b.23.1788253143571;
        Tue, 01 Sep 2026 01:59:03 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2564e314a1sm511942566b.42.2026.09.01.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:59:03 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 01 Sep 2026 10:58:59 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add parent
 supply for regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-fp4-regulator-supply-v1-4-68288ab70aee@fairphone.com>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
In-Reply-To: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788253139; l=3168;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=cxRbQRwKnK9/jN0RVUhydNE5RjUtDPC2KVGVanJYEHg=;
 b=XstesESLNKNENI2TMjsB707Xn9JsLhAz+bicy9qI3/avgdac2Y0bfOhZl7UwcuzI48QOO4jPC
 zQ0bbq5ix2aDxGmeLu6TtRf9wsTtQ1NY1OIcW/bo9Kq/awJTzxBFD4c
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
the parent regulators can be enabled when needed.

The regulators s4a and s6a are a bit special. They feed back into
PM6350, but are not modelled as regulators (or anything else?), so they
also can't be added as vdd-*-supply. It would seem to be possible to add
them with their "Default on booting voltage" from the PM6350 Data Sheet
in the dts, but I'm not sure this is desired.

And document what the "missing" regulators are used for.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 46 +++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 5d20ad93b0c5..a1556d802a8b 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -78,6 +78,17 @@ lcdb_dummy: regulator-lcdb-dummy {
 		regulator-max-microvolt = <5500000>;
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
 	reserved-memory {
 		/*
 		 * The rmtfs memory region in downstream is 'dynamically allocated'
@@ -296,6 +307,15 @@ &adsp {
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm6350-rpmh-regulators";
+
+		vdd-l2-l5-l7-supply = <&vreg_s2a>;
+		vdd-l3-l6-l8-l9-l10-supply = <&vreg_bob>;
+		vdd-l11-supply = <&vreg_s2a>;
+		vdd-l12-l14-supply = <&vreg_s2a>;
+		vdd-l15-l19-l22-supply = <&vreg_s8e>;
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+
 		qcom,pmic-id = "a";
 
 		vreg_s1a: smps1 {
@@ -310,6 +330,14 @@ vreg_s2a: smps2 {
 			regulator-max-microvolt = <2048000>;
 		};
 
+		/*
+		 * s3a (smps3) is gfx.lvl
+		 * s4a (smps4) is supply for vdd-l4 & vdd-l13
+		 * s5a (smps5) is mx.lvl
+		 * s6a (smps6) is supply for vdd-l16 & vdd-l18-l20-l21
+		 * l1a (ldo1) is lcx.lvl
+		 */
+
 		vreg_l2a: ldo2 {
 			regulator-name = "vreg_l2a";
 			regulator-min-microvolt = <1503000>;
@@ -408,6 +436,8 @@ vreg_l16a: ldo16 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		/* l17a (ldo17) is lmx.lvl */
+
 		vreg_l18a: ldo18 {
 			regulator-name = "vreg_l18a";
 			regulator-min-microvolt = <788000>;
@@ -446,8 +476,24 @@ vreg_l22a: ldo22 {
 
 	regulators-1 {
 		compatible = "qcom,pm6150l-rpmh-regulators";
+
+		vdd-bob-supply = <&vph_pwr>;
+		vdd-l1-l8-supply = <&vreg_s2a>;
+		vdd-l2-l3-supply = <&vreg_s8e>;
+		vdd-l4-l5-l6-supply = <&vreg_bob>;
+		vdd-l7-l11-supply = <&vreg_bob>;
+		vdd-l9-l10-supply = <&vreg_bob>;
+		vdd-s8-supply = <&vph_pwr>;
+
 		qcom,pmic-id = "e";
 
+		/*
+		 * s1e-s2e (smps1-smps2) is cx.lvl
+		 * s3e-s4e (smps3-smps4) is VDD_APC1
+		 * s5e (smps5) is VDD_APC0
+		 * s6e-s7e (smps6-smps7) is mss.lvl
+		 */
+
 		vreg_s8e: smps8 {
 			regulator-name = "vreg_s8e";
 			regulator-min-microvolt = <313000>;

-- 
2.55.0

