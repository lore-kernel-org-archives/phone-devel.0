Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0513B5B8
	for <phone-devel@vger.kernel.org>; Tue, 18 Jun 2024 13:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717471; cv=none; b=s4O9YMS0WZMV8Nh3b2MnmOZNKoOWNCsGubWc4HsNvdD4WlPG9mIZ0ZvGPv4atas/AfoPEzSQDg5u7+2MFdx42XjsLZ5J5ca/ygFOHotoJCTn1N41d0drdg2pTVqO/4lgJ+wapT8Jky90rgIZxXBeLplGIigOMWx0liq4Rt/9ygs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717471; c=relaxed/simple;
	bh=cxdO/CBDU729Yf5ACjB9FoIQHBrEtFFHA1h0G3YIxco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3CD/BD2q2xsg5ugiwsmcALMcpxq7nTJQ99YyuxYK4kAdeD1N2A5Vel2qCQJwYunqPQZWQsNYyflXoRAaabSTctFWiCqmXwZXwszCLAUbBKH4RXnQPN90buA1Sth0mz58t1FsJXhpiBA8s0WU1THZmrgVQ7/6dSCJkJUd8G0Pcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IOROi1mJ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IOROi1mJ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57a1fe6392eso7303249a12.0
        for <phone-devel@vger.kernel.org>; Tue, 18 Jun 2024 06:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1718717467; x=1719322267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJIvSltK61hZcLnfuXyJJYAaIgQQrrXExiMwUA91MUA=;
        b=IOROi1mJc6Zs5SXKFccceqAS64DMezDSaqMpUS/meO5I2qce2e3djnSN8IXV1y2n9j
         5e6yIjgQr1qL852CSPKQlynyhWwIHYA12meqzar2UOUYguCKCsa2oQTL+VCUXHHPpeEn
         Ja3ri0/RQ04rie580uysriK0U1+KpZfoNT/z6FwvSg0HB4ZT9iCNT0aHRhB6tCIyvsVW
         hnPitDUYG2fDbMg3IZwisutQs9mU5/ewsc3TGY7uG7WIaeCkZnd/slKwblFTjIJ8i/a/
         8PC5Nsp7b4Jll0W7FEemnis7rZ1PwO2XxAcDZZNYmrDK9mPCnxa2FS4gkHNERGJBK/AR
         FuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717467; x=1719322267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJIvSltK61hZcLnfuXyJJYAaIgQQrrXExiMwUA91MUA=;
        b=FAoq/tKOAY1QSkQPtpilWoka5Q9eFzvVu4bzj/YLcowdzoO3b6aEUx5ZXfjZ9/j0Xc
         IcaJkBHR/quxViH9X3e076MlRkupg3a3cUN64Xe1bN+SZ8PRh3MCPVt36MKQBiOoNDSQ
         4mAGx7NCv1M1LmSYmHrGUuw0kmpBgKs0lvXwJVJ1ajer5xLZQ2d+GQZVXx8c/mlX0Gbj
         c0CKFhEkDsoWgmNY7z8n0fgWhGJbEj2/GfEohje3bsDsCkV4E7y4QApqQTtiNSyyEDo+
         /SpBoNHzE6d5ixVifkj718BT75vaLsSi3Fpk9FMCdICaJCyWrpfnKRIlJ3KiYmchJXF/
         LiJg==
X-Forwarded-Encrypted: i=1; AJvYcCUuwObMMzKUN+4vlykXReVG5ORScnFuFtiV6oBziFa5LLsS6fAFfXMTbaGGGA5CNt0rCRTHJmBKw7aKnNhtiOEhJ/mdgXihA9v3pms=
X-Gm-Message-State: AOJu0YzHrC6TLZoJA+70wwpLGO7CgtjBKslhBoiQUloWSfkWo1RAauQx
	U7J9Tqw/pab3h52QK63vbg65ecXScGBSoAW4l89X1K3T55V50dv5V3AQNTsVzM0=
X-Google-Smtp-Source: AGHT+IG9H2NOWBhabFFt1ojtwQAsCIzZmG70ROVQXJAeMSxLCk1HnYjqyZZTNLLp1L62he5OXR1uIw==
X-Received: by 2002:a50:a694:0:b0:57a:4c9b:5dbc with SMTP id 4fb4d7f45d1cf-57cbd69eba3mr7019203a12.16.1718717467498;
        Tue, 18 Jun 2024 06:31:07 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72ce12fsm7774862a12.7.2024.06.18.06.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:31:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 18 Jun 2024 15:30:54 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: qcm6490-fairphone-fp5: Name the
 regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-qcm6490-regulator-name-v1-1-69fa05e9f58e@fairphone.com>
References: <20240618-qcm6490-regulator-name-v1-0-69fa05e9f58e@fairphone.com>
In-Reply-To: <20240618-qcm6490-regulator-name-v1-0-69fa05e9f58e@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Caleb Connolly <caleb@postmarketos.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.0

Without explicitly specifying names for the regulators they are named
based on the DeviceTree node name. This results in multiple regulators
with the same name, making debug prints and regulator_summary impossible
to reason about.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 25ed74d4ebd2..c66c7eda6a69 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -271,46 +271,54 @@ regulators-0 {
 		qcom,pmic-id = "b";
 
 		vreg_s1b: smps1 {
+			regulator-name = "vreg_s1b";
 			regulator-min-microvolt = <1840000>;
 			regulator-max-microvolt = <2040000>;
 		};
 
 		vreg_s7b: smps7 {
+			regulator-name = "vreg_s7b";
 			regulator-min-microvolt = <535000>;
 			regulator-max-microvolt = <1120000>;
 		};
 
 		vreg_s8b: smps8 {
+			regulator-name = "vreg_s8b";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1500000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_RET>;
 		};
 
 		vreg_l1b: ldo1 {
+			regulator-name = "vreg_l1b";
 			regulator-min-microvolt = <825000>;
 			regulator-max-microvolt = <925000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l2b: ldo2 {
+			regulator-name = "vreg_l2b";
 			regulator-min-microvolt = <2700000>;
 			regulator-max-microvolt = <3544000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l3b: ldo3 {
+			regulator-name = "vreg_l3b";
 			regulator-min-microvolt = <312000>;
 			regulator-max-microvolt = <910000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l6b: ldo6 {
+			regulator-name = "vreg_l6b";
 			regulator-min-microvolt = <1140000>;
 			regulator-max-microvolt = <1260000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l7b: ldo7 {
+			regulator-name = "vreg_l7b";
 			/* Constrained for UFS VCC, at least until UFS driver scales voltage */
 			regulator-min-microvolt = <2952000>;
 			regulator-max-microvolt = <2952000>;
@@ -318,66 +326,77 @@ vreg_l7b: ldo7 {
 		};
 
 		vreg_l8b: ldo8 {
+			regulator-name = "vreg_l8b";
 			regulator-min-microvolt = <870000>;
 			regulator-max-microvolt = <970000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l9b: ldo9 {
+			regulator-name = "vreg_l9b";
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1304000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l11b: ldo11 {
+			regulator-name = "vreg_l11b";
 			regulator-min-microvolt = <1504000>;
 			regulator-max-microvolt = <2000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l12b: ldo12 {
+			regulator-name = "vreg_l12b";
 			regulator-min-microvolt = <751000>;
 			regulator-max-microvolt = <824000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l13b: ldo13 {
+			regulator-name = "vreg_l13b";
 			regulator-min-microvolt = <530000>;
 			regulator-max-microvolt = <824000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l14b: ldo14 {
+			regulator-name = "vreg_l14b";
 			regulator-min-microvolt = <1080000>;
 			regulator-max-microvolt = <1304000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l15b: ldo15 {
+			regulator-name = "vreg_l15b";
 			regulator-min-microvolt = <765000>;
 			regulator-max-microvolt = <1020000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l16b: ldo16 {
+			regulator-name = "vreg_l16b";
 			regulator-min-microvolt = <1100000>;
 			regulator-max-microvolt = <1300000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l17b: ldo17 {
+			regulator-name = "vreg_l17b";
 			regulator-min-microvolt = <1700000>;
 			regulator-max-microvolt = <1900000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l18b: ldo18 {
+			regulator-name = "vreg_l18b";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l19b: ldo19 {
+			regulator-name = "vreg_l19b";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <2000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -389,60 +408,70 @@ regulators-1 {
 		qcom,pmic-id = "c";
 
 		vreg_s1c: smps1 {
+			regulator-name = "vreg_s1c";
 			regulator-min-microvolt = <2190000>;
 			regulator-max-microvolt = <2210000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_s9c: smps9 {
+			regulator-name = "vreg_s9c";
 			regulator-min-microvolt = <1010000>;
 			regulator-max-microvolt = <1170000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l1c: ldo1 {
+			regulator-name = "vreg_l1c";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1980000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l2c: ldo2 {
+			regulator-name = "vreg_l2c";
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1950000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l3c: ldo3 {
+			regulator-name = "vreg_l3c";
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3400000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l4c: ldo4 {
+			regulator-name = "vreg_l4c";
 			regulator-min-microvolt = <1620000>;
 			regulator-max-microvolt = <3300000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l5c: ldo5 {
+			regulator-name = "vreg_l5c";
 			regulator-min-microvolt = <1620000>;
 			regulator-max-microvolt = <3300000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l6c: ldo6 {
+			regulator-name = "vreg_l6c";
 			regulator-min-microvolt = <1650000>;
 			regulator-max-microvolt = <3544000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l7c: ldo7 {
+			regulator-name = "vreg_l7c";
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3544000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l8c: ldo8 {
+			regulator-name = "vreg_l8c";
 			regulator-min-microvolt = <1620000>;
 			regulator-max-microvolt = <2000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
@@ -451,36 +480,42 @@ vreg_l8c: ldo8 {
 		};
 
 		vreg_l9c: ldo9 {
+			regulator-name = "vreg_l9c";
 			regulator-min-microvolt = <2700000>;
 			regulator-max-microvolt = <3544000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l10c: ldo10 {
+			regulator-name = "vreg_l10c";
 			regulator-min-microvolt = <720000>;
 			regulator-max-microvolt = <1050000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l11c: ldo11 {
+			regulator-name = "vreg_l11c";
 			regulator-min-microvolt = <2800000>;
 			regulator-max-microvolt = <3544000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l12c: ldo12 {
+			regulator-name = "vreg_l12c";
 			regulator-min-microvolt = <1650000>;
 			regulator-max-microvolt = <2000000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_l13c: ldo13 {
+			regulator-name = "vreg_l13c";
 			regulator-min-microvolt = <2700000>;
 			regulator-max-microvolt = <3544000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		vreg_bob: bob {
+			regulator-name = "vreg_bob";
 			regulator-min-microvolt = <3008000>;
 			regulator-max-microvolt = <3960000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;

-- 
2.45.2

