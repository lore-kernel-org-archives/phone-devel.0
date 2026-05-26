Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD223FB055
	for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 13:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779802314; cv=none; b=ZJkfsjgYI3RBpFLn4no0z5o8X/hVqEHtYc3uV+/MGa/xMWrVEmXofaA5hnz01NzVfT3DDKAp97wGwoUp+zC7pSQ9yns1ww/hvv9n6UiUkwX+Ydx6L3jWp1XsVCmkXd7HzbVehlhgeZCk1pYfT6mvsBnF5WT7gBqpTN4uC/VbK6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779802314; c=relaxed/simple;
	bh=Wt9SYaYbBekuvxG0W9GzirhObD5B5YMMzByQDBZ74uU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OWcwOOE5ZNnzAyfSxMvA9/57D7RWtT0ROOwVa5zQK7DnGiL+VcCcPj04bWx6yE2buWOuBzmHPu1JINVYYhRenTL6q/92qGBGiJ+o5HNusxySiNmJhgAou7X6tkDkXkYz6WvMhQ4dU4JWXDo1X2mtmjkbtjcSJ62iy+Gny4c6EOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/nC6G6E; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/nC6G6E"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso50497555e9.0
        for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 06:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779802304; x=1780407104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=i/nC6G6E6uI9ZNs+tzZR6vYgyFCFEl3iIH7e9yQCNXjf2n2oF7gy0lJ65OAv2C41uS
         TfMpWecUZr7XAndGeVLxU8DqC6UVvi08EkA32KrfBgo0JZOCiItDpsL9PYjBebzZm4c4
         xhSy1w+tFAvWcWaXbGBLr/DCILszKgUnH2NPHFeMRDaahXzS6IT+vZfQ0WnixXHIbGgK
         wt0MPC6iolbAI6tkh2UblxEL2BCOg73UZ3Vv1AJcY+bayuKkRhESlxLCO9ZLLc9EqKUV
         J8pqlgEjQNcjansyAoUUkstoQR8tk2QORxOxJkexg2Wn2E8o5/DU3Uqjgai8GsxKA5bK
         feJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779802304; x=1780407104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w02Fw3u4OZYjqyD8CNbogogC0D65Ho3wtBiCcEgc55Y=;
        b=XiL5wff7Uv7VdLrNBMk3+IjsicNvMtIgwX4lnZn9DnR7D46IY5DEv4oqgu1tO4Z7MI
         s0pcGeIJcUZS8ydREjb1OoPRDA6ihfl0GgcVvvdH7CzGA0ssutXvbgUgPxGl0LIHJ8Ds
         SW3cvuQ5Y4Kb+bhTomC0QaF88lJNOPZREyR0jRFb6ww74leMj5mWqRLOrDFfY8QmiCi0
         +JbuPavPriHY3AuhjFZvtMxYiSKrSsd01SnMU1BrcVbV/wHQQTbifIP8Strnc5nIY0WW
         6mhMKivjqltXwYhLRJOlqvnXVpw9HL/Biefz/VEJkCQnABctX4m7eqbRzfy9svU6jLmE
         o7Kw==
X-Forwarded-Encrypted: i=1; AFNElJ/EDr0ESW9PSGS/DFQXczwlBsTu+tCUzkexEtSQ8mIFXBc4l3mbNCpwg7StOtm6mZtwe1KHszjfUAZdQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxaC8fvnVpUvwmyz1G5kbLihUdCHo+/hcdZuHmQiJQ1cT2fW+h
	/MISLGyV87caDydKsJKWRVvaFk3h4THuy821m88sDF2H6zyezboJPqg6QFT5IQ==
X-Gm-Gg: Acq92OG8hUmHfeZYKSQbETCqJ/2P/NDodnpvn/miBBQi+bjxSj6QOQatokvGnqs+RD/
	kNqXy+LCG6QORAZcdCSjfJI4RKJjOQSf9SigwJg1/rsvYXuq1n+IKbunmtpABkSq2OZhjtg889q
	a7pCdVnbNsNMMF6/Nzq+OGvT+TNd6w0BHMNxDWOnIVvfg0XA7eTRK9swMvFO+tnxJPlVfX+7yHN
	YT0mg8F7yCxxH68depqOdtHf+rvBUIGQiifM5lU0dnMeUQ+E6WekchZfNNfu3SH1ijQisvIdDsz
	DXYF6MKa9PcorI8PzLdmuy2r63duWI0K+xEXTCLIKrZv15bmA4LTkYWAwRoJzo8W7L1QopNle7L
	j/Ql4z3N7MBcDCKN+/iZ+YkjIFhParyfdUYd/wKmPQTl/SD1qCUUSTR7rPaiZpjVFX9OlUYqV1r
	o8UrCEZkI3sX7sZ2rUaDT4+Me8Uw==
X-Received: by 2002:a05:600c:45ce:b0:490:52c0:73f1 with SMTP id 5b1f17b1804b1-49052c07823mr225521815e9.9.1779802303562;
        Tue, 26 May 2026 06:31:43 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490452580dfsm170958895e9.1.2026.05.26.06.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:31:43 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Tue, 26 May 2026 16:24:29 +0300
Subject: [PATCH v9 6/8] arm64: dts: qcom: msm8939: Add venus node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260526-msm8939-venus-rfc-v9-6-bb1069f3fe02@gmail.com>
References: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
In-Reply-To: <20260526-msm8939-venus-rfc-v9-0-bb1069f3fe02@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
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

