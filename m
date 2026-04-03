Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341B137472A
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217872; cv=none; b=h2ylfzx2dQ9ql5IqhhsU5b2nNZqLplv/Vz41taB4i3Q8wbl/MCyYMGxN1FmJz39Ahi3gaHDh/vePWnDVZz+YXBuAqoUH2peLI/rH9fqf8PZEKzsr+qk3BdqQ8UN7vODz8an4GuJc36HLabrUkEfLMj1FKsZqpO3IwIhIEth75bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217872; c=relaxed/simple;
	bh=++e5FZB0tsvADRX7W3I2ua7//VvtHVnA0IB0LJVNzdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rn+MgTvqkY6g+kaWWYk9dxjQHAhZOsaTp8mGX9t5MngZ/kzO44npakt8I1s5mvCJOeEAExO5ycQMArz1NA3QVo0n8LeKMGij6A4Hn6JLpXabe/EH1vzF3aACil2KQ3C27WWL8IFMWgriLzSaEaKOjySaSf/kgCq3szyO+fFPBUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ClC5lO+L; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ClC5lO+L"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso19668535e9.3
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 05:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775217857; x=1775822657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjyHbpSUyn7H1fP6Lf1b6SGYz/5Pq+5nMg5uPxkZH/0=;
        b=ClC5lO+LL61GscOu+clTBtO3Jd3xaQYRiO/p7UBD+4eQXt/0WuFIYsEI/yggZgVPlz
         7a9rwINt3JxoH6UFLxzRTTTHQcRqsFHJdo/ORkQcg7NYnbz5nreeywdObkgY1hNzN8JU
         Ri3B5bQeGfO60vNABMXSqRSatCj4ROGrlqplze7qF+YBVC0sPw/r9qJa8RKA1HzWTbsk
         sqkjVHkzc/oIbecnIlLRt7bcHGlzGDnAuRxBvN6HZVdUMIirOaU+0OiuoT01zDNeRwcs
         S3DjwEItzFKg4n8Onoj7sDZ/0E5PG82e09XSzNvOKnsOsIoh5V7d1Q8oep+kM90OIYfh
         Ofow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775217857; x=1775822657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JjyHbpSUyn7H1fP6Lf1b6SGYz/5Pq+5nMg5uPxkZH/0=;
        b=Iq0yXEf6UceHd2e/LZ+SkGGuVkJkd9iHpYTXEA9pMyB+EwiIC8PBnnJWAyZaT2cHOX
         RmGKaU4P3fN3ApUVHikc/2XmPQAebmcTKTKMl0Kf8wQoTqZcEMcwcTLpZTZZDS0engKb
         LO4inXqrMLDa4O7kSq4tOhAS2TnqDCvqMSCsYrEP8udzPfB36ieBJ30KQW1xq53z9FrE
         ohLfoGYJXMEYbIMTAJOmS64oYPDo1i1QNLRisqHbiW4S2COtR/dJQjaaeHGmJUDuIoPO
         YCja4XS9nbAzQabD8cQg4zV8KVC3Cd/8n3oClOUfA6tlnlz53Ho0OjGya7TCISazvOuF
         bBjA==
X-Forwarded-Encrypted: i=1; AJvYcCVAAih7+oOJHd8G8qKkYjNqovDHVqrcDRZtTLjNYrxdsuLgEnD2ZLHefJAV9Y3siRBhIYMK5BAHg6UShg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/4P5zo1aAqwU+doBS+bnIWyjHxWRHe9iFI9SP3AbbQCvYsQ6X
	Ku7kYXwmKx1/j+/1elE8iJfONm7XdpsXef7Dgsnyeu9G+X0KZ/ZsQTBJptAyrsYxLLg=
X-Gm-Gg: ATEYQzyO9I9rN6xMGSaZMYbNfndZoma81i+IG2eSuWzKSqbNV45uHBhF8/szpvQH7Jl
	YuVWchC9uNest6AVM28qr1L26/89rktsx1exHcmHKUHeVuRDiUdKGis+gfb6parG8gWYtZZQwkB
	gtA0yWoaanH79cw9TwVCc5CIcdnOwlCn9RV2P+HFmYjbgv8SBVZ/N1/KlZ89dn5jz69GcKDHdRW
	SJ79UGlbzwPNjMiUUOUYcB8BOBrq8m9OMuQJWW+ACYhVUAf+moNo1h5TwRh+5HtpCC4LQ7UVk6R
	CX8JleUYWdYa8msr/swAwSfGElqd9UzWZE9iBIb5enYGJnf57dHD/QPI287zDvdCw8+2rVCGX6J
	C9rMDiWbtGZseXMWLw4yhqkH8TW5XIuh55YNT0n97ILYQHtF//MQfmIvXjz8+v/w0zk3pN/r48v
	FJARwPBpUUY4FBW8fd+RY7uuUTH4ZvQDohZg==
X-Received: by 2002:a05:600c:3b18:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-4889970dbc6mr38933115e9.10.1775217857503;
        Fri, 03 Apr 2026 05:04:17 -0700 (PDT)
Received: from [10.157.142.139] ([41.66.99.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm300193995e9.0.2026.04.03.05.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 05:04:17 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 14:03:48 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: milos: Add GX clock controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-gxclkctl-v2-3-95eb94a7d0a4@fairphone.com>
References: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
In-Reply-To: <20260403-milos-gxclkctl-v2-0-95eb94a7d0a4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775217850; l=1066;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=++e5FZB0tsvADRX7W3I2ua7//VvtHVnA0IB0LJVNzdk=;
 b=bnsAXx5MnEBVpdQhExbmj5V09OxSu+2XLfAK2X4UgoO2d5cHMVKQ01e3yJrzj0sr4nYMEpqNz
 XwrlaWKUKJFDhodt6a6OQL7sfSb4NWw8SfoTXVYjABt6ohGoGvdxwNb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the GX clock controller, which provides a power domain to
consumers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..4bd9181ca03e 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1542,6 +1542,16 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,milos-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,milos-gpucc";
 			reg = <0x0 0x03d90000 0x0 0x9800>;

-- 
2.53.0

