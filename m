Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4429252900
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 13:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569454; cv=none; b=PSS/wKxFpzdhJdt+1TX9V/src5qkz+7gZZACsfvpHMYybCf4p1DH6nEOeTidwpRHHAuOU0EIhkmPCktOSPziHN4ibsHFg2TpmPDOFoOcZ+te0gibMHdHWwg1cLLljt7cc0vaJB4GR9HRe3RmtjjRYvUt2AERC6fNDwDzKTGQkbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569454; c=relaxed/simple;
	bh=v3yWlx3GbotL3G9AhcSN50C5SpvFDf2A//QxTjb64Xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fna8gZgRUrWimbu3P51cVRHyHJsgRmEuMRw904G2bW6seKm45E5MKdKvPwJmFcLZjIVprmNkV5ziNyXBgCcrFEd1GCD8wwbzsoQqyeila6rl5dKZ+hDVjYBqpAuK+rMCDK8YdLMzpPEY48VEtw9mDsTiJgvCmGiTjF9aPyTx7So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=be3WEBYL; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="be3WEBYL"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b872cf905d3so335609766b.2
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 05:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768569448; x=1769174248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJgg01NaZF2IVCPUnfeyk7TRyWFsft/f+OKB8cHgBK8=;
        b=be3WEBYLr9CQ8Uqbqh/EA5zPkEV/7hU5Jz3ypwBG0e9aSBTlqKJGbZ4u4eWPet+gdh
         shzQnn5Q5FFynUD5mizZ7QvHkgU5ruktjLctez4uCwUsh4lE5xMadbBfH348kl9chRI3
         kx6GZ7w9ubrHP+JQU7yTFZn6QZt3+7vYNiNzqyXt5op3rQ/mREwzSfZscPSCw7B916i/
         OljF6Tp8xDVIkbB3rWb6joPQ8Zv++tBZnhHVYc4xvzqCX5yO0fhZW0UYEVdu8YQyJg1z
         y8AzmtxG59iorijbkrEQYsppYqhv0InXGN8vJ1W4JJ+eIdcNCxULdk+LCSGs4KVugme/
         Pr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569448; x=1769174248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gJgg01NaZF2IVCPUnfeyk7TRyWFsft/f+OKB8cHgBK8=;
        b=KsJBADhtZzoMy1s2U6XZ4JI7WyE21dgp+aVlNs0Z1AkRIABKIrgf+xGXHcG6CHWFeN
         l5JLn4MMtkUhkzvmIFw9HsjQI20PPvBDjdp/yw169qKhAkcyueIyheaqPDfEupgpeFeN
         1m+6W/eLQMhAj61SFOJp1VXPMXBICkcBaYelMOpi1KTsNDNJSYqP0QaTHt+mFhQIMmN+
         lKrLy6mBTqIUIgE69XOWDopFJXCrzkySMv7s42EYIJILJRsDUSLabNk12ZDoKJNi2niU
         c0+r4xpOk1jEDjTXuNUXPkcslDp+ac/66J4378HewjhDlZ5NIpudjGEZ+RvLKDbNksHV
         PkCg==
X-Forwarded-Encrypted: i=1; AJvYcCV91wDhH6tzFvIvKT/wmsOrmtp0S1o1PfeLbPtlj6iWpUg3nTF737Elotn/nmgcLvF+UbfVtrJ7E9NkOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKTJZTl8DC+0vEFyVv8oYKsqmVKqmPmoBJNSLZ3QATs9r7fy1/
	di2vEAd7Tj1bOUsGZgHIG1HC3QTyechKX1e6xicX5uGyXQ8gKnRlHQ7qh95+mubKZST4iqf4HZm
	Y/0Vm
X-Gm-Gg: AY/fxX6O6ecPTq1Lr0ZXvELZIcx8amxyrzxS6WqmFVjI+pJTAxbHw1sgb6o77e8NvHR
	mDGdP/S5uqCqb90owRsPVplHSgM51+oggCco2c1RQxSVFweDR9uppaYyTp/KXH0mPoJSLdi7++D
	CprKTX2clZVj8TtnpvoMU8CQPT81Zf6CpVN6Xfbcass/xI3mgFRSyerYx4+IY1O6Y9oE/p/cwJx
	BTM0NbkiZqGM3hN/Tpay916NaF/8uZyWWI8u9sIum/xm0+ccGFWod3tvTCv6Wnnt04+HOECZmRy
	y6XdcTZC0ZcrlqZCSNbIj/w9VaGBK3jb6VIAGgETb9Fqtauy4ffvVgg+0gaQWSeJXx/Ke4c8xoF
	HYMK/K1iBG0tE1bRxZ4XiLI5FTTia3BWvmCi8f2FTp8k6aXioeLInxayIEds96Yoa7Cek/TJ1ri
	a/2nmh7KejoXloAFFmfcX3SvoxjnS2o1wZKTvKEmNZdJPO92xMeaKVkhLpXhyfnVa+
X-Received: by 2002:a17:907:940d:b0:b87:2d0f:d42c with SMTP id a640c23a62f3a-b8796bf55e7mr207695866b.63.1768569448338;
        Fri, 16 Jan 2026 05:17:28 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm235507366b.69.2026.01.16.05.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:17:27 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:17:24 +0100
Subject: [PATCH 5/5] arm64: dts: qcom: milos: Add interconnects to camcc
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-camcc-icc-v1-5-400b7fcd156a@fairphone.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768569443; l=934;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=v3yWlx3GbotL3G9AhcSN50C5SpvFDf2A//QxTjb64Xs=;
 b=7wylF7yqR/1GoCG7yFRPMLqJokhikSOBv5u57rvVqHFkqjHgqmzQMvlpMhfx0Dl0hM+wLd8sL
 nNihUzL6AQiDwGvEwHERwtwD5doSABLP66k8esCiKpq1FwIUTJhh9H+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The CAMSS_TOP_GDSC inside camcc requires an interconnect path to be
enabled, otherwise the GDSC will be stuck on 'off' and can't be enabled.

Add the interconnect path so that this requirement can be satisfied by
the kernel.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 0f69deabb60c..58b4c2966df1 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1660,6 +1660,9 @@ camcc: clock-controller@adb0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.52.0

