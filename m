Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DC9407CF6
	for <phone-devel@vger.kernel.org>; Tue, 19 May 2026 15:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779203631; cv=none; b=T+PK1jdfyFPBppPS2QrfFJS7LqetXeq8atLtAwxO8VCCv1d9smQxq7SEdr/2kVJ/2PS55Ql2wVpjIr7hfUUvusupTeje51qVupMN0oXI+aSDB3wZqIAcZSQS6fDyQBvsptL96+7DWY3XA13TmmSBfwCrhSG+TzFUsZZcfDX3pfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779203631; c=relaxed/simple;
	bh=Wt9SYaYbBekuvxG0W9GzirhObD5B5YMMzByQDBZ74uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nuym6N9rQ1sELxD02nzUrr0EKB0H5Y7whzP+gKqFpvKP3Zr73c1MnIZhuARRRSmZIyLJf3Kh6cqNdQiFvneg5jIpygSBmUpMBWM+Qj1rpWKFwH6g7VxcbT54+GDTTa7hm9FU+qU4VPAXjdjWlW6vWuEQuo89wvnc3e8Kf7jML2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfYX0kYW; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfYX0kYW"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bd4f8260e4eso758781566b.1
        for <phone-devel@vger.kernel.org>; Tue, 19 May 2026 08:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779203627; x=1779808427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=mfYX0kYWGAGHja1hXI5OLOgYj1OQk++tMmd0JiTSMXFa3ipin+LIVMe6e0gHdMMm3h
         fnP1qEat6X9Qo7I6dkypZ7M88rPZW12utguonExVUYK5MBfOj/aFSj+cO4gu9CD26JMy
         1TAmOEmKKROY0pd1uPweLNi1OgL2WixWPWH5EEj2fExxgWrdFv4uofyGRvUlJthnGldP
         z+ruEGdbw+TE6n0kV2kXZ1H35loTcxfhUSO70w0bfbI0UtktQxy/BCbgIiYXiNfU+JR/
         S6Zq9nPfznw9mMQNoaPCMyBC8glyaZ7ZPsvkvUs7gcSNT708imkR0X6yFTvQhaw9mZK7
         3Ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779203627; x=1779808427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=pGCo04WFW5LyuvSpHpOCxDPdN5+fNYfqsoir3t1556ZWofodMG3ioHNtO+pdMQVDrb
         XLCxRthP8GlAJKOe2BZ0enNIljiv8UsUKGwtO9Td2QTpdE3cidVWr4XVt7Cr3vnVcKGU
         HD9Xsb/zSDukrwyWnUzoBIWPSSo0g8QW4QkYMPkYcYp9Zq5FTHfMwLIxDUMAClj0lGbb
         BTvBM61VXJRsUPfThNYdmRsPdBsKuRJNmAH0+VPmDwBbaadGHeND6WcbOqKP/S2BNOvf
         8LcH7QgUw9X80Op8iFtXqZI8dFmD4PRzBlETviY+7KhQ75GlB4g6K2IFOaSJt0HdkIiW
         0orA==
X-Forwarded-Encrypted: i=1; AFNElJ8ECiMC9fPdy7VB1V12HJmRgxg81O3zejtaQTDxEqo+jPOVxV7zPaj/iOuhFCUVO6b6oGvlMMA239bUFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YycxNQg5gVgL4ihoDXOa0m2MEKkqKl5DsTkYnVYh1NRlL7/3+qb
	8aXkcJVfirDm7e0OzH3PvCvZ04qtzrjDUyQa8hvwhai4lvlGZtvfBUgo
X-Gm-Gg: Acq92OFYKYtQjGg14aiKfq74Z0HNWEbEHDBsQTeGx6Co/o63ucXRZD16raWZO0PUc1x
	vUashWDhs9o71040r0BGOJwRQdtvPuLT3pt6ah7cGo4m7gzXZvLKlb5XzqcExhnflWiokKueaLg
	eheyQCqKvL6+9Rog2Wc8acsY6DQeTjIox8/gmw4MvIN6T3fwrJUVwJ6fDIEOy2DnB6O4NDHFevv
	FT6MUMoJiHpl/pv0dhb83dcBsLxGPdBiWkYGHsZz7h+yeSKa6k+6UjQceA9qXKKfvNrOdiETo0d
	RZuWdoxWkCvRXUqxw9PsASLce7C2etxxN/Pt358mmxHj5t2oe07cEWTXiYj9jw8FSFoqttmOj+w
	ZKBGnex+g/OG25xPoH9AMorpdvl7N51A5wOr2jcVN19u/LXKh9J6aQ+glxhFZ2s0DuvGMdvxpwo
	Y/mEY6L9Z5wi5ULZnoyEEkJ26pWA==
X-Received: by 2002:a17:907:8b8e:b0:bd5:7c2:7622 with SMTP id a640c23a62f3a-bd517aa9716mr1183183366b.49.1779203626813;
        Tue, 19 May 2026 08:13:46 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310b52675sm6697700a12.8.2026.05.19.08.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:13:44 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 19 May 2026 18:10:52 +0300
Subject: [PATCH v8 7/9] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260519-msm8939-venus-rfc-v8-7-542ec7557ebc@gmail.com>
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
In-Reply-To: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
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
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

From: André Apitzsch <git@apitzsch.eu>

Add DT entries for the msm8939 venus encoder/decoder.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index d4d7b0c9206c..71e22584a46b 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -1627,6 +1627,29 @@ opp-19200000 {
 			};
 		};
 
+		venus: video-codec@1d00000 {
+			compatible = "qcom,msm8939-venus";
+			reg = <0x01d00000 0xff000>;
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_AHB_CLK>,
+				 <&gcc GCC_VENUS0_AXI_CLK>,
+				 <&gcc GCC_VENUS0_CORE0_VCODEC0_CLK>,
+				 <&gcc GCC_VENUS0_CORE1_VCODEC0_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "bus",
+				      "vcodec0_core",
+				      "vcodec1_core";
+			power-domains = <&gcc VENUS_GDSC>,
+					<&gcc VENUS_CORE0_GDSC>,
+					<&gcc VENUS_CORE1_GDSC>;
+			power-domain-names = "venus", "vcodec0", "vcodec1";
+			iommus = <&apps_iommu 5>;
+			memory-region = <&venus_mem>;
+			status = "disabled";
+		};
+
 		apps_iommu: iommu@1ef0000 {
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
 			reg = <0x01ef0000 0x3000>;

-- 
2.54.0

