Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA3225D904
	for <phone-devel@vger.kernel.org>; Mon, 24 Mar 2025 08:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742805674; cv=none; b=LRZErdaKilNnMBimsW7iWicgTc+14/Sz+9B8pRPzbydXR71oNrg6bBTn6NW7vwAjzW+gP28W1KPCX5PVc3LbMIsmHCERbTAjTz50IEoWcZKYrrknhvBsyOVRslcuKgqEfSzW/JpfsYuj8O+33nuCThj3Tge7xxPkUwHrC/K00kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742805674; c=relaxed/simple;
	bh=AFOsIAC6SS0fPbzq7D7EjSpe/9E/6d/qhu5Xf6WqtyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fp+VhNqUtEgHBguvDa1VcLm/q3WSmwuT5gY5qnSsB1Kajak7jjBArBwY9kqm6YPhm1tmFWNc5TGcz9FKKoMKaUQjHKLbeo+/78EP8fjvqKb66RcwcMAJJtusaKT5uCiIBGz0850jSzxxCMshmQtih/vgzU+/a8ghqpxZWZl59Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=BQOc0eox; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="BQOc0eox"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac34257295dso857794666b.2
        for <phone-devel@vger.kernel.org>; Mon, 24 Mar 2025 01:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1742805669; x=1743410469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqyxDkKBXP2Up3UhH96Dx8TXoOJgbv9o3SaMoIVWQrE=;
        b=BQOc0eoxoA4tl5p+pK+LyTEKozxCWGMFmUZJttxNB7EXcd/fD87YBvEC5EoYL2vJWm
         HqJI/UTP22aCeaVl1igHjzTiKxb2A9ntxdH3T80xYpl0pNrLARnaNBZlfJkaX0Zqw/G2
         aoC2OPFkt4yJdQsEleObm0TGqPUWa4591somJ2ggRKwzIz+IeTpz6OcIaa717Fxnsqbu
         HAaf5sDwcgxW4ED7KdUZ6V5sAYDSE7PacQdlUxkLpk2fQRm4xH4YKDj6oyze8grtT2gf
         ZUV4DsYLKBrRIMpuUpwqDe11Nl92a6XNE4saUkcMjZ30DTSWsi2W+UtI27HuTEfv09KO
         t66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742805669; x=1743410469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqyxDkKBXP2Up3UhH96Dx8TXoOJgbv9o3SaMoIVWQrE=;
        b=ecM6LvSBtbmGbM45sU2aBhlsZW2IEojLCr7YKys0echoLuHZ0m5IPTmvtGYO7cr2Fl
         giRhQVoEinW/7mcW64KbD4PSHBUdwRumnc4gpsI2qStJQRhfi88msEC0yCLnkWhjRpry
         wDdImkRNkU6vDHAnezkRnGSfMa/ZHz+/DLPDCbl4OxAIVlQXYjtI5N3ZJEs7uoZ7SOx5
         xV5+NCqfhEe1mBFWPv6Wup8w2ofanlqh8wBmmnBo5NYBCcaxp9/1cbbzJsUZKeNBw23i
         13ndEDS4J9AJrrNXgze7bcIe8vgXkBMq5LtefqOmca7sW/1iEu3FYwxKIx1U5OYeA8bW
         TSag==
X-Forwarded-Encrypted: i=1; AJvYcCWBZvj5IjU+nwrrKB3RPyG5gkFs3wWeT/US2DnFnwFYqOXE4QtH7MLV/HXLLE+W1EhjzEvs17OOWfkR2A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZOFpjBGPcqCu23qu7cs8rehqUvQiJSvpnbJFMQlnajLZhbRj1
	O+lq0pKkCGK8Pa/tsgi5cuLDaGmUvQpXuvxpxOr/VxVr9HBkpY3NKNE9xMvIQzY=
X-Gm-Gg: ASbGnct242nsTEJX5RrBDd3bRyBYFbcLHAkite0COKuM7/PwzSOnyyBRrJCwhj3f0lE
	ZToJJJcZ8LzJ1KUauGzJNvZDI3f8JFWJ9Z5mDg5kdILenldkqlwv6l7Gr/hfiFfwLzeRDv6Rk15
	Px5qwfXMXssumMS997xC+k79n/u3Z2ykuQOOJxq3pGoyrJok7UbPYhjA06Inae0B8dUVIhjHQD+
	bvjsHni2mnSB/zxhc5GV4QH6sK5X9+Qf1Ndm7CvwxFapUteL6SaskDmA6clX5E3OvFSuwn0yf7s
	ycfFeTq3tSfmr8+/kgLauOjFD9y4JIzB4Pu6yQEY5jj6auPffIcJgUnZaiL7gNUEqxXRGCqZl7x
	8TKf50AJeBe4nOga0BQ==
X-Google-Smtp-Source: AGHT+IEIbECex1u2sz3obxMBVg9MXWDK5ZdDdAZm5/qlaOXilZZG6R+6m05Bcoh0lt+nXYcl9z01hQ==
X-Received: by 2002:a17:907:d88:b0:ac1:e31e:de0a with SMTP id a640c23a62f3a-ac3f20f7101mr1341850266b.12.1742805669049;
        Mon, 24 Mar 2025 01:41:09 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0dfb33sm5715937a12.68.2025.03.24.01.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 01:41:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 24 Mar 2025 09:41:04 +0100
Subject: [PATCH v2 4/4] arm64: dts: qcom: sm6350: Add video clock
 controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-sm6350-videocc-v2-4-cc22386433f4@fairphone.com>
References: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
In-Reply-To: <20250324-sm6350-videocc-v2-0-cc22386433f4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Add a node for the videocc found on the SM6350 SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 42f9d16c2fa6da66a8bb524a33c2687a1e4b40e0..4498d6dfd61a7e30a050a8654d54dae2d06c220c 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1952,6 +1952,20 @@ usb_1_dwc3_ss_out: endpoint {
 			};
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,sm6350-videocc";
+			reg = <0x0 0x0aaf0000 0x0 0x10000>;
+			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&sleep_clk>;
+			clock-names = "iface",
+				      "bi_tcxo",
+				      "sleep_clk";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		cci0: cci@ac4a000 {
 			compatible = "qcom,sm6350-cci", "qcom,msm8996-cci";
 			reg = <0x0 0x0ac4a000 0x0 0x1000>;

-- 
2.49.0

