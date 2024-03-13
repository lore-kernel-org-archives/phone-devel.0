Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5853FE58
	for <phone-devel@vger.kernel.org>; Wed, 13 Mar 2024 12:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710334417; cv=none; b=KSq4NyHGMye9UwHqlE+qV5n0iqRxgQuF/7T+fGy1b/wud0wMek2LkX5IdY04VvWGeapnX15DEtu7UZyxYkoCbtZoRml2gzOozJZRIu7+yPdlGN/IGxf5AC/rWUWmgX5ekutmb4TL37AEsZyYmkaQet8UVgR1GI0xi9nllQ7U7Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710334417; c=relaxed/simple;
	bh=t9ETQhsMi3JCo6L9lAIlwLKX3YACOoMJvy5t+4f3Db8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XR5ViBC9MAjZI+sKssj6n3h1Tmk91dcNV6rq76tMiD69FGw4vfaU9OQ+biSV5qARLNfCzbxN5RmPwiQedcGT1Aof88Qgh+So7IJi+R9mhbSJ0uPcVnQZfcY/2OqaHwzKg0dX39MOSdPRZ6JWvpmLrdbV+QcbyCmjiOtuZ0Ery1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YoTCUFbT; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YoTCUFbT"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3122b70439so844605166b.3
        for <phone-devel@vger.kernel.org>; Wed, 13 Mar 2024 05:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1710334413; x=1710939213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxb/4unMwiiw34slo/Lxt3H8AqpbzUye2nUxDtdgTWI=;
        b=YoTCUFbTX79y4w2cya5MbDUdpBP5YG6Ec9fKbJK24RprL5dC/dG67c9GrNNw0/VhKA
         2Lg4GwvGSFt1ORNwHCGkO6M1Pm/Jc1L0kVUe49xlIazzitv1p+Sm2sJsYC4Rf+nS9Wvi
         MxB7mwGZXsLQPjwH3RJ4+loKY1hlUsXwoskwBhZ6KpGEtPdWb+NMtKBwC61RFZdLOuoD
         uqwn5ffC9C+1nY8Ns06j/vPkLL5d5LNLIzOHV3ksrIRMXTf7EaL3x+xOkHmJTt5LqyRe
         IxwZF6sB3ci+NbCwM9jYYofP46fO/tga0AKcMrvu/fns0cAuKrXPIHYOzex9WX59+8Qt
         i+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710334413; x=1710939213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxb/4unMwiiw34slo/Lxt3H8AqpbzUye2nUxDtdgTWI=;
        b=ZW92s+TBcbbuKJFmuXH910Hp+85VhcYwTybDhqsGkroch5MEwF09rcZZPB7ZKRVpUG
         mq5lwkTd+O1Z2f/U6Qsn/KyD+yXx8ofPb+sgobfvNt7lvIm/WY8m8U44ll6aECpEvMSo
         XBjT/XtbrQV1zdqs8of5H0qj4EaULFLRyYECdEu2LhUv//fmG6RTLy7QLL/GFdrfJG3u
         fGzYKc/tBt5i3y5JjHBbhjkmNVCD1rk4GRNFeu6OP5L3rEfs0nGoTAhPKh6QVjmhPKcL
         eWxh2r+OLCUbvWGOh0mCm9D9UMAPYFd5o6gVrI5PZg/kEDHxpWTtqmen93rXyvU5Tqp6
         IvKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL4koHLLwa3VVnZEo42ryseFX6bRv4e5BklXJ/j1c+j0fqMiCOgDoH1YG/3X1/nquNnPJqznrZcqZoHya2yNmpm7swPiPDwhsHi8A=
X-Gm-Message-State: AOJu0Yx11njsqXwbg2Yh9t99bNZLRU59h5skG56dB4CAtj/Uk0b/YGas
	YIhl9QMKTRqItQ94Nv6igVlXMcDnYXSIJuevdnpayw9KoxsdQSMY9t2agankJWrTS/AN7kkPrES
	U
X-Google-Smtp-Source: AGHT+IGZBy38RA1kd28N7FqIYB5/MHvNN1GPfLWolHWY4kG6L/symPCXVuU4L002dy3ms9tGKZ3beA==
X-Received: by 2002:a17:907:cbc4:b0:a46:4e73:9c67 with SMTP id vk4-20020a170907cbc400b00a464e739c67mr2151230ejc.68.1710334413569;
        Wed, 13 Mar 2024 05:53:33 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id jw22-20020a170906e95600b00a4623030893sm3249098ejb.126.2024.03.13.05.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 05:53:32 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 13 Mar 2024 13:53:15 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: sc7280: Add inline crypto engine
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-sc7280-ice-v1-2-3fa089fb7a27@fairphone.com>
References: <20240313-sc7280-ice-v1-0-3fa089fb7a27@fairphone.com>
In-Reply-To: <20240313-sc7280-ice-v1-0-3fa089fb7a27@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Add the ICE found on sc7280 and link it to the UFS node.

For reference:

  [    0.261424] qcom-ice 1d88000.crypto: Found QC Inline Crypto Engine (ICE) v3.2.0

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 83b5b76ba179..3ea5f9cf040e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2314,6 +2314,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 				<0 0>,
 				<0 0>,
 				<0 0>;
+			qcom,ice = <&ice>;
+
 			status = "disabled";
 		};
 
@@ -2336,6 +2338,13 @@ ufs_mem_phy: phy@1d87000 {
 			status = "disabled";
 		};
 
+		ice: crypto@1d88000 {
+			compatible = "qcom,sc7280-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0 0x01d88000 0 0x8000>;
+			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;

-- 
2.44.0

