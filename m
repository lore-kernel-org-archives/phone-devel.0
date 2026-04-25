Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9316355F55
	for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 18:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777141889; cv=none; b=sUF+b1ub+ukureTe9xobbnR2vRZS4NFZJbEF/IL3AKsQkQzwu761+UrzsVyNqsOKc7p4zxjtRD/nHFQ9AgRqW1qKThJm3mgt3C7Y40CFdJ7nVI+wojeFSEg92Ze1CI5NMPL7SJRl9kfVJQl5Z6w9xApbXxci98tEyaXkJGONyuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777141889; c=relaxed/simple;
	bh=ZEu2LQcuP/U1oFZihO1ZCMi51Bv/ruis1G1kHDtRAtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rAMXH/HejiapE4/OfahkSig3gr0kGwQpnhEJCQimZS1WCwJz/JcvB+0AQwzFUprm12ewe8AvvSgkMd5Gp5F45dsfeY6zXebGtS7reQveh9w6SNGEClUznROYHSze/qrvA7MWe1pxhEbx8+93Kp8kpavEI457Y0q5lTNXXqXfa14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzNRVxXB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzNRVxXB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso60677535e9.0
        for <phone-devel@vger.kernel.org>; Sat, 25 Apr 2026 11:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777141885; x=1777746685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbpuikSocIfY8I9ag+pa38zqNQnau5eLp1wx9M3PRIU=;
        b=FzNRVxXBcDibgsC4YyfmsD+ZpTMQdHhrr+NzaruHYspMk6BtYZzogqRL5cee1XwN5/
         6F0uzub7AVBVIaw/wVNDMXFT8HklQsKT0dfEHO8eO7L4sdpuytYhFUCYHmpT/9z1DadP
         IUck3s4WGXqQqaAd9q/AwSCFS79cl8Scmj86mF5GhZT8Dg7oq/8/lqUzEYWlGb/ulaoL
         rNFZwizEPaeFC/0T+Rys+ekJoZjJBP5+HbM4cwDqiKHK6J7d1yL39P+eLsCA1e2HG6T9
         tuPe3el2ISKiVl7OJuCa/lpYeNnVMczzJq3PwLqozaA3Fuy9kd1Vw69OO5XpUu5i/BSJ
         wnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777141885; x=1777746685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PbpuikSocIfY8I9ag+pa38zqNQnau5eLp1wx9M3PRIU=;
        b=Tr5mnyjHjPzLHLbgg0GfX2fMNm+Bf3GXjSteYzjdBY1PmTQMNXa4jI+pwHS/pXf45J
         jBy6Sf5wgRqG6Y8d54FmKT6m+iGtbwgLr0QquiRXAhcc0uUI20OjXtqq2gG/rrNfobdl
         3uw6WPKrb92pSL3TBma25A/XL3rE57oqIuOrJpD0+WgYcVknOZn+9dS5Nlxluk7yf45S
         6C+CLfgvtNZVQA7YMdjuKuWedSzzhOw/qiUm4pFCgPMWzrOcyDsvSFhi2TqQFNgbVHnT
         II3ICmSlVRDiv2tUUky4buVf7WMtKBTWlLh2QFSBBcxRcZgDg3VjftHWD6P9wd2k50fy
         BQiA==
X-Forwarded-Encrypted: i=1; AFNElJ8+5dCf9aZkKtkVKNow2gPrEX3EWcQFS+sQoulgVlBbIsoKhISz+yG1QiAlVbkQ0CbO5Vc2TBBpAEJIGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOGfuljBhr+QNwqN4/OKtb7NXxsHkHJonXNoZ/UMl5vrZBOH8b
	aqtzR0cocKw0AhYXWqff6Y01B2Kf2ugUdNVkFhD8rSRjTP40yOMT2EfX
X-Gm-Gg: AeBDietPk57ijTSTzyKDZfNjsxFhbCDreST4ucxAOp4FrtvkBh8it9ogzuf0YxYaMAD
	rIpT7lgM7cdA20iEB6OnX4laPmlPGW/hu/Hu0BQzUaj5PHQKIGNApSKeLVTSPUa+ftuJ8iNGA5n
	0Mac+WCv5IrA7vXbAuNZ9YkE4prWnRIUI7QEgwtm2d7I1geVN2PuEIveDcXlAY3878wDWitwMn0
	RihVzIimVRij7T7Q1symeeG+jQSIa0lRIeUhB6NL1r6dFqrXrTfpjWCQ8SB9czLhPL2AvD6zGb7
	RrkDI70OnRfeYeQxZn9DV9n5FCZv/H9RMuv4mjwf1Fz2J7t/Gbwhr1JazE3U2YNQiHIzS9uXidS
	Rfx5ukXqPCgJJLisoQdG5neLbTVCb52TUjiMt3WzZ2OjQgx4akSDeUofyDry4ZXuh7PnDtvil1+
	p0is2nUGJ59p2RSj6mXjlc5m7cFITwIez7mYM=
X-Received: by 2002:a05:600c:1f94:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-4891c2d2213mr388573755e9.5.1777141885163;
        Sat, 25 Apr 2026 11:31:25 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:260:fa4:a26c:adcb:8da8:3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4899dc95920sm133613675e9.6.2026.04.25.11.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 11:31:24 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sat, 25 Apr 2026 21:31:05 +0300
Subject: [PATCH RFC v2 04/11] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260425-msm8939-venus-rfc-v2-4-f69e52b36207@gmail.com>
References: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
In-Reply-To: <20260425-msm8939-venus-rfc-v2-0-f69e52b36207@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..6b295d3f8256 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,40 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>;
+			clock-names = "core", "iface", "bus";
+			power-domains = <&gcc VENUS_GDSC>;
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+
+			video-decoder {
+				compatible = "venus-decoder";
+				clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+					 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+				clock-names = "core0", "core1";
+				power-domains = <&gcc VENUS_CORE0_GDSC>,
+						<&gcc VENUS_CORE1_GDSC>;
+				power-domain-names = "core0", "core1";
+			};
+
+			video-encoder {
+				compatible = "venus-encoder";
+				clocks = <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+					 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+				clock-names = "core0", "core1";
+				power-domains = <&gcc VENUS_CORE0_GDSC>,
+						<&gcc VENUS_CORE1_GDSC>;
+				power-domain-names = "core0", "core1";
+			};
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0

