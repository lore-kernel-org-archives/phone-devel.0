Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756BF31ED62
	for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 09:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771579159; cv=none; b=DYTKEWDAS7QNywSAAk9xDVOhnKyn8EM+IgBFucH1vEtd9nkch0NDahfPr6M5whJW5Ebbf7iCFXXWFZPaYtpICqJHFdYNea2RY7pkENHbDuX6Uv+O8A/MGkZe3wdbMBUX5j1FBjPM8CgviUQQZ/+SSXm2uScXGktYNa/ZhQULgy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771579159; c=relaxed/simple;
	bh=K+CqafRoNbhWJwidHtfefGL/lwKA1vM+TFJ7gUSVsFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QyZttXMrWns04LzK1g8hYPcBvnOnHvPvxLHAbTRhyAmAHUb3Y8gdmt+5QGoYa979XhDcGiODBJqpe2ihYJzNVo85H7s6NEk8Dasnjol9+GPRJMxmKqpnu7gIZCD7aas4MJi8rWHEsLUriOdipNu8hWnEU380Q4RYbLNqwso8OFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4JKgATCQ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4JKgATCQ"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8f992167dcso237531866b.1
        for <phone-devel@vger.kernel.org>; Fri, 20 Feb 2026 01:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1771579156; x=1772183956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Az2Gne89A6GAMjOY0VwKNFOpXMxXx7RlCCQf3uV3H/c=;
        b=4JKgATCQvopyFKpt+KBch3EHlJkws120YJToW0tpiyA1nSmmGUIs6P4mXvO2V5Dq8+
         NNoPucW8Vcq3G0s/twkLNye43PHJYoXnrGMWPIAKQ/xi1/nzAtXkpEHHfQu4EZ5rxUON
         JBblaUwBQwk26HPKXpA+aZJ+2EsAUge9ryNoqXos7WeIj7hu758xbPiVAUULKn2pQzZc
         ztECTvvD1+gkGxQ/8ViDavdiSc1Wu4APvedxuy1VBv8MQ2LOI9bBdvj2BG95Mtrak0wa
         s5BqXKo6J+UOZlvvDiri+2irK6zfZxHmkjKc2msXSyFQAICWmOiLamfAoU1pvljXvgXL
         gSxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771579156; x=1772183956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Az2Gne89A6GAMjOY0VwKNFOpXMxXx7RlCCQf3uV3H/c=;
        b=P6jgQxBHqXj8VHgd0Y4aid9IScfC8MO9r1XKxw3B0qAMAMhxEK8cjhdlOsqhdBPXMh
         NH4bd9mPX5PK7BR7qh6z8ae6n+j1CJImlPj6ZXfkoXmA/67YaLyTWNwm0uE1RhN39tzU
         SMYPcvE7qr5uoN2RHe6aoHHS2wXcSkRhF5rxenTFb2PycbPgFq+8d8pcZhJizskif+V9
         su6+pu1ZuTNbO9IpaEWwGJSuQpok/9X1d5BRVX0bm59SxiHT5VJgX9uW3e7kCWgbx6/s
         LMNb5yFMyfAg2LuTtlUkJz9EbMKKpzyV1nw54TUscR67ZGbZwbQKBnkUfcfjfBb+A0hn
         ZrTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWShGbG6qykXAoJ81g68Qp3BWm3SfTbfv8qXpgaGqSilRO2jLmsFH6udSvcwddqQDl2aklsDmNLNG3pYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrZZUvlH59M1w828JqqRE6dSB+CQlAOHle9d/GwEPjHJECirKJ
	JrGV7LckMiQd4AmZx135ShGtR0jn8WMQ3H0Xe9N2InZ6KnaVZDoYEvUcLsC+jRskB+Q=
X-Gm-Gg: AZuq6aK/GFf4C6dpLQAhkKiYPiuc70pgaterNyxMhH7V83BCgtVgS5QpbKS4ih9Gvlx
	fPac5ptmqvg3QYiDInvA3po7N1d95QWnkiVta4hpM/7qkOOUebierkhHBXd1Ag7HeIsiyJt8T2a
	NzRmEMaJrBjRGTJles3U2cM41HzcduUfEsV+b5b7PpkRzPymanIoIfsIFuaeGcJYbbs13ceoPxK
	CxCJ8guU0KsjnN+4O94IsODMbk/XH1Y9ts8y2k6+v9Vdv5CTWrISvnrgV9iC9EBj66+HUOZUTUE
	woOEulxv/nk3JD9iP0Q1bg1OgycJmpRcjc+RnF6i9Lx3Ye+NzJ+667R7hD/rGnlHM2gqoEiqwCC
	V+q4suyAZOxWCg/o6o9z/5hWTcJtQmj1tCcyrHNRw0ovYdaiw+Vg/aegZd7gki0cPudXoMLUC6q
	iRNi751KrU2OxVLqK+F1sIWcm3cYQ/chg7ILJ3q+kW2unNW3rxVlNbzxXCWoCBtuh/+zMzG5ECn
	8J9+A==
X-Received: by 2002:a17:907:1c82:b0:b87:4c74:b316 with SMTP id a640c23a62f3a-b903dcbe5a5mr464115666b.50.1771579155584;
        Fri, 20 Feb 2026 01:19:15 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc769111fsm667098666b.57.2026.02.20.01.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 01:19:15 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Feb 2026 10:19:09 +0100
Subject: [PATCH v2 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Add battery
 temperature node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260220-bat-temp-adc-v2-5-fe34ed4ea851@fairphone.com>
References: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
In-Reply-To: <20260220-bat-temp-adc-v2-0-fe34ed4ea851@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771579150; l=2583;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=K+CqafRoNbhWJwidHtfefGL/lwKA1vM+TFJ7gUSVsFU=;
 b=bu3/bXdv1SzWAXZKad3hnvwcT01WCRp6k2YidE2fc8+ocu3bhuTYKILbH5aznpEdD0t8v60nP
 oL7v7df2/LLCKw295K/bCQbnS5DjwDm+Xbcn6XugLRaQ4oaHLEMbI/e
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a generic-adc-thermal node to convert the voltage read by the
battery temperature ADC into degree Celsius using the provided lookup
table.

This will later be used as input for the fuel gauge node (QGauge on the
PM7250B).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 83 +++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index b697051a0aaa..7857003099a6 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -108,6 +108,89 @@ rear_cam_sensor: thermal-sensor-rear-cam {
 		io-channel-names = "sensor-channel";
 	};
 
+	bat_therm_sensor: thermal-sensor-bat-therm {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		#io-channel-cells = <0>;
+		io-channels = <&pm7250b_adc ADC5_BAT_THERM_30K_PU>;
+		io-channel-names = "sensor-channel";
+		/*
+		 * Voltage to temperature table for 10kΩ (B=3435K) NTC with a
+		 * 1.875V reference and 30kΩ pull-up.
+		 */
+		temperature-lookup-table = <
+			(-40000) 1673
+			(-38000) 1649
+			(-36000) 1623
+			(-34000) 1596
+			(-32000) 1566
+			(-30000) 1535
+			(-28000) 1502
+			(-26000) 1467
+			(-24000) 1430
+			(-22000) 1392
+			(-20000) 1352
+			(-18000) 1311
+			(-16000) 1269
+			(-14000) 1226
+			(-12000) 1182
+			(-10000) 1138
+			 (-8000) 1093
+			 (-6000) 1049
+			 (-4000) 1004
+			 (-2000) 960
+			       0 917
+			    2000 874
+			    4000 832
+			    6000 791
+			    8000 752
+			   10000 713
+			   12000 676
+			   14000 640
+			   16000 606
+			   18000 573
+			   20000 541
+			   22000 511
+			   24000 483
+			   26000 455
+			   28000 430
+			   30000 405
+			   32000 382
+			   34000 360
+			   36000 340
+			   38000 320
+			   40000 302
+			   42000 285
+			   44000 269
+			   46000 253
+			   48000 239
+			   50000 225
+			   52000 213
+			   54000 201
+			   56000 190
+			   58000 179
+			   60000 169
+			   62000 160
+			   64000 152
+			   66000 143
+			   68000 136
+			   70000 128
+			   72000 122
+			   74000 115
+			   76000 109
+			   78000 104
+			   80000 98
+			   82000 93
+			   84000 89
+			   86000 84
+			   88000 80
+			   90000 76
+			   92000 73
+			   94000 69
+			   96000 66
+			   98000 63>;
+	};
+
 	thermal-zones {
 		chg-skin-thermal {
 			thermal-sensors = <&pm7250b_adc_tm 0>;

-- 
2.53.0

