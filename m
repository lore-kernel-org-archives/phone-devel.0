Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338CD12AACB
	for <phone-devel@vger.kernel.org>; Fri, 16 Feb 2024 13:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708089085; cv=none; b=U0151D1Oz4+UfhMykg+wsLVWbiiqC4PHKJsTQEQXyVPn3fdObo8Uu8jTBVOOXR+VmaEqWWryJ7Loc9MUPsvHC6a8SyHYvHfgE0Kj565yI2wcF/iXmdUYDBQkJAt1TkjOXoSB2eZ/S2NE7zC/XNd+6JzqdYgDU69opUJdGEIB3s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708089085; c=relaxed/simple;
	bh=phFHjxICeoeu2UXJo8Xg6HVAwWeWLM3vTEpsjnGZlm8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RwaPxYq7ftqaX6A3CB9Z6/9Tq3+q3HkN+EgjF18HA01ftlOSOc92x7p3TjijQhbYDl+d90cMNMWDr3XidSfJAnuCLMNCzx34OUQPdVq+Js4Dwspl7HmLm5NIEP89XqKgAIZ+o3KpPjn1vX4oIsXnWAb6x+QFleGUIunRPeLNXvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WVRSGz7g; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WVRSGz7g"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d1094b549cso27591901fa.3
        for <phone-devel@vger.kernel.org>; Fri, 16 Feb 2024 05:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1708089081; x=1708693881; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kk2nrxcIZOnYIUymYqv99a1uv9GIViFiL6v2nz1/iKc=;
        b=WVRSGz7g9GA+1oMk0gJ5vijG3H6zxrjeZNnz6SMB6i4Au6RUrc8JqOCPFDsuRsQ2my
         r+5FbrJudilPAQS6N6481ajLX+4LeFnwUudwJNdXz2zRro6QTpmajdY4UYjJwPB2EZ1w
         1UL4EgH7mHbr6rXyBhkvWr4Hi1KMLjV+W69QPEG4hqA5dm5T9kFtnjl8SX68H34b1Iqj
         uoW87oyEmkc0Tzrbp34LUoT6dTl4tf1TXg3nAEO0nAP3lECrJpaUVdA8IewvgUBJmNxt
         NbIPxJZ+Wue9OQ8jiWxcEn3N01B7h7YZmc3R284PiGUmQv+z7gQHFaDRFOKFjo+vf1OF
         4t9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708089081; x=1708693881;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kk2nrxcIZOnYIUymYqv99a1uv9GIViFiL6v2nz1/iKc=;
        b=fmEhZnAyO42Ln7Vlq9BHE9TNzsCYIxSzNeSkxJHOMGp+xfEDpx1CygNXDTfMqqIWcj
         IIuB3Ya0Jrg6bRdgXsYGbsrClJvpDgHBGVYZqNk4/mJ96hIMcMpAqyggruubSbND0rG8
         uUkzVXYVhGun3CD/SEtCPOqsvyuxR7FLkDu7n7g09FxE2Z/V3OwXZ+UaGvqRwuvL2WRu
         SCfKy3qPPb/f7NUxUZJsJalT+/a53as5fVw/5KU+MBCqtZzk+/Sa9rgL+AQS//yWURZu
         ubQD6uS5AHwnl98qCsm9djJiwh3xAReZ4GnstGPAnC4WuKUCjD707R1mDmAVMOic1w+y
         Df/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1o/I1nluDZ4jkn/5tDdDy2psfqTo6ByPDAHDZfET2p6lr7VjAZzUV89l9DTL5wiN2aRUUmczIFIgjI1C3mXEaBo0i7erOHH3bSIQ=
X-Gm-Message-State: AOJu0YwyPM3M49d3Kk+7OesWJMnVcEG/9Yx9lyApLQKxaA38E/ELbO5O
	XeF+pTi0+nXrlmxCkhJasp0l68E26eahWY/CueTEaFZN4ddRUH04le2Nr7VQUxlYVmLlxJRd4xZ
	d
X-Google-Smtp-Source: AGHT+IGuDfabpFAea5gQEjZpS0uYGtn7s9Z0/VOzjWdm8DInuK41Bc583vkce37p7mlnxAx096deog==
X-Received: by 2002:a19:2d16:0:b0:511:aae2:e5e8 with SMTP id k22-20020a192d16000000b00511aae2e5e8mr3275183lfj.52.1708089081157;
        Fri, 16 Feb 2024 05:11:21 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id zh14-20020a170906880e00b00a3d35bccdf0sm1535323ejb.139.2024.02.16.05.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 05:11:20 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Feb 2024 14:11:20 +0100
Subject: [PATCH] arm64: dts: qcom: sm6350: Add interconnect for MDSS
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240216-sm6350-interconnect-v1-1-9d55667c06ca@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAPdez2UC/x3MTQqAIBBA4avErBPUtL+rRAuxqWbRGCoRRHdPW
 n6L9x5IGAkTjNUDES9KFLhA1RX43fGGgpZi0FIbqbQR6WgbKwVxxugDM/os3OB1bztn7WCglGf
 Ele7/Os3v+wH8sCYvZQAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Add the definition for the interconnect used in the display subsystem.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 5e8c8896ba66..ef4d847c4acf 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1973,6 +1973,13 @@ mdss: display-subsystem@ae00000 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
+			interconnects = <&mmss_noc MASTER_MDP_PORT0 QCOM_ICC_TAG_ALWAYS
+					 &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
 			clocks = <&gcc GCC_DISP_AHB_CLK>,
 				 <&gcc GCC_DISP_AXI_CLK>,
 				 <&dispcc DISP_CC_MDSS_MDP_CLK>;

---
base-commit: 84c11540697ba996a7f55b16565945b52db3019e
change-id: 20240124-sm6350-interconnect-a9c2857a5594

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

