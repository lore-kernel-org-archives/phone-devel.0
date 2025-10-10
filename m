Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0CF2EFDAF
	for <phone-devel@vger.kernel.org>; Fri, 10 Oct 2025 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095439; cv=none; b=b1yoB0bPZ/JDUdfF08qbfv7VQ2JMlmOgG65IocJMLKLq+BCG07AymEifysEtDbPvX5wM0ftK9zeDz+NYOKvQhQp6MZTSrLGVgwxTIr5WV/IyPgGR9+ayB9yEkZhf1uKiPOSBaiQ2b2ZBQEh/5zcwJe1QZBWZlmLndVuy6tFPT5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095439; c=relaxed/simple;
	bh=JpYLHBppDURESW3oGd0+8XBXaU0yfTl1Z8DessSgdAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S86WdTJN+MpVDYWtAe0VDHiQH1VGeQmc30+AMe77MvGfBD6yzgTeH9dRLxtlaKBKCmCUZnCKQ4iOv3lLQenIuwAh0w5Uh6jP06FQZTekmZhcDV69VdRjF+Ip430NHU/BoFVQWNiy/N9QlNPhZ29jEzbxcxsiBubuE62M1ZAts1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Du9tIdLH; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Du9tIdLH"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b463f986f80so442775266b.2
        for <phone-devel@vger.kernel.org>; Fri, 10 Oct 2025 04:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760095435; x=1760700235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YlEbSwGOzNwkU6KFYMavrAYJ9rwkM5KnTfqRG4W7Yk0=;
        b=Du9tIdLHG5n4hWQXmqD0J6mBBfrCWf/jb6B1w6jPHyGyHRSzvgc/z8feaARj6l5HxQ
         omxK+ZpiYmBqoJJI0Bg0svNuDlP6jGDVTZLyODbX1Al6udzzX2QgfJII4qoqreE3m+nv
         F6Q55cRHMADNPFKFYjtz4yUwC8rWC0KawqnDBY8m4aloVevW3E0ZbTUJcqQof1O+FHTP
         sTo7d644fpYr04nG0eHGVjrRTTLHGKk45ZHCLtIvqmIwvZv0JdOh5/evT+3WQYI5HWbp
         M0Wd1tvrzlUTPiIdC7aluYE6CgknPtPX1jNsmi39O6Tt4yvIZ5KcuiNE7G+BukJQdk2x
         fcQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095435; x=1760700235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YlEbSwGOzNwkU6KFYMavrAYJ9rwkM5KnTfqRG4W7Yk0=;
        b=jR+RlP0+XGYON7jnFIpoFbLWnXXcXJ5NPrsBN+gPnGsUENKinPxdGfNSw7ceSW/cfP
         T8KidjXMouEOU4z/bYwpiWUdgEuuDOc4cvppLfngeZCRESj0PgaNOFS10ILQHuTaP/fC
         +/bCOOFnLe1vG5TLnH+x+afRvWq9bSTMPu2/meiv0nlM3FgOH11C9mXINQb85riCJGJq
         wDvA35/Bx1FRB+KrIABWUS5NeBz44Fz5EjPvU1CSMA72tgtZaVxwSYj/gvgDosLG3atI
         YjrlKcsPaCqDV3HRYRCAUefK6TRALitB24+WMdKRf1ej5aS+0+As2glg/0epB0NyOvl6
         CwHg==
X-Forwarded-Encrypted: i=1; AJvYcCXskbIJQV04k42A85NppGb3b3kINVdaxD7dB6N0RwzMO+s+64QwOvN/UYCYt/8rtrtcmB4fnkphidNNpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPSXYWEOHVny1T8dQMiTN5Es6x7ZDa0919zQ8gBFm6woAXQoyX
	Lj4NcIL1FGaSor0OgG+9fbxrmlen4UJSZl0G+Klz7E+IMjFgvJ5RFVAVVtLzba9YRd4=
X-Gm-Gg: ASbGnctDq+WI18g80O60Y19dy1iznPbtykKJ8eIh4YsX4GC+WnEEpChkqM3ZocY72oF
	kkh5p/H5PulhWiSMDgBYfjfYCQ2M3h3aoiaE9Reu9Og1BeH0E0VWOmCNQ829MZnr8zUoM2chU5l
	EIzzmJsr3j5MNRxcUNzaObQ6EJEebDSg/NAQ5xqhqAnFW/6vYdAyeGNu9Efq4+dAoM7/tkVKtGN
	ZlI1lxNZluNJy8tGXejBzQYgo+njodbsCef4R4r0Gy9VIqDmff+jjJdmaj20l1fmtPBZ/1vzR/w
	Dg4KEmKPekSwTOcURBtboUwwx9XSJSSmtlwblEYM9xxwyVIzjWdrOIB3HzhE5gwVnmQTAGhJhKN
	T2vMMVR3yy5SdogLBAA+sr1r6nELxLkDcjwyMJ8XG1A4hRIs3GzkHSftsHupmYn/6Xa+GbUo7Cl
	kLXTGV+xW6RUdJQ0+7ub+olY7q4SUUgQ==
X-Google-Smtp-Source: AGHT+IFtOKOdgJ4dWifHMxzpmdJ6iqSE5R85wkeuGb0qbSbozu5nIiJKB5e4xe1EX1wTlhX9Ev6i4w==
X-Received: by 2002:a17:907:3f1c:b0:b47:2be3:bc75 with SMTP id a640c23a62f3a-b50ac5d1dd9mr1201041566b.60.1760095434892;
        Fri, 10 Oct 2025 04:23:54 -0700 (PDT)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900bf8csm209905766b.59.2025.10.10.04.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:23:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Oct 2025 13:22:03 +0200
Subject: [PATCH RFC 5/6] arm64: dts: qcom: pm7250b: Define battery
 temperature ADC channels
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-bat-temp-adc-v1-5-d51ec895dac6@fairphone.com>
References: <20251010-bat-temp-adc-v1-0-d51ec895dac6@fairphone.com>
In-Reply-To: <20251010-bat-temp-adc-v1-0-d51ec895dac6@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760095429; l=1351;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=JpYLHBppDURESW3oGd0+8XBXaU0yfTl1Z8DessSgdAI=;
 b=qaGcfuqMeIg0Gum2+/UPS5v4Y9LiQtlhFI2337haSWnu56uZivPuiS4BHaj9sRq1e3k7jqyHN
 I7QA72rmAs+AefjACqzZcd5Wft8+6p0hD4VGXSrzyDehfZ0EKOjSYQp
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the definition for these ADC channels to the PM7250B definition.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 0761e6b5fd8d..c96089520548 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -156,6 +156,22 @@ channel@1e {
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
@@ -164,6 +180,14 @@ channel@4b {
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
2.51.0

