Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79C348C8CE
	for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 13:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769002002; cv=none; b=An1CbltCjfO5kD/Iqd81RXhpIwJ+8aOs7lHE/9kwh03dg0ZdMvq4lMgiFNKB5VLausyh/W5aP9DPr/Buyf0zYlCNHzClRGiDS0vfz1Di+ShsVniU5msdQeZfL619DzDNJy+zZRuibMJa10fMxhBVw3M4hDmfIO86oTdBEB4QIgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769002002; c=relaxed/simple;
	bh=hB2PWZM4ZB4CYZFskv7vZ7lEVdcGMkMbujOg9c56v/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EjAmNca5XVtG7YSehtLtTiodwFqpROF5mv67WzBrtWNQUL1GUbEPCYmSOZDpHko7im9IBq1wElEhCaiwMOGd/EaxlEOyJ18arHzB/M2Cz8okKgFS1ZCzh4dPQlM8xzjm2qQ3xluHHNuEF7ZfZ0GXMyyQvyvZSd1DsSoaxOpIqtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lwiFNn8u; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lwiFNn8u"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a7b23dd036so2555655ad.3
        for <phone-devel@vger.kernel.org>; Wed, 21 Jan 2026 05:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769002000; x=1769606800; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+7aTGNuxDFTgmCknBnDaH+B7WOs4xXCLJbz/Zl7coA=;
        b=lwiFNn8uC+rfRIsxEnP6L0qpRgKk1Vc+OVSZFlFiUBkiWgTwKC0vvFfLn99HjRZOEl
         F3r3KnoXSXbcy0w9wCdvnCUpnQL1n/XHxECmn76zgGVCOjh89gyswjn0Y+i6w8XSQuEh
         GMt3K82Kw1nlwwNR7YBfc+3DI2xdAGUoi7DLbBB+Ty1ToC0orD3mufsdHHMR/Nbbnp6g
         NmsvCIZLeQUakTPApk1lJw9kHKR0XgOtaPOPwudrBK39JS06hBfs/LHvdUSB2n8Dt3Eb
         3s+RA5zTfUMwCKLyXkjfETG5zWZnKjsgMwywpCZ6bQ19JXhgu0AhcnGyq+QjvgNNhJ1e
         MbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769002000; x=1769606800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R+7aTGNuxDFTgmCknBnDaH+B7WOs4xXCLJbz/Zl7coA=;
        b=aJtpms4jHtzjUKFS8tn22z0rj0RRUnQU3K4gNCf8u84h6sUGldooo6r8QWarAXcrpm
         P2R8Vu3C6r3/16xAsksyRo7J9hdxbkxwMhpYer9Sx0SLumjDxREwtvUF3XMf/98DVL0Q
         CByqcoA+xUVwBrmxqNipu6DO6/YqveIOob4KvDBb+Ej+0+13DG+b5Ccm3g058AHZo8VU
         ccyq8kmfQtEmQunT3Unfp6nv/cSiTrIay8DZb9z62ed0Q+nVkGncZtZUQxAcpfq9IPMo
         PIu1YoGmf1s3w6mHD30FSRVrHW2OIMB8sg7AEs8Ic9VKhIWlU5ZvvXRlwM9VZSrwIcMd
         tkvw==
X-Forwarded-Encrypted: i=1; AJvYcCWcdmwpP1FKBSfKY56IqrRaw9rfe4r/UfKd5bbUiGg16MmdtEJFxWN79SPg715OFUMi4OEKdGOwWsARXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaJqSKRl6251ybpJoLbR8LRc1pbbsEvJwJGCzQ13IsDAsKipjE
	lWkxT9j2FxP37dW9XDoilxQ2r2TpL8rHmaXXbLVvaYokcZsSXUxAIxYW
X-Gm-Gg: AZuq6aIDVW3mMZhtrQeYB9FEk/NTZpNCi/OqwNMqiNLI8UMDYCxEbhL4k9DzjMixYrc
	rCmP65JOku6RtBRXiqr0TvM/rj6E38TX9OkfeDZLZzRb/qoPaxICpNvMSZDd8M+Xy1JQoCYKZvn
	cJfJDA1ZZgABYjZ754aCuWV1CKZdn5aXvi5LrvcdKlDtSq72sQbsztN0wmJXhUHqY/Z2xCu16vH
	OraUWage6fmqTMaqiET6D/c0xq0tpnSJVufFN/3rPoqyQokHk4iw0wNe7JwM9eSDp735CL9Uy1m
	QcVtOuJuxPoQacQIDiddD31b/Fr3RCYnFgtYoTPiVFZhKdCiXK87G+UvLCnkxoBXq4fPe81ir55
	3qYLbIckJLwh4U8zpc5GZHWaWaPdiaeE3O2AOTE/5xYSm04g7mjmAGgfjzq9TP0XlkbGTLi6FQ9
	4SSQdYSPkff7ugb9hY
X-Received: by 2002:a17:902:f745:b0:2a7:9163:8e68 with SMTP id d9443c01a7336-2a7916393e4mr31219985ad.6.1769002000008;
        Wed, 21 Jan 2026 05:26:40 -0800 (PST)
Received: from [192.168.0.101] ([45.113.101.30])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a7194164dfsm151487235ad.88.2026.01.21.05.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:26:39 -0800 (PST)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Wed, 21 Jan 2026 13:26:19 +0000
Subject: [PATCH v2 3/5] arm64: dts: qcom: sm6125: Add debug UART node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-xiaomi-ginkgo-features-v2-3-fb3ee94922d0@gmail.com>
References: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
In-Reply-To: <20260121-xiaomi-ginkgo-features-v2-0-fb3ee94922d0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769001984; l=1390;
 i=nathbappai@gmail.com; s=20260118; h=from:subject:message-id;
 bh=hB2PWZM4ZB4CYZFskv7vZ7lEVdcGMkMbujOg9c56v/I=;
 b=+tNfMlVu/60v1/8jW5BzCD87Jr+udO9JBnfv1+at5mgstF0y01P/XnjTm2D/jC+ZQZOKWxtXQ
 CNMWoZ8Q7QIA4QyH+6lk30XL2gRk//hJ9pIY3ZMNOH2n58HjwHir+DH
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=slmb/9yXbet+KTiT3EYLCp0p0MEOYa3EdjUXP+HXfjg=

qup0 on sm6125 has 6 SEs and SE4 is used as debug uart. The uart node
and the associated pinctrl are added here.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index e60d4d74c..0540fb865 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -661,6 +661,13 @@ qup_spi9_sleep: qup-spi9-sleep-state {
 				drive-strength = <6>;
 				bias-disable;
 			};
+
+			qup_uart4_default: qup-uart4-default-state {
+				pins = "gpio16", "gpio17";
+				function = "qup04";
+				drive-strength = <2>;
+				bias-disable;
+			};
 		};
 
 		gcc: clock-controller@1400000 {
@@ -985,6 +992,17 @@ i2c4: i2c@4a90000 {
 				#size-cells = <0>;
 				status = "disabled";
 			};
+
+			uart4: serial@4a90000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0x04a90000 0x4000>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				clock-names = "se";
+				interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&qup_uart4_default>;
+				pinctrl-names = "default";
+				status = "disabled";
+			};
 		};
 
 		gpi_dma1: dma-controller@4c00000 {

-- 
2.52.0

