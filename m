Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C206122F16C
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 07:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745564937; cv=none; b=qioOY13zo8oi7cxab2SfhL5njqDfipJvatrfv2b84uwsfcCGu8IonoS56C3bXCva+6x5UuAgO/h3TIUg3PkdAemb/XnH/YX9t9qkxOvn9TtgIpDd3Fc6zlj7x4KIcVPloxxKvB2466Tetir4zkLJbj+erZW6+ou/xkS7Fde0Auk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745564937; c=relaxed/simple;
	bh=Fdj99F15NrodmliHWNzqnIaLNDZ9brmDoSEheiXAMlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XBrbkmr3z8e9vgVxW2aSKPcmQ47S5tPhliAuPmVljQ7NeyoKRd8dU9tmF+W7nO726To3d5zlcmgS4ZmWq+2F2CsQ14hb8/6k0gZC70s7X7XpKQATqAF9PQTFs571Nj1NXzNg0l/AyFRckofarGkLNM+Vcr3znE0raEUH2zKHBNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Fe4XRcHX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Fe4XRcHX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so12309415e9.1
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 00:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745564934; x=1746169734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vypambs+vDzLekBB8IzM17TAuFHn0wmPd4bpg5X3/QI=;
        b=Fe4XRcHXWMTwmhtC6z8zpKW+zDzlBEGKcVobEE/yrz973VErnxHirWdTfYYvUEU/gY
         zHW+xM9IrAhOEr9vBWoc85a8dWkscwfCx2dj8Vq2a0lwBPwc9jXW7dX1mVyLAipobVKV
         NSPH7AVf1FPA7F12unKGm+1NxtkVs6bkSwXTtKpDNCWOG5gr4wvQKsMlGqpVBeGjMM8t
         nCqP4QFStDOX+sZGihVkIm5r4MJhp3fThLjstaw6wwt/w+1r2vi4Dg+vGJM8GEJouZMt
         U0lXiaEAXerDtMqZvxIiFd5rAAH496amvEcMJrg45SzdDcjZaTJ/MB04u3lG/tNmvkMa
         WO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745564934; x=1746169734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vypambs+vDzLekBB8IzM17TAuFHn0wmPd4bpg5X3/QI=;
        b=qD2I//mNmudWP3IfgdO5r057BLo3gtMwlPHNv80OK1QDqtDE9Alc7b9W6Rs1LUBQok
         /1v2G08bp3CXxziMbun+c3y4s0M23JRLgb8ffEvfclrN5dceUMtELiKZc2gijq7AfTzQ
         /caW85lyXdqah9qiClFc84/kSECo1EsOuqw4RXLnAzHZ18wU4dCr/RC14fp1c/kgCPlJ
         EzDL5xdG1BAU9My7kv4MgwcVTgO5G2L0ir/YNKREajUcYPKEJ/Y14bnCXnTiy4ciwIgv
         V6iWD/6TIwczSCF+nLAzwQbQC+jcxH2Hqn04lSOfPuuzL76xGshQd9YAVkA/hcKCKoqU
         DeYg==
X-Forwarded-Encrypted: i=1; AJvYcCV1/veOD9l5k9rIzgG911zIiNhnClv0QrQpguP0UXcSIFiWVKUUCcI3P3K8jlUyx+e5VH4peMCnBEVMmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSpyFGHcl+aBymltfEIJoOlyKuiHdlHrZHw0iknzXQZ9EsPJqg
	3fub9H+C/C393oHlfdRwjO4lCO+RB1NVTzfTTIBYrAAarma5/ccCh3agAxQcaFk=
X-Gm-Gg: ASbGncv5QmhdulI2kEgZ72TOBz4Z+deko18tbs2H9pQM5LdvJszw7hAMFrjuA/BPWsh
	mWssxox8/jyUO+jsOg7j4NrM8U+jkN3gQa+DvYS+uIIW6tMrcKoGKWdB35gAq4EHfrWSP3OPYiJ
	20v8tWC2NBtOjm0LPEy8U3z9iP9mwRhLJEbw2S3qGqqES46prqBo+cy99Eitu++lYcDlAOZ2A/5
	bngupI/cdJqD1S886ln53Eyd6rwbX0Gk4NkcQySLGy69RF79JHXV8CaXu9E2Z1cgPVvEg73uO2M
	eJYJV3G70ZHTEggm/DFgZ0e9DdvKY84d9ZpkyXJTKH04NM9tLpyIvWIg3iELSkoNFHwywUIZmQc
	dvWptHAuOFdf3KCGxMLRVR+vDtgpfJOnxYedRaLMjWj/y80VCcupJjzPN
X-Google-Smtp-Source: AGHT+IGS9YIDgXntlFmkZIWZPmJJOfUr4x+N3jhTyetRa2YTZOmZBiwusqcoLISyjopO1bgF6+q5sg==
X-Received: by 2002:a05:600c:55c7:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-4409c4615e0mr38383615e9.6.1745564933891;
        Fri, 25 Apr 2025 00:08:53 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ad112sm46202735e9.24.2025.04.25.00.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:08:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 09:08:13 +0200
Subject: [PATCH v3 2/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 PTN36502 redriver
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fp5-pmic-glink-dp-v3-2-cc9c2aeb42fb@fairphone.com>
References: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
In-Reply-To: <20250425-fp5-pmic-glink-dp-v3-0-cc9c2aeb42fb@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-usb@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add a node for the "Type-C USB 3.1 Gen 1 and DisplayPort v1.2 combo
redriver" found on this device.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 35 +++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 0f1c83822f66f95b05d851a5d28b418ff048b09d..ea9f5517e8a083e37c4b7432322bd6d18fea84a5 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -166,6 +166,23 @@ vreg_oled_vci: regulator-oled-vci {
 		regulator-boot-on;
 	};
 
+	vreg_usb_redrive_1v8: regulator-usb-redrive-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_REDRIVE_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_bob>;
+
+		regulator-boot-on;
+
+		pinctrl-0 = <&usb_redrive_1v8_en_default>;
+		pinctrl-names = "default";
+	};
+
 	reserved-memory {
 		cont_splash_mem: cont-splash@e1000000 {
 			reg = <0x0 0xe1000000 0x0 0x2300000>;
@@ -747,7 +764,15 @@ &i2c2 {
 &i2c4 {
 	status = "okay";
 
-	/* PTN36502 USB redriver @ 1a */
+	typec-mux@1a {
+		compatible = "nxp,ptn36502";
+		reg = <0x1a>;
+
+		vdd18-supply = <&vreg_usb_redrive_1v8>;
+
+		retimer-switch;
+		orientation-switch;
+	};
 };
 
 &i2c9 {
@@ -1182,6 +1207,14 @@ sw_ctrl_default: sw-ctrl-default-state {
 		function = "gpio";
 		bias-pull-down;
 	};
+
+	usb_redrive_1v8_en_default: usb-redrive-1v8-en-default-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
 };
 
 &uart5 {

-- 
2.49.0

