Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903869;
	b=y9kGvOKZHClGQCkitOG0wJasA1RJvqdiir9Tt9tPOx1rlSVQyxsQRsz4WEHw6qbUbANp
	 J9UXqtzOY2SCUB8wCwgiPNKU0h8nxmgoo89qtZszlj19KmpohTHkOozYidsgNWxM1ALaN
	 SEkRks2CoSY5c5mcViZIArMVJ7knlZp69W6bSAucSWAAR6DUXwW5sNWSrF+o3ZVlUKKbd
	 4jAnJ8RaeAAwJTt8JZeIV/g8EdUvqqzM3RM3a2XTbuHEdLXSCRDwBSX9eWBpZkW+fwNoZ
	 JjvmeMCtKIGKbSa+4azMMq8p6ifMgFprO0/UHOF3lkWWgOBVZAiPB4MJzLrsEuh8mEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=EgrVZa2eZmqWGHTSXzSBkx9rK3FiMfFpfyVDiLiMkq8=;
	b=cH/G6ns2uYRGMHczF/NyoMDJYbQHrLrTuwb4BLmalkj8OmUIsrdovrJFTYRXvI1sEw2u
	 crO+jDsVZDZTB3c0V/7vm8wNeDDpi+Ec9NCtztCnQnFG3ylI1qlxY2xOHBoAYRCpQbXBP
	 nmGlEqo33vnASZ/ng68ilFS/fET7OFk0u7J9LpGEpmpScX10O7tmBAsqvr72PVVUlgNUg
	 GgtbLEz6OQu+7cmJsKIjkuct2TDgfDXcrbCpRJ6RhcfJrHMQlqGHLiCHNyrwj4v8ugqWE
	 nJHhJg6NU6TGJ/3WZPqZSErSBf7bnyaK4CWhABiU4k6EppAkB0ay1duyeSVDxHWuVCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=qJ0w7yjt;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8826606A8A8
	for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 08:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8826606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=qJ0w7yjt
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b807aab44fso2595336a12.2
        for <phone-devel@vger.kernel.org>; Tue, 17 Nov 2026 00:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794903867; x=1795508667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgrVZa2eZmqWGHTSXzSBkx9rK3FiMfFpfyVDiLiMkq8=;
        b=qJ0w7yjtJE1lC1zKPwOibwHew9VyeF40XwkE7/3yvx5PT+Ju5NAaJ4PAYpSd+gwHGY
         w7cc1v7y04SypaBVvpt0FdJ28SLaaLsSZoQeNlJY+q4fNMRgEosPLHV3CHWwRikNnAx1
         GmpPsBD7FywbCP4QoC/tQcG+Bwl3jGw0dQYN3ntPTRr5NsIOkJK7aiGBYTPyHA9B3Yhf
         m9wg2+ELiGZz1v/ioIhxWmVh2DL4jz1BZ6oJLEFOPFEMV0/0NSkxHHhQAeV0VysiAjI7
         ZrbLuE9PTGnkywNGKg28gayA6JsZ5rWJo/l+NwLWZQZynBQktGrHxtKU7fZkqerZZW1Y
         G6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903867; x=1795508667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgrVZa2eZmqWGHTSXzSBkx9rK3FiMfFpfyVDiLiMkq8=;
        b=uuVX3W8viQqULy1YQ4EuQGPVvIWGpo2tCl1QAWp/K3SYJ7bc1jEEWhL2aBxUdBijsD
         fmWcQZva+tK2FeWxpAOhbXkLb0JfT5yf6ROuFffg12xdelUenTlhUde3QJcj9y3HdJVT
         i5+t30WrHBeAo9ouumS3Z4Q66q/D4B8PWDvlp+OEq3OfuWBGpsE+9OahWrzOYb4Rvokd
         I93GB97cVDadcFdMB4faKeBjAHgEdqKyyNMHOBn3t7J5D9jsWWC2YQNIoSBKDtOq9jjx
         emPeImmEcuUNEH7em3fpfbL2OB/Ym37Hgp+bRZmfTqVGgnyIrnC8tkzOWWrl/2Sncnoi
         6now==
X-Forwarded-Encrypted: i=1; AL+hErEvT0H5yziutdvrJiVk0gswL2R6IiMijxk7aTORgPssaL3y4ywkDtj9oEL115RIPUppuXwN36sBZ6BS/g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8i20A1FZvprbkje80Dw6kTraxZ28CyrxYY5B82S+8n+gS97DW6
	PDUOE5M6z8KjnzpskN3+2wZ9O8tm144JGhGo32Uf5pbDJmiLrI0K0Wy3QeszL+nIHls=
X-Gm-Gg: AYBFou2mgq0GBfF+tTYMtCaYC97drGsTrnoU1lGniCBlKeZ6H0CXyQPVe3EWvv7a3RD
	1Bq9ZLCUX+/89mufO00Mxt0YAFIfY1jv15ZWI3GCWqqKO6scRYeN0in06HvCn6uxHVYwIQ3y+Jr
	Luimi1avN6LMmS2TZ4a0YrEkAxpX/rVQ66PLo2LFeDNPV78JiDY+m212mHV9uafrhUk0AnvREYO
	4dpi/opbfktSyhLEHRbCjSiNAm8pYxowa2wVe2AhCya7R+49yzyO570wQCl6/RCqp5Bxm207JdF
	kvrSHdl9MsUpStSerxicUqzVRqoqWwI5+wWyEV7N1nhaa5o6SD90mKiupC4rzuLDO+dj3ktirEw
	ojIEgtrDwulx38FNs5e8Oba6cvpxPrSa8xifoWwivc33eCHLJWZ+14PbG/zB/zjKf+I3MPyc0oj
	rFepi9zQZf4k5r0NmbunaA1NIsFjZwe7tADV3ssAC2+RfcMKevidSl94bqjroPZSONaQKgbqD2Z
	KGb3jQ9McgYue84G2eFORCPWjm6pXjsGReNwti8f/Z2f6lP9LJiJsA4HkLIvvnaCCHqJuSsCdm1
	eBrmS+IVBo7S3wYRPD23kTGOmNZ0CH9Iq8OE8lufouoLlsTzP9mUvkLBJXSQ0fPWfQyZf47MBtM
	mDJjvJNcBvAFfSxGNbu0gtIE3LPDlGiJyHcbyZEC5Vnu6Z31a
X-Received: by 2002:a05:6402:88a:b0:6b5:5530:c9af with SMTP id 4fb4d7f45d1cf-6b7c0bb79ebmr6791992a12.15.1794903867414;
        Tue, 17 Nov 2026 00:24:27 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5616953a12.9.2026.11.17.00.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:26 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Nov 2026 09:23:13 +0100
Subject: [PATCH v4 3/5] thermal/drivers/generic-adc: Allow probe without TZ
 registration
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
Message-Id: <20261117-bat-temp-adc-v4-3-14d5d309ebfa@fairphone.com>
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
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794903862; l=2598;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=IewvetNZMf9FalFWEd0iq4I/lCqxZHq/FLtsO53H2jA=;
 b=K0QTEVwf1uzSjckbKxKpcCKrAkkngarK9NjPv21hTvhJ9thkoh3P+WGons6vpo/CWOd5JylkV
 h4KSZ3LpFcKCi0kZt4zAzExS9pRPsxol5yvMrSY/2FHbt73E/Xe8w2m
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

If the devicetree node is not referenced in a zone under /thermal-zones,
devm_thermal_of_zone_register() will fail with -ENODEV.

Since the driver is now also registering as an IIO device[0], allow the
probe to continue without the thermal zone.

We also can't use gadc_thermal_get_temp() anymore because we haven't
necessarily initialized tz_dev.

Link: https://git.kernel.org/torvalds/c/3762f5851ac5 [0]
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/thermal/thermal-generic-adc.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/thermal-generic-adc.c b/drivers/thermal/thermal-generic-adc.c
index c6a7a65aa6a6..b73cd47bffa6 100644
--- a/drivers/thermal/thermal-generic-adc.c
+++ b/drivers/thermal/thermal-generic-adc.c
@@ -55,9 +55,8 @@ static int gadc_thermal_adc_to_temp(struct gadc_thermal_info *gti, int val)
 	return temp;
 }
 
-static int gadc_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
+static int gadc_thermal_iio_to_temp(struct gadc_thermal_info *gti, int *temp)
 {
-	struct gadc_thermal_info *gti = thermal_zone_device_priv(tz);
 	int val;
 	int ret;
 
@@ -70,6 +69,13 @@ static int gadc_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 	return 0;
 }
 
+static int gadc_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
+{
+	struct gadc_thermal_info *gti = thermal_zone_device_priv(tz);
+
+	return gadc_thermal_iio_to_temp(gti, temp);
+}
+
 static const struct thermal_zone_device_ops gadc_thermal_ops = {
 	.get_temp = gadc_thermal_get_temp,
 };
@@ -90,7 +96,7 @@ static int gadc_thermal_read_raw(struct iio_dev *indio_dev,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_PROCESSED:
-		ret = gadc_thermal_get_temp(gtinfo->tz_dev, val);
+		ret = gadc_thermal_iio_to_temp(gtinfo, val);
 		if (ret)
 			return ret;
 
@@ -193,16 +199,13 @@ static int gadc_thermal_probe(struct platform_device *pdev)
 
 	gti->tz_dev = devm_thermal_of_zone_register(dev, 0, gti,
 						    &gadc_thermal_ops);
-	if (IS_ERR(gti->tz_dev)) {
-		ret = PTR_ERR(gti->tz_dev);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev,
-				"Thermal zone sensor register failed: %d\n",
-				ret);
+	ret = PTR_ERR_OR_ZERO(gti->tz_dev);
+	if (ret == -ENODEV)
+		dev_dbg(dev, "Thermal zone sensor register failed: %d\n", ret);
+	else if (ret)
 		return ret;
-	}
-
-	devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
+	else
+		devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
 
 	return gadc_iio_register(&pdev->dev, gti);
 }

-- 
2.56.1

