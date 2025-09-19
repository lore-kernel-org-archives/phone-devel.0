Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE472F28EB
	for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758275966; cv=none; b=coauBl6WxriObukmFBr6g4IScHLgxCLu44qoxnscDDdjXTqSNplC9YFgu5o1bkktbFSkguTL9tAO/HYUhEAWbCV4qxzOGqjZ5X+2nKa1wgfz2G4MqCxOFP2Ug585L2A3Ev5HO5Zdz/SNE/66kAqcDPv8AvuTiWC8ii3jo3URHTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758275966; c=relaxed/simple;
	bh=OUZ9IG+km58rNt7HS8env5yNHx5mMi+2MbMDqULuRsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJk5Xc7dsoTUBQVHf5oDkCWPduZCSWpjZQ1PVdmriQZGTe9tYIguelr1aXqtJKMOamYAV5RCapIFQdEN5oKf4Xc939Jv+pWqaaJQYypSvK0ouaFTtFlXnErRkfJmAkdtdZeT4EdCwIoUuhdzKVcHGKSPbJ6nRKrRhB+EC9qGp3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PhZx8bOw; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PhZx8bOw"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b07883a5feeso361561666b.1
        for <phone-devel@vger.kernel.org>; Fri, 19 Sep 2025 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1758275960; x=1758880760; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1GNGqseHGUM5oQ3biZBBX1kDZS/D/utgJSKJ0QYFic=;
        b=PhZx8bOwCbj6uddXoMcvj3L5E9ivOMXdCociE+4ZaUcQIxjiB6ShaPqd7UhCxAMZLG
         h1Ae4wUT1NVZaH2CCTVprf+Rd1JQdhG8IHQHFGulfujv6Ibhu6NQz4l48au739btb5fe
         v4PgEFcHDz0BODr48ozEEQ1pnexH5s31yUaUlSXAEyhqnnhrRKIUUHUGS9lWxKlq0bFM
         5WhWIW1D4ge0K0h/zUvgXQ3hM29eRGiO3W+jEEGbiAfBYD8mwQWsi5hW/Q9JNoirdGIZ
         eOXJz/DqcyW+290sGKiUKalS70kK1vAw83gV9Ccn0w8ElHy/EyNbZtMjH49lQcKoIhpQ
         YPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758275960; x=1758880760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1GNGqseHGUM5oQ3biZBBX1kDZS/D/utgJSKJ0QYFic=;
        b=QKkIlznyrv+dJLoMEv1ELEPcJhhMQNxozsHF25r0o7rOIa0Dvgz4ybVsPnV8czuwCH
         OSdh1mExhGhscbvwoWg0QrjbjGMAOQMUBD2cWwHHMyTKkVKwxy9A1ilpAxuDlMVXFokS
         EE3OhmvNG0yc53gggrujl3TfLwn7OSb7sjcVTopHEcGqjl53tMV8DXSD8xl2hRTxv6eO
         0MJqBaYQntBI2XpK7BAoIU7D7Q09X1nkZtLKPDf/ucWZyfwY1YBE+mPtSJp02TBalYgX
         rl2TYE4k1XV+slg8I6p7L71DHEos493eDBb3HbPv2fq1pAiX2DOxfaeel/vD/Fk62DxP
         w6Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXmlLH5sqRCm7uz1aU4weeNCrErqFRxwVzfNWJigKnhriEpC3m3y5b84BxrD/r66Y59LOzr1NdnYcrEdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdC+1Ekd2N1tem42IQZWpGt8xvwtgzh/E1KuD0HGxhR+iWisE7
	zEOThpwp6Z8EmHqbWJ/sHDNvMUQgDG2VsuCGM0M6A8eqlhXQFnixo7XbVckvsYfRU8Y=
X-Gm-Gg: ASbGnctgBo8B0Ockt85sI5RB4GOQiqAL6SfzsIQY3rRl4iQosq9fjUlZgNnne7uQCws
	6acg3uJSCd5RSrEmVfG1/uDZaB4Gd1W1FHLqSl2uFiM5qoGt0BfkDjujN7YXr6AMDRteHFwnG1S
	FzacwfZ1b7DfhlXLV03JvgEMmbBEmiR/udn4cjyjph2GrHe6NVBoGIzgLNJbbinjwp1114zHkvF
	qwcHSoE7Vyr6zIRJV+yrXAm3VpOOU+baIXfHm1fNzHlVHsKNk11Cw6gUPnclYgXgclggBSUZWF1
	N0tFdzDJ/zd4IXY6WmA6x5ip9W0sU73X9cml+HdOIN45zsTDFebWKuv3tog9cUrpZcTxWGIoSJm
	VvqRa9H4l+OlDP2XjUYPV0PDD9WVTkEpMQwCcy66f0atz6SInSikEzWlV6Mffk2SkqNN7iQ==
X-Google-Smtp-Source: AGHT+IFHKKTi2KqgiASniTO0Gp9RLI9E4W0L4odjaW1XLQBKa1rfopUp5lUHyoEfK2xYfnHx3ihkQQ==
X-Received: by 2002:a17:907:7204:b0:b23:74d:b0cd with SMTP id a640c23a62f3a-b24ed887037mr267162266b.3.1758275960218;
        Fri, 19 Sep 2025 02:59:20 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa6f03008sm2972107a12.7.2025.09.19.02.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 02:59:19 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Sep 2025 11:57:25 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sm6350: Add MDSS_CORE reset to mdss
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-sm6350-mdss-reset-v1-3-48dcac917c73@fairphone.com>
References: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
In-Reply-To: <20250919-sm6350-mdss-reset-v1-0-48dcac917c73@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758275958; l=960;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=OUZ9IG+km58rNt7HS8env5yNHx5mMi+2MbMDqULuRsY=;
 b=itCMelDsenKT4NC/qIf87Yi9X7uzziQSnVu68bi4iCRJjxZ8ytLv2YOjIJ4rlkqTKGrcilOBW
 i3XJ6jjiISxDxjw32haNv0RDzcg5kyGbOW4ys9WXSkcGiROIp7JJNDb
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Like on other platforms, if the OS does not support recovering the state
left by the bootloader it needs access to MDSS_CORE, so that it can
clear the MDSS configuration. Add a reference to the relevant reset.

This also fixes display init on Linux v6.17.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index ff1eb2c53e7b865350d00ffbfa82d7d1e3cc5aa0..929c8a8b2d446505228531bfc55f3350ef2980b7 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2150,6 +2150,8 @@ &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
 			power-domains = <&dispcc MDSS_GDSC>;
 			iommus = <&apps_smmu 0x800 0x2>;
 
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;

-- 
2.51.0

