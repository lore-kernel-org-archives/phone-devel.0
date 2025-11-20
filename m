Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F140305940
	for <phone-devel@vger.kernel.org>; Thu, 20 Nov 2025 23:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763680274; cv=none; b=fqOon2SI4VOO5Ze368C2UpLETmtyLRETO05ZbZgszUWjAa+KAe9HmC03mwPXpHZh7V9/uNchIKa8slHhgXChlXWbsu7vb6JvNic7EVwYTZQxS6C7EG6D1VOoD4+jTuJxkK/xtnGDMsnW0X4970dFY1EfgjqxCzw7wID+2hQPAgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763680274; c=relaxed/simple;
	bh=rvQqK2Qnnza8UODspIoco/dwN/jhzS7VOEc+p0mvRws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jyk9CBLKMvoALdIRg3Kb4URiLNNPCmnWvv+qy5W/vxb5prqE4iHHDPzJXSey8Pnd2DrENLztWw/ja0mRo3qLhgzy+NQgX5kc5oaZo1YXB+Nrq7WymIOF5jsLwV9vugB11lZrNKltlr3DI15dWwrHn3uuris6S92j3pBjAsRn8gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jb4LMMky; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jb4LMMky"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-640d43060d2so1323125d50.2
        for <phone-devel@vger.kernel.org>; Thu, 20 Nov 2025 15:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763680272; x=1764285072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcrMiAY6TXHKRYE9vCTFAKLMlZrOurVy/Icq3KzRhzE=;
        b=jb4LMMkyLoCF7FxwGvkAr8Gdb8PhLc/ONMjL+FwPEF0NoUSdNLyyeAJhEblHbMrg7y
         Ddqjtrjb1FqK7U81Y5lvI5WlDKRBbJzk+V8zbjZX10qQAHOtosiQG3RBQZ2n/w0OVBFo
         Wg/Eg51fpOPjOv59kx3RqG4O7gC+7Jr1NeIJ2TlcP+o0CvK5TYZ0lJN6bMmeLnf2WewN
         rTt++w6pqmEa4jxhWKC44WXFqU2PTrGvpIi4rh90xOtFVRxTjVWYh7juhqWk00mcl5pc
         0Fqgx22oCHL/+QMsSF6YeGAJG7o20iG+huEHjXNPs4pkb3kvNFw2vhOXi/jJZ77YNgum
         dARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763680272; x=1764285072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BcrMiAY6TXHKRYE9vCTFAKLMlZrOurVy/Icq3KzRhzE=;
        b=Ov8fThQb/IT/Enw7lvvNqpGDxqbnwRt9WK3dClxVRtSdwXE6YF0Pz8WeBVgbya1csU
         SlhdZKY/6T0n/Uoz3YdMY430Q9EfpsgnPi18SWi6t67f2anXBejWc2ZG8kOqBuCkd43H
         768jQ1qo5mKhKKCa7yW0qtU9W5It2PmdRlnwNVhrgSz9+1uwJCYsBcNdMFLmvIfvzshV
         XEMyqCqrWZbJOqZGtLafOVAKI++9RJA/4xMVaOq6F+qJc9R7o7+f9+4a4o7JoPexHD61
         NSUL0sO5HRHrAX/B7gX20UYRRPQ628Dzu0pr3zETfkrULV4fFeC9hy2fQPr0y/ac1hKV
         XiIA==
X-Forwarded-Encrypted: i=1; AJvYcCUhJ7F83T3roY45JNZ7IwKSrbYshhwLEJawoNvVPLNqoczcbMo3fIggA+fEPMVZhjG49UCsoD+KDZ8qVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwazEN/Af9PxlVHSeBYF8MNNiwTkGKbn0Wmk2JyEhWijeTXyJhT
	1izboNc/wILY57XILY5R7cKdrCg0fwm6MN4HBxjSyRgtrkMv86LCzqzM
X-Gm-Gg: ASbGncsSm7e9gJvr15MI7iFG5VXRFeFmCY5Ngut7SC6ceKtHs93bjUMO/+rVNgBZ3Oz
	ylBAk0Q1dp1wBI1KvCfcutwPE5/IWFOEoiPjNeCjfMJkVl8FH1UZRqBCfgx+YC8Gs8z4Cvkvjty
	HS35H4ldcvPslpbW8ND8Phl/UhqLbEryjoy57SKHKtYxSsRTPM6vlGhWIpNOCUgGESqP/CPhYnK
	u5e5wodlQrhO1fYE3RBOzwa35m0VQ9lis7DudjiA8rod0ecpu6yDTje9XgrBLCJU/woO+z0Di81
	01lbBeXAN57+Hs6mcDtmnqMzJDPSDXrwHuRNK764C04ervu3HMkvV+BFgdgBhrXXPq4PYDp0Z8A
	4KhuV8orCeYWUv4tjPKgP74coy7fwrfhFTrk9hsxlgFrSgUuOF5RimjystVPlh/5Emy1Pv2xkc/
	OzhoeTB8yXla8l+A==
X-Google-Smtp-Source: AGHT+IFB+ETqzI/BJCcnBrZ6ztkZrLAt40rL3dOopRnLtXBJXXcXrpR6Qj5fuohfSaTCS/BZDxlGZw==
X-Received: by 2002:a53:c052:0:20b0:63c:f5a6:f2ea with SMTP id 956f58d0204a3-64302acd4e6mr81240d50.60.1763680272170;
        Thu, 20 Nov 2025 15:11:12 -0800 (PST)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a798a7f19sm11356807b3.20.2025.11.20.15.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 15:11:11 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Fri, 21 Nov 2025 01:10:48 +0200
Subject: [PATCH v2 1/2] arm64: dts: qcom: msm8939-asus-z00t: add battery
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-battery-hall-v2-1-d29e0828f214@gmail.com>
References: <20251121-battery-hall-v2-0-d29e0828f214@gmail.com>
In-Reply-To: <20251121-battery-hall-v2-0-d29e0828f214@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.14.3

This device tracks remaining battery capacity percentage using voltage
mode BMS. This commit enables the pm8916_bms node and adds a battery
node to track its capacity. Battery properties were taken from the
information printed on the battery itself and downstream device tree
for a battery named "nvt+atl_3000mah" [1]

[1] https://github.com/Asus-MSM8916/android_kernel_asus_msm8916/blob/10.x/arch/arm/boot/dts/qcom/ASUS_ZE550KL_1936167_3000mAh_3p4COV_VBMS_Final.dtsi

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index ebb548e62e02..b58f0a04abfd 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -20,6 +20,25 @@ aliases {
 		serial0 = &blsp_uart2;
 	};
 
+	battery: battery {
+		compatible = "simple-battery";
+		device-chemistry = "lithium-ion-polymer";
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4400000>;
+		energy-full-design-microwatt-hours = <11500000>;
+		charge-full-design-microamp-hours = <3000000>;
+
+		ocv-capacity-celsius = <25>;
+		ocv-capacity-table-0 = <4372000 100>, <4306000 95>, <4247000 90>,
+			<4190000 85>, <4134000 80>, <4081000 75>, <4030000 70>,
+			<3984000 65>, <3930000 60>, <3884000 55>, <3850000 50>,
+			<3826000 45>, <3804000 40>, <3786000 35>, <3770000 30>,
+			<3753000 25>, <3734000 20>, <3712000 16>, <3693000 13>,
+			<3686000 11>, <3684000 10>, <3682000 9>, <3680000 8>,
+			<3676000 7>, <3668000 6>, <3643000 5>, <3600000 4>,
+			<3542000 3>, <3462000 2>, <3340000 1>, <3000000 0>;
+	};
+
 	chosen {
 		stdout-path = "serial0";
 	};
@@ -135,6 +154,12 @@ &mpss_mem {
 	reg = <0x0 0x86800000 0x0 0x5500000>;
 };
 
+&pm8916_bms {
+	monitored-battery = <&battery>;
+
+	status = "okay";
+};
+
 &pm8916_codec {
 	qcom,micbias-lvl = <2800>;
 	qcom,mbhc-vthreshold-low = <75 150 237 450 500>;

-- 
2.52.0

