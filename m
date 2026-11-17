Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903870;
	b=sL0oe46/2c3X9q9NNEKe4y5HesdRWr+ASRFkKpTKyKTOk1iUYTu2s1lIgP8i0aOSeISc
	 pEpm1bOM9ccks30+TUKBiUSccxAKw8j1NSYdqL072nnvKS78N31XAAEKlMhQRcXfjbd1d
	 iIkeZZBOelvsbFmjPUmidAwclXLJB9ywWNRqxU4fccGJXwR4NloaA6s7DQba/UHBCGaza
	 9Ki0qa07fzHTcTF0N6aEvMWyxTyNjlZi3kGjMgyT3OJgVTXRqN1Yz1vJab5obeHvGmaYe
	 j/bS+4CC1v208EtdHXr8NMmAiFh6wRfV1zJJ1WhESaDSpUhMy12nIzTwetnnpigIm/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903870;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
	b=03FKMqPb5qdkUflKQ3eUiMjyNqQYZYUDjEr6+MLUbpKRwOzZ0QcQkXvJQN00imnk1VtA
	 bVzQBD5FeHloX2gHUWs4MoThr8Eah0V8oMF6ckB3jSBQdgRscFqWQ0boY/Dabzm4ExbRZ
	 lVXSEPTkiL5+//Jl4P0yHCY+JvvhAAU+4yZe90BDYo07qoZnypQn/rWIfQiu+NkSSkV5h
	 H5TF69JHpZ88QmmRentlsUjxjW69l0Lw2AE4DIFcBaS3yXoJntvYQ0SbOr6zLax06zfN4
	 49DlkLpJVgGmN2bdlz6eTfMM3ha95cToynNgEMKUe8j9v52ZxT+TOVNCImtmN9aVYzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=SHbfSFnd;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0630660A2602
	for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 08:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0630660A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=SHbfSFnd
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50aaad19fbso345739566b.0
        for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 00:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794903868; x=1795508668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
        b=SHbfSFndESk1yY8b/OsbMm/euo3XP110OsJVHrsLsdYSpOY39tPL6ns+z+sdP0oJFk
         khgUnzyP3YKajHvNhpszCJiaRzKRtMHkVX8NHWr2m6xdTSFCkJU4ClvYmgNS47iMqn4G
         MHFIuQFpZCo4vBGjxab09RtA+7HfZ2oVkncRvzSkTZ6cfeuB7KTtE4BuPY3EDJRdjcQy
         rShqUqiojPjqHm1NaYlFFxn4ErPnsIL6rn0ToRgLYlEY44TbdaQYdlDTMUIDSsEtNCTE
         K//0K3ZfoWwvtEJJmfmTtkf3aQ0EqnWbrYdeUoEqBUPRYmpIiWaE/5EELg2nOLU5GFEt
         jkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903868; x=1795508668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw3xnb7M3ni/K395S76W5M9HsZ1EBFx8fzPBd64UQdY=;
        b=cPpVvMSvuTox8SQ1K8Xa1dD8cyevd4JT+5NHb5vCieXV5LX1kVPnTzXja3XtUNJ1fl
         KeFcrjy2tibg8O9eiF271BuaAmp5BiXjAEzSCOdC/SkDoh1z8Cas8mjghuA7+Xm7vNfQ
         HpzRIJm7SGu6Brj1kxJ6QU72TqYYpjhxIRBZB0C2VQw55CDKRHsqR0yiIRyiukQC/P4r
         5RruCUVZFB7xeAzv7dMTHG6I7mV4nhEzvbf6ybxGZXAP0TMbrMArskAxi9GJP6vhw1n9
         InncR6H+YC34wU2EFrTCUFw3T49ji1kaHB7wSusWay2jxugIFdpWFMsZdUtYLxya+ell
         hCDw==
X-Forwarded-Encrypted: i=1; AL+hErEYndbSHh55e/rzPfjYxrtMeWA/aEW7FBSYgOiSC4Y1+M21CqJHBVY4xhvY/CpuaURk1UXM2Zzv3MGmsA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+8fsUQsXr1lLx9PZBZPdECxiTBJOo9gS0jWPWh7jrsW604K40Q
	d2TmbA8AJsdMCpYMZD4lweXwBQAWZVubLh72/aeP8ato7mf6jsa9O1DHJsLbN/Hk5BI=
X-Gm-Gg: AYBFou0h6Ptb4VJFoZaTh6gYzXfkI1QFEnhMX8xf4KvT6J5/8r6BvVWyy4HHase+n04
	TjyvW5C1TD4wOpGz9G61uVTXbNDm4ZNl8ctTr50cTzjSufz6TkrpeYImAFAYW+levWWYinfaUue
	tH+1cYDXTkhJ66RUOAIwd7AQtnHigFwaLTJrUeilbncYRxieveupA1xL8UXTVnkEu7UHNNGHL2k
	8fUUWpYiFRgwoxOm26cNA3XpPD9d3sBGv0pjfEI4Hi/aL7fdA9Ks2iP/sazal0WPJOK3/oiuqZc
	7+0lEc/VvTl65InTypv5GUFsSigBYlzM2UFPke39E+GQrXCrtYDY/vgOt3XaB3NCBg+vdgPy8hX
	ba7lrAE9IjOejXEpoOHUNB5YlThUdo4VmWUfWrbW1blzaxdsby5XnKOyw9GoLBBFxfYea4Fe3xr
	nD2NLiGmpcQJfNV28b83nFo24KW2pmnlDafMApyUjllNjw+ByI+oZ23X0Oh4poNXQKSbWvcMinj
	t23FNopkdQrrjBdL66SxKqjenbulQ55BwiR7A0vy06bm/K7RdLdSWFVEoWDbHwxgYSiXpmb+y1a
	kfeEFbbbS87XqONXaVYa2b3PRopRnespWe8rVF0Z7tkC89sqzTmiia0dUnL2VAld8gOdnV83rd/
	h79gFlqgntFhdKUB2KE+Csmnn/51DodUIyYlvuaNjvm0INxbm
X-Received: by 2002:a17:906:7315:b0:c42:fc8b:6c7a with SMTP id a640c23a62f3a-c5096550449mr1132986666b.41.1794903868527;
        Tue, 17 Nov 2026 00:24:28 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5616953a12.9.2026.11.17.00.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:28 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Nov 2026 09:23:14 +0100
Subject: [PATCH v4 4/5] arm64: dts: qcom: pm7250b: Define battery
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
Message-Id: <20261117-bat-temp-adc-v4-4-14d5d309ebfa@fairphone.com>
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
In-Reply-To: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794903862; l=1412;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=b7mnu5CgjN796/wKAPryTmfFj9uk8BxPsgl2XchGimQ=;
 b=IEavwQRoBZ9J/7BaFptQKLVBcbOzlROC3o7elEG/KJxaOX+vWhvHEkOrTZSwFs3fttmOJJc3Q
 PHcebENwoAHAURwSzKsaLbonycN9YknjNtC/PDT1eB5SmaSrhF3UTW2
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

