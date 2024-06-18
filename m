Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89541304A3
	for <phone-devel@vger.kernel.org>; Tue, 18 Jun 2024 13:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717471; cv=none; b=hiX/ZaVB3jUe4Fyb0bHMjtVc4pBMLYKCDpupBIUKpRZvrZGhaon5SG9VAjn0USGq93jUqLCoBZoAV2sZZgLGsrZ7tq85X2yhn1NaOQb0fLdtkQFrMW+SWaYnttfcfucCSQSB/RRrnFO79l9x33LLN8+56Kyn6wnIaXo8VoalgmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717471; c=relaxed/simple;
	bh=9jqtvvRef02o66jA1QOAcPVai+7sRaY9EsyTsBrtl5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i+JWhm6MldVV5QYm99o9fwkOEnmtKKG0A5g4UasVGNdS4QwpD0B7kwc9IDfxJFRcSFJ32t/AhSHKbtx2yF1BIWmZptEJn4NVVquEGWPcbtkwKEq0Mefo7IalpbN0TPMeUcbwi9YP8dE0NF/pdSvfm+cUr6t1w3hpSbt2KTO1kzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jUVy8jVO; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jUVy8jVO"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57cd26347d3so3160124a12.1
        for <phone-devel@vger.kernel.org>; Tue, 18 Jun 2024 06:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1718717468; x=1719322268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XufLcHZuGTm8rMYI9wyKAZOCLDDD6NHtlJfPZ/EePfM=;
        b=jUVy8jVOEa+dG16NQNvQsrUCh62Yq4iCcHiJfh/Pgo3WCFk8SkdIYAu/7j+g7VoiFT
         UuCvJbldluMzc3IqVPNkmqdXkteEObCSmdynlUT/vHT5A0aQIqDWmbHhFiUscs3+DdK7
         v957MDMw1vHc4lpmtT9EvsRiptqNFmnuTWInlj791nKdekDVrMuZhP8MUzOcGNZ6y6QR
         dh7wiUPp47KdjtQ+EqSt+C2l04/hVbF7cNoh7mdFYiA19yETdDj1m8HPxdtrjGH0y19e
         5JYVlgIhldiWDyKcVjSANxJsAdM9+NgaImAiHLNdO9zt7MJm2jiXph8apLNptUBfAuh5
         2aWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717468; x=1719322268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XufLcHZuGTm8rMYI9wyKAZOCLDDD6NHtlJfPZ/EePfM=;
        b=a8EmbmmgfKAP8JpHZbjt9VIpxKPRckLxAc9cmzYo4BRabGgMokD7zBL/NbU3atcLN9
         jHVZzjpB3bWboj0uoq0B+OfUCvMI7PaC5cPXeda8PHuceACU25QxchYaa8WS3HIlNHZy
         T022Oc5nJh1oOcHeHBVPdPR+5dabzwjgXLqmrQmnLXaNgpvPjUCTXvwDYmmj8PrBmh4J
         +YZubTp8qstdgMPlflgNa6xhhWBGs06e3UJtmyKD0X0b20ubEcMmM7EIemlAX3ZDv7zY
         bmt99UOXXQ4OVZYNx/JvvKX++14j65RLEN8dE54HB0qpssqHcpI/4xU/m7rk7Yo07Q/2
         g7EQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1eQLwVcnW9q1zoh9jnOiZfHzGDwmGx5MxCtQSF2M+IiH+6iEOyMCu1QstnGCeFEZGvCaEBfQDmXvMF2j/rHCQWvH5NxmHU5zoA50=
X-Gm-Message-State: AOJu0YxMNM01fs64BxmZBuhorrkj+nZ2MNoy4c/6B7NZIm6k+EixcVvW
	RwE3bJdF+vHiPYAP0WsVOF7Ys+TNSmwq+yudBk4sSpdLMSA+PZkFABosYhF07t4=
X-Google-Smtp-Source: AGHT+IE3f2gOOYSWrzXwFFUeGq/mLVAaVxodsc80KZGZ4autgi3rNIFJjzpwB667E+/etC8GMbQSLw==
X-Received: by 2002:a50:8d4c:0:b0:57c:bd49:9969 with SMTP id 4fb4d7f45d1cf-57cbd8e73f4mr8256045a12.39.1718717468225;
        Tue, 18 Jun 2024 06:31:08 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72ce12fsm7774862a12.7.2024.06.18.06.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:31:07 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 18 Jun 2024 15:30:55 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: qcm6490-shift-otter: Name the
 regulators
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-qcm6490-regulator-name-v1-2-69fa05e9f58e@fairphone.com>
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
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 35 ++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index e82938cab953..4667e47a74bc 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -235,46 +235,54 @@ regulators-0 {
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
@@ -282,66 +290,77 @@ vreg_l7b: ldo7 {
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
@@ -353,96 +372,112 @@ regulators-1 {
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

