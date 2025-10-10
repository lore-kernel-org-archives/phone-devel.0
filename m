Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFC02868B8
	for <phone-devel@vger.kernel.org>; Fri, 10 Oct 2025 11:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760095439; cv=none; b=r2oMblE/lYV4lOCdxClNJpzgwjKa9OcKupjoxLELGSBuF/N/RwwAAZR/Zy6LHyzXhdgMetOitoz2scHTMuKWFpCC4hIeHKMgVjEqjmRgTrz3I3tzsa/vXIxf6D6K2MGDjyG6rGIk2M+Rp4GPVRu+AF24ss7RIRECzg1qEAOjt0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760095439; c=relaxed/simple;
	bh=aq/4LlBtdDV9fwTGsuaPOpu5GJBcvTjlliJW466UN/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+7FOjU/B5G7W4+/SIVdHZrtPae8ScJzT/kawu+WtsdS4YNLitZE+HFd4VyOZifQs8miGrE51/uicF2k0Ipi58AtF7JV8oqe6yUa/KQRDPOY21PH/hp24LwdC3WPrJKuGOS2uN5hdrjuET/kZA4HxLlPHzlZ3nKpo1fDtlAWY+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ptSE5Hjz; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ptSE5Hjz"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b48d8deaef9so352684866b.2
        for <phone-devel@vger.kernel.org>; Fri, 10 Oct 2025 04:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1760095434; x=1760700234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xbHU47lVJvPoAqNYQLf5z1X0/coxYDZLmDD+Zs19Aq0=;
        b=ptSE5Hjzhl7uTbavQpg6W3FOgMvpAYNLiJOawlMh51IedLTJ2OAYYf6N4oWs6DPoTi
         lsJa5N94AhYwvvu/JqjENZ4Vu5os6cqtcHuH+pqNos9GrNXkriYpK8+m+4ZVHxSBLwiM
         9LI3l8X08GfNwSQbd1MRPnS0heorG1q9wK45OxzahggJMig7etSJA2iAOuVjTSOyyK9g
         AyLBYZZKYo9FdesyyLeskUR0v2060gXg0meG2adAJNZ39i8ghI2Cdzbq/p3gtnjJ2nNJ
         wbqaGyM98qlLbtv6xvnGjSp7mzP2ExrG7wTfLzlCxL2hKtcTwkd8rtHb2q6WVeRhQZE3
         Af4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760095434; x=1760700234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbHU47lVJvPoAqNYQLf5z1X0/coxYDZLmDD+Zs19Aq0=;
        b=DgnpCe8DXevy120mtBJ7kPl0JJ1gfgmkqtIx8LdtRuj9EfeG9TJ7SPVOn4WzbacqSV
         MM1XQYfYT/SU+5eDD8354F8gKWRvCtziJh37JKIjcXpbJIxASI1sdMoTempuxSX/W1eo
         Lniw0INk1zyMLwXR+RyrXSx4P5Qva9eAxDsBStakPVDMfiHYJu8hGkDMpQFofWemboCp
         qlsv4xv8z9zLfNVDPI2cKgvaE8siiBmet4ZqjMybJd14iRQG9ZM5x9dqlma33b0+cba/
         pgmYoSKQ/b5FugluY+jukW5FvzsnGdq89bub1SIKqgzzRdrECCdhT5X0nTHiSHiQ4uiX
         WViw==
X-Forwarded-Encrypted: i=1; AJvYcCWkyp8RBHgssVLVFkIlk9Zm/OYT6EhKwn2nYNs54GchynmbrJXd4Gb/lw+CpklJyhFBg5ErS3Y6lSZA4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh43Ps5g5fe+Q7/XWKrao+0Z5tm+f62eiX5o03lfT7kApIqgw6
	Fi8t63cjacGwHw++PpAaWgGLSHO7BXK6gTxqeSSCIyvjH3wzTsmzD8h6J4MTrZ5A2Nw=
X-Gm-Gg: ASbGncsRNmShGIl7NNRE0EQCweUL3Cv7+XIYIQT2TJEhwxRNIP/ym/OtThg6IO8Wzmb
	TfMC3WeLFKF4wZhQMsGRjw5WMTUk4SWe9jnybBLHLqaLbsGUBQu5/QDnfDJMGe3qD/bpw9lIZV6
	Gob4XG6TTU0UQx8XK8UAG47Fq/ekTdDUewDFdfk3ynmRKQVBvcfGX7KRgeK4W6z9LLmjlD3oPAp
	3cZu6j5oF8H2mgiDJH8xd1z8IW3SZXt25CqJh8Fw7eYXzavrSi0qJVa3jGVJp/+pxsAFLS7Ddrq
	H5Gw8/sWfZ6wg9e8449nK9hvGWrCWlHNILdnghFVwWSfa4/io9eK6pPIKaSHr5Y/uhUJnVO6Eey
	CA9AVS3km78L6vwWZFrUVHxfbIdS78grmnPBSzniZYVCEgvyu1aBRZB7SQZ7qi4BctdJFap602c
	0wjDbtRDmMe+N04Zgk8cQ=
X-Google-Smtp-Source: AGHT+IEGGOcXMfbfok1PgzreNouwnXwnOxKHke/yHbjyLVTMxF0ZeD3AzIE5Lo/WXZ+3jpLEgrXUlQ==
X-Received: by 2002:a17:907:7f0e:b0:b48:44bc:44f2 with SMTP id a640c23a62f3a-b50ac8e52b0mr1079525366b.43.1760095433928;
        Fri, 10 Oct 2025 04:23:53 -0700 (PDT)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900bf8csm209905766b.59.2025.10.10.04.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 04:23:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 10 Oct 2025 13:22:02 +0200
Subject: [PATCH RFC 4/6] thermal/drivers/generic-adc: Allow probe without
 TZ registration
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-bat-temp-adc-v1-4-d51ec895dac6@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760095429; l=1291;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=aq/4LlBtdDV9fwTGsuaPOpu5GJBcvTjlliJW466UN/o=;
 b=g8H90MmiVQbUf34k7FO9FschEuUpZ8+riafTdgCUcqiIfMwO8Gl+ddsWuyUlJKZ5GMtv0OT0Y
 CC07fjXLbWRAMXyYnitoWqrLXpblN5+yM5fIh5ZBkqstAtSmldwJ1G7
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

If the devicetree node is not referenced in a zone under /thermal-zones,
devm_thermal_of_zone_register will fail with -ENODEV.

Since the driver is now also registering as an IIO device, allow the
probe to continue without the thermal zone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/thermal/thermal-generic-adc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/thermal-generic-adc.c b/drivers/thermal/thermal-generic-adc.c
index 14aef682e0fb..d31533927be6 100644
--- a/drivers/thermal/thermal-generic-adc.c
+++ b/drivers/thermal/thermal-generic-adc.c
@@ -183,14 +183,14 @@ static int gadc_thermal_probe(struct platform_device *pdev)
 						    &gadc_thermal_ops);
 	if (IS_ERR(gti->tz_dev)) {
 		ret = PTR_ERR(gti->tz_dev);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev,
-				"Thermal zone sensor register failed: %d\n",
-				ret);
-		return ret;
-	}
+		if (ret == -EPROBE_DEFER)
+			return ret;
 
-	devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
+		dev_info(dev, "Thermal zone sensor register failed: %d\n",
+			 ret);
+	} else {
+		devm_thermal_add_hwmon_sysfs(dev, gti->tz_dev);
+	}
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
 	if (!indio_dev)

-- 
2.51.0

