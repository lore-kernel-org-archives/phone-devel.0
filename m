Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585905;
	b=rX1BjG35J32yKay6r1Ajvrj1LCx1iZ10XCbX6zPqDO7HYiBwi5bJMbSOvJ4bhhbtp7Ky
	 ArVp/mTnJucEo9ceTjWnHbFCB/BSEAUloW6gwFLFj0CBVqdk63Gjq0/H4uufzpCt+jmLT
	 d/djkO/TPv1b8GArndu0jhcn/yPjGTgA9DFnmNK+LY+ym41tSl0BfTEgQOYt9Hk8I9hCg
	 rB7t/NNaBdXDn/v3ZKpfzTmovB+QEfDCTInw+U+XRpKmfmKo/ZGhp7DatZnqvE2rS1uJA
	 u1yO3Ow38E/9l6ndNyi6FNTvMjQZAAjFlWxuSQ9mkRhp2NMI5lH4ZtK59E3m+adR37g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
	b=ZiwihFVYUmMg70fIqlFsKVfFJKmTf/PuuIuZDsDMzqn3y92w7B/xWSmxjBejNylKyuEh
	 L6iky3q+Tkva2FM2l39T1RoqGpeZ1wmPFOrT0f3eS2eEgrg780b3kwc94Ns0pvKEIM8Vy
	 v9UFErjMS6CWxt7DeDb2/CEnBELjRDmh81tVSfGMb2/EapdNKFwBOaA6aryHbL5iaz38F
	 PKSBXJtBt7f/Y1+SAQH3OBTJTm6Ulqr9Fisw2WRfzHfBvXEzzdasD2ak48tCEyi1ZBSUO
	 eTrzRMHfm2IYTzbAtcFqYSkJw+oEFVe9cv525SeOTzQmQ/hGkdHx8NTYD6ExP1h3agw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=CsDLFnXt;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5E560A6F6F
	for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 16:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F5E560A6F6F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=CsDLFnXt
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso2265768a12.3
        for <phone-devel@vger.kernel.org>; Fri, 13 Nov 2026 08:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794585904; x=1795190704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
        b=CsDLFnXtB3WQ1uRAtL8aws3SolQHAtawncLSuzZPxSkA+bkQI1GAq54XPJex/Ud0wa
         EKWnT7UnEAVaqSpnyo32Ah/rEBa4EZSOOv9HFTpYrKnAHHrMrFRvbXVX+l/zeWSK00uR
         cyQhJpE2bgjnpBr6UKRN1a2QuYXr15PO7++KJLHnTIf4ZtGjlMFN68qoP4H+j+lT/kIf
         jqdG+IjYbtGtMwJzN5AaX31+8wOvMxnMu2IdVCLPO/xrb3qg7HNBi8Hsy4Q4gXuwTdwl
         JF7s93f6rXH0EgrcPxwC2lWZygZuw9kytyklugU2pHYTmMHAj4xrfTMrhfrtwxuJhyK4
         1qVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585904; x=1795190704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
        b=Q4PsYbUbUIaMIoh1Gcwk+MXEs2HRZscz6ZkojdsuwdfX0Ert0Bl+trE61j+mI+AoCx
         +SB4nfORPphbRsO7CzYFqeAD6BKQFmr8DbrI6FumcJV3RxzB3ZJAeqYXtSfqEuKxvaXQ
         RFc4IgOF0fILpg4qRDCJoHyXQE+xbn2CLv8uTgEbWoj4AwBup40CRLc2pDGrPMJ4KtSI
         HKlJBh8YuEeLz3fZ4uXn5x9vLHufIpzUzT6WD85qt6bC7uqLEKJomOmUozvzKJUOny/N
         my32NTVoucSrMhtWbBgWwpPY+yEgijI3bt55hGVhyFXoGiqnuxah4eRFxF2n6ABNNLh9
         15eQ==
X-Forwarded-Encrypted: i=1; AL+hErFrhOWfqRy76XteooLFxb+GUi+bAjWNRn8dUeGeMw4o2+smx4qvAlRkPd0Pp+sIWtsdZlzyogMymzyH9g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/TgSfhBOfhj0FU00WXiLjN/Bn3d2VIfVtBJsrVqc7n8tdhYCGl
	9Tx6A4/xzOpDH6eMtMw8vI4NRbLmvrmW5EkcfvPDwSz9r5InP5uKuujAQM1Yh22yW+g=
X-Gm-Gg: AYBFou19PjVx0r99RaBwDlPCeVknONdCj3QQOWHmuYF/sSxsTeY5bY+Wy0onFbQ1XqP
	NjKjLuDNLGCrDkkwRI/ZmRirxaduoui07TJMGiB7MPUaoSxWAHmoN7YuAb1yteqKsDef9AkBj51
	NQuoXObggJXO0xUgSp6r1KzxGndJ7sBLqDnnqVvL98QZsWnmoC3ur1hcU6/e5/InWaVNUTzw4Wh
	Oqz0esKFt91ZUDD6Vh3sP1a8PKiivuUzptLHRYk0YiBRzfnKgeYU2nR3nsyfF/8TFCiV4VfoQdt
	fNog3dFQ+CERqOzNcFkEQ3fS2WI3ulPDXbKxTqAuBN28pHMRZy015fCWkFJIDAIx+ExUqXT3/Ph
	b+VvghbL5gESqYSToMxtiowwDeDIIw0HRk282tqQhffgEM18WFcDVrzO+kCyvlV0P/3prUrHXUV
	8QxA2jZ4J1HYl9HR+gHamzhVkyWV0fW5816n5GROWoyK7gtvvLm8N2TzdOGoB08RMafi9W9SCea
	nYkwAd/XS48taAzNeDTDiiEJUXhHnr9FhIOqUVHhgt9AOiYUUNFm0/toW+v70QplxvLIk/J8Bwk
	4SYUD71+JBPz86Ba4lLFPQA9Uzr6BdgdwTqkb8EhzcyR3mTWZNaj+03gnakJlwfZvO/66XKVj5Y
	5mEM2TCo=
X-Received: by 2002:a05:6402:c4d4:20b0:6b7:8ace:4bdc with SMTP id 4fb4d7f45d1cf-6b7c0be5dc0mr2076346a12.29.1794585903767;
        Fri, 13 Nov 2026 08:05:03 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c264d99csm1123946a12.36.2026.11.13.08.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:05:03 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 16:56:45 +0100
Subject: [PATCH v3 4/5] arm64: dts: qcom: pm7250b: Define battery
 temperature ADC channels
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-bat-temp-adc-v3-4-743979a8fd90@fairphone.com>
References: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
In-Reply-To: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585895; l=1412;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=b7mnu5CgjN796/wKAPryTmfFj9uk8BxPsgl2XchGimQ=;
 b=39kPDo0KhTsrVvnjKB5C4HJbyboZEw6GYyL3G45auk6/fdnDjvSVTwlOddsdPKaBb22KYj5re
 PV5Oqu4IxGcAOs2aPblfI2Ry7nV+J99UGRYwq9dKkZe/+PFdMxVRJ42
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the definition for these ADC channels to the PM7250B definition.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 43cab07126c5..91e83587adf2 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -155,6 +155,22 @@ channel@1e {
 				label = "chg_mid";
 			};
 
+			channel@2a {
+				reg = <ADC5_BAT_THERM_30K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_30k";
+			};
+
+			channel@4a {
+				reg = <ADC5_BAT_THERM_100K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_100k";
+			};
+
 			channel@4b {
 				reg = <ADC5_BAT_ID_100K_PU>;
 				qcom,hw-settle-time = <200>;
@@ -163,6 +179,14 @@ channel@4b {
 				label = "bat_id";
 			};
 
+			channel@6a {
+				reg = <ADC5_BAT_THERM_400K_PU>;
+				qcom,hw-settle-time = <200>;
+				qcom,pre-scaling = <1 1>;
+				qcom,ratiometric;
+				label = "bat_therm_400k";
+			};
+
 			channel@83 {
 				reg = <ADC5_VPH_PWR>;
 				qcom,pre-scaling = <1 3>;

-- 
2.56.1

